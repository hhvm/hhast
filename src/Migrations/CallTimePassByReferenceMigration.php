<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Migrations;

use function Facebook\HHAST\{
  find_node_at_position,
  Missing,
};
use function Facebook\HHAST\__Private\get_typechecker_errors;
use type Facebook\HHAST\{
  AmpersandToken,
  EditableList,
  EditableNode,
};
use namespace HH\Lib\{C, Vec};

final class CallTimePassByReferenceMigration extends BaseMigration {
  const int ERROR_CODE = 4168;


  <<__Override>>
  public function migrateFile(
    string $path,
    EditableNode $root,
  ): EditableNode {
    $nodes = get_typechecker_errors($path)
      |> Vec\map($$, $error ==> C\firstx($error['message']))
      |> Vec\filter($$, $error ==> $error['code'] === self::ERROR_CODE)
      |> Vec\map(
        $$,
        $error ==> find_node_at_position(
          $root,
          $error['line'],
          $error['start'],
        ),
      );

    foreach ($nodes as $node) {
      $node = $node->getFirstTokenx();
      $root = $root->replace(
        $node,
        EditableList::fromItems(
          vec[
            new AmpersandToken(
              $node->getLeading(),
              Missing(),
            ),
            $node->withLeading(Missing()),
          ],
        ),
      );
    }

    return $root;
  }
}
