/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Dict, Keyset, Str, Tuple, Vec};
use type Facebook\HackCodegen\{
  CodegenFileType,
  HackBuilderKeys,
  HackBuilderValues,
};
use namespace Facebook\TypeAssert;

final class CodegenRelations extends CodegenBase {
  <<__Override>>
  public function __construct(
    private string $hhvmRoot,
    Schema\TSchema $schema,
  ) {
    $relationships = dict[];
    parent::__construct($schema, $relationships);
  }

  <<__Override>>
  public function generate(): void {
    \HH\Asio\join($this->generateAsync());
  }

  private async function generateAsync(): Awaitable<void> {
    print("Generating file list to infer relationships...\n");
    $files = $this->getFileList();
    print("Infering relationships, this can take a long time...\n");
    $done = new Ref(0);
    $start = \microtime(true);
    $queue = new ConcurrentAsyncQueue(32);

    $relationships = new Ref(dict[]);
    await Tuple\from_async(
      Dict\map_async(
        $files,
        async $file ==> {
          return await $queue->enqueueAndWaitFor(
            async () ==> {
              try {
                $links = await $this->getRelationsInFileAsync($file);
                $new = dict[];
                foreach ($links as $key => $children) {
                  $relationships->v[$key] ??= keyset[];
                  $new_children = Keyset\diff(
                    $children,
                    $relationships->v[$key],
                  );
                  if ($new_children) {
                    $new[$key] = $children;
                  }
                }
                if ($new) {
                  await execute_async(
                    'hhvm',
                    '-vEval.EnablePHP=true',
                    '-l',
                    $file,
                  );
                  foreach ($new as $key => $children) {
                    $relationships->v[$key] = Keyset\union(
                      $relationships->v[$key],
                      $children,
                    );
                  }
                }
              } catch (\Throwable $_) {
                // HHVM and Hack tests intentionally include lots of invalid
                // files
              } finally {
                $done->v++;
              }
            },
          );
        },
      ),
      async {
        $total = C\count($files);
        while ($done->v < $total) {
          await \HH\Asio\usleep(1000 * 1000);
          if ($done->v === 0) {
            continue;
          }
          $ratio = ((float)$done->v) / $total;
          $now = \microtime(true);
          $elapsed = $now - $start;
          $rate = $done->v / $elapsed;
          $end = $start + ($total / $rate);
          \fprintf(
            \STDERR,
            "%d%%\t(%d / %d)\tExpected finish in %ds at %s - concurrency: %d\n",
            (int)($ratio * 100),
            $done->v,
            $total,
            (int)($end - $now),
            \strftime('%H:%M:%S', (int)$end),
            $queue->getCurrentConcurrency(),
          );
        }
      },
    );

    $cg = $this->getCodegenFactory();

    $cg->codegenFile($this->getOutputDirectory().'/inferred_relationships.hack')
      ->setFileType(CodegenFileType::DOT_HACK)
      ->setNamespace('Facebook\\HHAST\\__Private')
      ->addConstant(
        $cg->codegenConstant('INFERRED_RELATIONSHIPS')
          ->setType('dict<string, keyset<string>>')
          ->setValue(
            $relationships->v
              |> Dict\sort_by_key($$)
              |> Dict\map($$, $children ==> Keyset\sort($children)),
            HackBuilderValues::dict(
              HackBuilderKeys::export(),
              HackBuilderValues::keyset(HackBuilderValues::export()),
            ),
          ),
      )
      ->save();
    print("... done!\n");
  }

  private function getFileList(): keyset<string> {
    $hhvm_dirs = keyset[
      'quick',
      'slow',
      'zend/good/',
    ];

    $hhvm_tests = Vec\map(
      $hhvm_dirs,
      $dir ==> $this->hhvmRoot.'/hphp/test/'.$dir,
    )
      |> Vec\map($$, $dir ==> $this->getFileListFromHHVMTestDirectory($dir))
      |> Keyset\flatten($$);

    $hack_tests = $this->getFileListFromHackTestDirectory(
      $this->hhvmRoot.'/hphp/hack/test/typecheck',
    );

    $systemlib = vec(
      $this->getTestFilesInDirectory($this->hhvmRoot.'/hphp/system/php'),
    );

    return Keyset\flatten(vec[
      $hhvm_tests,
      $hack_tests,
      $systemlib,
      keyset[__FILE__], // see syntaxExamples()
    ]);
  }

  private function getFileListFromHHVMTestDirectory(
    string $root,
  ): keyset<string> {
    return Keyset\filter(
      $this->getTestFilesInDirectory($root),
      $path ==> {
        if (\file_exists($path.'.expect')) {
          $expect = $path.'.expect';
        } else if (\file_exists($path.'.expectf')) {
          $expect = $path.'.expectf';
        } else {
          return false;
        }
        $out = \file_get_contents($expect);
        if (Str\contains($out, 'Fatal error: syntax error')) {
          return false;
        }
        if (Str\contains($out, 'as it is reserved')) {
          return false;
        }
        return true;
      },
    );
  }

