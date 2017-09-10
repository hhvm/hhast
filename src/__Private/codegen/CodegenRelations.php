<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Dict, Keyset, Str, Vec};
use type Facebook\HackCodegen\{
  HackBuilderKeys,
  HackBuilderValues
};

final class CodegenRelations extends CodegenBase {
  public function __construct(
    private string $hhvmRoot,
    Schema\TSchema $schema,
  ) {
    parent::__construct($schema);
  }

  public function generate(): void {
    print("Infering relationships, this can take a long time...\n");
    $all_inferences = Vec\map(
      $this->getFileList(),
      $file ==> $this->getRelationsInFile($file),
    );

    $result = dict[];
    foreach ($all_inferences as $inferences) {
      foreach ($inferences as $key => $child_keys) {
        $result[$key] = Keyset\flatten(
          vec[
            $result[$key] ?? keyset[],
            $child_keys,
          ]
        );
      }
    }

    $cg = $this->getCodegenFactory();

    $cg->codegenFile($this->getOutputDirectory().'/relationships.php')
      ->setNamespace('Facebook\\HHAST\\__Private')
      ->setPseudoMainHeader(
        $cg->codegenHackBuilder()
          ->add('const dict<string, keyset<string>> SCHEMA_RELATIONSHIPS = ')
          ->addValue(
            $result,
            HackBuilderValues::dict(
              HackBuilderKeys::export(),
              HackBuilderValues::keyset(
                HackBuilderValues::export(),
              ),
            ),
          )
          ->addLine(';')
          ->getCode()
      )
      ->save();
    print("... done!\n");
  }

  private function getFileList(): keyset<string> {
    $hhvm_dirs = keyset[
      'quick',
      'slow',
      'zend/good',
    ];

    $hhvm_tests =
      Vec\map(
        $hhvm_dirs,
        $dir ==> $this->hhvmRoot.'/hphp/test/'.$dir,
      )
      |> Vec\map(
        $$,
        $dir ==> $this->getFileListFromHHVMTestDirectory($dir)
      )
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
        if (file_exists($path.'.expect')) {
          $expect = $path.'.expect';
        } else if (file_exists($path.'.expectf')) {
          $expect = $path.'.expectf';
        } else {
          return false;
        }
        $out = file_get_contents($expect);
        if (Str\contains($out, 'Fatal error: syntax error')) {
          return false;
        }
        if (Str\contains($out, 'as it is reserved')) {
          return false;
        }
        return true;
      }
    );
  }

  private function getFileListFromHackTestDirectory(
    string $root,
  ): keyset<string> {
    return Keyset\filter(
      $this->getTestFilesInDirectory($root),
      $path ==> {
        if (!file_exists($path.'.exp')) {
          return false;
        }
        $out = file_get_contents($path.'.exp');
        return $out === "No errors\n";
      }
    );
  }

  private function getTestFilesInDirectory(
    string $root,
  ): Traversable<string> {
    $it = new \RecursiveIteratorIterator(
      new \RecursiveDirectoryIterator(
        $root,
      )
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

  private function getRelationsInFile(
    string $file,
  ): dict<string, keyset<string>> {
    try {
      $ast = HHAST\from_file($file);
    } catch (\Exception $_) {
      if (!Str\contains(file_get_contents($file), '<?php')) {
        fprintf(STDERR, "Failed to parse %s\n", $file);
      }
      return dict[];
    }

    $out = dict[];

    $schemas = $this->getSchemaASTByKindName();
    foreach ($ast->preorder() as $node) {
      $kind = Str\strip_prefix(
        get_class($node),
        'Facebook\\HHAST\\',
      );
      if (!C\contains_key($schemas, $kind)) {
        continue;
      }
      $schema = $schemas[$kind];

      $node_fields = dict($node->children());
      $kind = $node->syntax_kind();

      foreach ($schema['fields'] as $field) {
        $field = $field['field_name'];
        if (C\contains_key($node_fields, $field)) {
          $key = $kind.'.'.$field;
          if (!C\contains_key($out, $key)) {
            $out[$key] = keyset[];
          }

          $child = $node_fields[$field];
          $out[$key][] = $child->syntax_kind();
        }
      }
    }
    return $out;
  }
}
