/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Migrations;

use function Facebook\HHAST\{
  find_node_at_position,
  Missing,
};
use type Facebook\HHAST\__Private\TTypecheckerError;
use type Facebook\HHAST\{
  AmpersandToken,
  NodeList,
  Script,
};
use namespace HH\Lib\{C, Vec};

final class CallTimePassByReferenceMigration extends BaseMigration {
  use TypeErrorMigrationTrait;
  const int ERROR_CODE = 4168;

  protected static function filterTypecheckerError(
    TTypecheckerError $error,
  ): bool {
    return C\firstx($error['message'])['code'] === self::ERROR_CODE;
  }

  <<__Override>>
  public function migrateFile(
    string $path,
    Script $root,
  ): Script {
    $nodes = $this->getTypecheckerErrorsForFile($path)
      |> Vec\map($$, $err ==> C\firstx($err['message']))
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
        NodeList::createNonEmptyListOrMissing(
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
