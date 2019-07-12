/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use function Facebook\HHAST\find_node_at_position;
use type Facebook\HHAST\__Private\TTypecheckerError;
use type Facebook\HHAST\{FixMe, NodeList, Script, WhiteSpace};
use namespace HH\Lib\{C, Dict, Keyset, Str, Vec};

final class AddFixmesMigration extends BaseMigration {
  use TypeErrorMigrationTrait;

  protected static function filterTypecheckerError(TTypecheckerError $_): bool {
    return true;
  }

  <<__Override>>
  public function migrateFile(string $path, Script $root): Script {
    $errors_by_position = $this->getTypecheckerErrorsForFile($path)
      |> Vec\map($$, $error ==> C\firstx($error['message']))
      |> Dict\group_by($$, $error ==> ($error['line'] << 32) + $error['start']);

    $previous_error_line = -1;
    $column_offset = 0;

    foreach ($errors_by_position as $position => $errors) {
      $fixmes = $errors
        |> Keyset\map($$, $error ==> $error['code'])
        |> Vec\map(
          $$,
          $code ==> vec[
            new FixMe(Str\format('/* HH_FIXME[%d] */', $code)),
            new WhiteSpace(' '),
          ],
        )
        |> Vec\flatten($$);

      $line = $position >> 32;
      $column = $position - ($line << 32);
      if ($line === $previous_error_line) {
        $column += $column_offset;
      } else {
        $previous_error_line = $line;
        $column_offest = 0;
      }
      $node = find_node_at_position($root, $line, $column)->getFirstTokenx();
      $leading = $node->getLeading();
      $new_leading = NodeList::createMaybeEmptyList(
        Vec\concat($leading->getChildren(), $fixmes),
      );

      $column_offset += Str\length($new_leading->getCode()) -
        Str\length($leading->getCode());

      $root = $root->replace($node, $node->withLeading($new_leading));
    }

    return $root;
  }
}
