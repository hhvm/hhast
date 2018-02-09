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
use type Facebook\HHAST\__Private\TTypecheckerError;
use type Facebook\HHAST\{
  EditableList,
  EditableNode,
  FixMe,
  Missing,
  WhiteSpace,
};
use namespace HH\Lib\{C, Dict, Keyset, Vec};

final class AddFixMesMigration extends BaseMigration {
  use TypeErrorMigrationTrait;

  protected static function filterTypecheckerError(TTypecheckerError $_): bool {
    return true;
  }

  <<__Override>>
  public function migrateFile(
    string $path,
    EditableNode $root,
  ): EditableNode {
    $errors_by_position = $this->getTypecheckerErrorsForFile($path)
      |> Vec\map($$, $error ==> C\firstx($error['message']))
      |> Dict\group_by(
        $$,
        $error ==> ($error['line'] << 32) + $error['start'],
      );

    foreach ($errors_by_position as $position => $errors) {
      $fixmes = $errors
        |> Keyset\map($$, $error ==> $error['code'])
        |> Vec\map(
          $$,
          $code ==> vec[
            new FixMe(\sprintf('/* HH_FIXME[%d] */', $code)),
            new WhiteSpace(' '),
          ],
        )
        |> Vec\flatten($$);

      $line = $position >> 32;
      $column = $position - ($line << 32);
      $node = find_node_at_position($root, $line, $column)->getFirstTokenx();
      $leading = $node->getLeading();
      if ($leading instanceof Missing) {
        $new_leading = EditableList::fromItems($fixmes);
      } else if ($leading instanceof EditableList) {
        $new_leading = EditableList::fromItems(
          Vec\concat(
            $leading->getChildren(),
            $fixmes,
          ),
        );
      } else {
        $new_leading = EditableList::fromItems(
          Vec\concat(
            vec[$leading],
            $fixmes,
          )
        );
      }

      $root = $root->replace(
        $node,
        $node->withLeading($new_leading),
      );
    }

    return $root;
  }
}
