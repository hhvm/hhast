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
use namespace HH\Lib\{C, Dict, Str, Vec};

final class CodegenRelations extends CodegenBase {
  public function __construct(
    private string $hhvm_root,
    Schema\TSchema $schema,
  ) {
    parent::__construct($schema);
  }

  public function generate(): void {
    $file = '/Users/fred/code/hhvm/hphp/test/quick/IssetM.php';
    var_dump($this->getRelationsFromFile($file));
  }

  private function getRelationsFromFile(
    string $file,
  ): dict<string, keyset<string>> {
    $out = dict[];
    $ast = HHAST\from_file($file);
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