  private function getFileListFromHackTestDirectory(
    string $root,
  ): keyset<string> {
    return Keyset\filter(
      $this->getTestFilesInDirectory($root),
      $path ==> {
        if (!\file_exists($path.'.exp')) {
          return false;
        }
        $out = \file_get_contents($path.'.exp');
        return $out === "No errors\n";
      },
    );
  }

  private function getTestFilesInDirectory(string $root): Traversable<string> {
    $it = new \RecursiveIteratorIterator(
      new \RecursiveDirectoryIterator($root),
    );
    foreach ($it as $info) {
      if (!$info->isFile()) {
        continue;
      }
      $ext = Str\lowercase($info->getExtension());
      if ($ext !== 'php' && $ext !== 'hh') {
        continue;
      }
      yield $info->getPathname();
    }
  }

  const type TNode = shape(
    'kind' => string,
    ?'token' => shape(
      'kind' => string,
      ...
    ),
    ?'elements' => vec<
      shape(
        ?'list_item' => shape(...),
        ...
      )
    >,
    ...
  );

  private async function getRelationsInFileAsync(
    string $file,
  ): Awaitable<dict<string, keyset<string>>> {
    try {
      // Get errors too, and avoid the UTF8 handling. If we fail on invalid
      // UTF8, we throw an exception and ignore the file. This is fine as the
      // invalid UTF8 is only in files that are testing encoding, and the odds
      // of them introducing new node relationships are pretty low
      $lines = await execute_async(
        'hh_parse',
        '--full-fidelity-errors',
        '--full-fidelity-json',
        $file,
      );
      $lines = Vec\filter($lines, $line ==> $line !== '');
      if (C\count($lines) !== 1) {
        return dict[];
      }
      $json = \json_decode(
        C\lastx($lines),
        /* as array = */ true,
        /* depth = */ 512, // default
        \JSON_FB_HACK_ARRAYS,
      );
      if (!\is_dict($json)) {
        return dict[];
      }
      /* HH_IGNORE_ERROR[4110] making assumptions about JSON */
      $ast = $this->flatten($json['parse_tree']);
    } catch (\Exception $_) {
      return dict[];
    }

    $out = dict[];

    $schemas = Dict\pull(
      $this->getSchema()['AST'],
      $schema ==> $schema,
      $schema ==> $schema['type_name'],
    );
    $node_ts = type_structure(self::class, 'TNode');

    foreach ($ast as $node) {
      $kind = (string)$node['kind'];
      if (!C\contains_key($schemas, $kind)) {
        continue;
      }
      $schema = $schemas[$kind];

      foreach ($schema['fields'] as $field) {
        $field = $schema['prefix'].'_'.$field['field_name'];
        if (C\contains_key($node, $field)) {
          $key = $kind.'.'.$field;
          if (!C\contains_key($out, $key)) {
            $out[$key] = keyset[];
          }

          $child = TypeAssert\matches_type_structure($node_ts, $node[$field]);
          $out[$key][] = self::getTypeString($child);
        }
      }
    }
    return $out;
  }

  public static function getTypeString(self::TNode $node): string {
    $kind = $node['kind'];
    if ($kind === 'token') {
      return 'token:'.TypeAssert\not_null($node['token']['kind'] ?? null);
    }
    if ($kind !== 'list') {
      return $kind;
    }

    $ts = type_structure(self::class, 'TNode');

    $types = ($node['elements'] ?? vec[])
      |> Vec\filter($$, $e ==> Shapes::keyExists($e, 'list_item'))
      |> Vec\map(
        $$,
        $e ==> TypeAssert\matches_type_structure($ts, $e['list_item'] ?? null),
      )
      |> Vec\map($$, $i ==> self::getTypeString($i))
      |> Keyset\sort($$);
    return 'list<'.Str\join($types, '|').'>';
  }

  public function flatten(dynamic $json): vec<dict<string, mixed>> {
    $ret = vec[$json];

    $kind = (string)$json['kind'];
    $schemas = Dict\pull(
      $this->getSchema()['AST'],
      $schema ==> $schema,
      $schema ==> $schema['type_name'],
    );

    switch ($kind) {
      case 'token':
        $ret[] = $json['token'];
        break;
      case 'list':
        foreach ($json['elements'] as $item) {
          foreach ($this->flatten($item) as $inner) {
            $ret[] = $inner;
          }
        }
        break;
      case 'missing':
        break;
      default:
        $schema = $schemas[$kind] ?? null;
        if ($schema === null) {
          break;
        }
        foreach ($schema['fields'] as $field) {
          $field = $schema['prefix'].'_'.$field['field_name'];
          $content = $json[$field] ?? null;
          if ($content !== null) {
            foreach ($this->flatten($content) as $inner) {
              $ret[] = $inner;
            }
          }
        }
    }

    return /* HH_FIXME[4110] dynamic to real type */ $ret;
  }

  // If some valid syntax isn't in the HHVM/Hack tests, use it here to make sure
  // it's permitted by the types
  private static function syntaxExamples(): void {
    // https://github.com/hhvm/hhast/issues/150
    $_ = (): keyset<classname<this>> ==> keyset[self::class];
    // https://github.com/hhvm/hhast/issues/151
    $_ = (this $x) ==> $x->flatten(dict[]) ?as this;
    $_ = (this $x) ==> $x->flatten(dict[]) as this;
  }
}
