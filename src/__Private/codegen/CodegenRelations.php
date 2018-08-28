<?hh // strict
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
use type Facebook\HackCodegen\{HackBuilderKeys, HackBuilderValues};
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
    print("Infering relationships, this can take a long time...\n");
    $files = $this->getFileList();
    $done = Set {};
    $start = \microtime(true);
    list($all_inferences, $_) = \HH\Asio\join(Tuple\from_async(
      Vec\map_async(
        $files,
        async $file ==> {
          try {
            return await $this->getRelationsInFileAsync($file);
          } catch (\Throwable $t) {
            throw $t;
          } finally {
            $done[] = $file;
          }
        },
      ),
      async {
        $total = C\count($files);
        while ($done->count() < $total) {
          await \HH\Asio\usleep(1000 * 1000);
          $ratio = ((float)$done->count()) / $total;
          $now = \microtime(true);
          $elapsed = $now - $start;
          $rate = $done->count() / $elapsed;
          $end = $start + ($total / $rate);
          \fprintf(
            \STDERR,
            "%d%%\t(%d / %d)\tExpected finish in %ds at %s\n",
            (int)($ratio * 100),
            $done->count(),
            $total,
            (int)($end - $now),
            \strftime('%H:%M:%S', (int)$end),
          );
        }
      },
    ));

    $result = dict[];
    foreach ($all_inferences as $inferences) {
      foreach ($inferences as $key => $child_keys) {
        $result[$key] = Keyset\flatten(
          vec[
            $result[$key] ?? keyset[],
            $child_keys,
          ],
        )
          |> Keyset\sort($$);
      }
    }
    $result = Dict\sort_by_key($result);

    $cg = $this->getCodegenFactory();

    $cg->codegenFile($this->getOutputDirectory().'/inferred_relationships.php')
      ->setNamespace('Facebook\\HHAST\\__Private')
      ->addConst(
        'dict<string, keyset<string>> INFERRED_RELATIONSHIPS',
        $cg->codegenHackBuilder()
          ->addValue(
            $result,
            HackBuilderValues::dict(
              HackBuilderKeys::export(),
              HackBuilderValues::keyset(HackBuilderValues::export()),
            ),
          ),
        /* comment = */ null,
        HackBuilderValues::code(),
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

    $hhvm_tests =
      Vec\map($hhvm_dirs, $dir ==> $this->hhvmRoot.'/hphp/test/'.$dir)
      |> Vec\map($$, $dir ==> $this->getFileListFromHHVMTestDirectory($dir))
      |> Keyset\flatten($$);

    $hack_tests = $this->getFileListFromHackTestDirectory(
      $this->hhvmRoot.'/hphp/hack/test/typecheck',
    );

    return Keyset\flatten(vec[$hhvm_tests, $hack_tests]);
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
    $it =
      new \RecursiveIteratorIterator(new \RecursiveDirectoryIterator($root));
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
      $json = await HHAST\json_from_file_async($file);
      /* HH_IGNORE_ERROR[4110] making assumptions about JSON */
      $ast = $this->flatten($json['parse_tree']);
    } catch (\Exception $_) {
      if (!Str\contains(\file_get_contents($file), '<?php')) {
        \fprintf(\STDERR, "Failed to parse %s\n", $file);
      }
      return dict[];
    }

    $out = dict[];

    $schemas = Dict\pull(
      $this->getSchema()['AST'],
      $schema ==> $schema,
      $schema ==> $schema['type_name'],
    );

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

          $child = TypeAssert\matches_type_structure(
            type_structure(self::class, 'TNode'),
            $node[$field],
          );
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

  public function flatten(
    dict<string, mixed> $json,
  ): Traversable<dict<string, mixed>> {
    // UNSAFE_BLOCK making assumptions about JSON struct
    yield $json;

    $kind = (string)$json['kind'];
    $schemas = Dict\pull(
      $this->getSchema()['AST'],
      $schema ==> $schema,
      $schema ==> $schema['type_name'],
    );

    switch ($kind) {
      case 'token':
        yield $json['token'];
        break;
      case 'list':
        foreach ($json['elements'] as $item) {
          foreach ($this->flatten($item) as $inner) {
            yield $inner;
          }
        }
        break;
      case 'missing':
        return;
      default:
        $schema = $schemas[$kind] ?? null;
        if ($schema === null) {
          return;
        }
        foreach ($schema['fields'] as $field) {
          $field = $schema['prefix'].'_'.$field['field_name'];
          $content = $json[$field] ?? null;
          if ($content !== null) {
            foreach ($this->flatten($content) as $inner) {
              yield $inner;
            }
          }
        }
    }
  }
}
