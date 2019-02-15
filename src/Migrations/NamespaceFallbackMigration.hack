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
  BackslashToken,
  EditableList,
  EditableNode,
};
use function Facebook\HHAST\__Private\execute_async;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Str, Vec};

final class NamespaceFallbackMigration extends BaseMigration {
  use TypeErrorMigrationTrait;
  const keyset<int> ERROR_CODES = keyset[2049, 4107];

  protected static function filterTypecheckerError(
    TTypecheckerError $error,
  ): bool {
    return C\contains(
      self::ERROR_CODES,
      C\firstx($error['message'])['code'],
    );
  }

  <<__Override>>
  public function migrateFile(
    string $path,
    EditableNode $root,
  ): EditableNode {
    $nodes = $this->getTypecheckerErrorsForFile($path)
      |> Vec\map($$, $error ==> C\firstx($error['message']))
      |> Vec\unique_by(
        $$,
        $error ==> $error['line'].':'.$error['start'],
      )
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
      $name = $node->getText();
      if (!(
        \function_exists($name) ||
        \defined($name) ||
        self::isTypecheckerAware($name, $path)
      )) {
        continue;
      }
      $root = $root->replace(
        $node,
        EditableList::createNonEmptyListOrMissing(
          vec[
            new BackslashToken(
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

  const type TSearchResult = vec<shape(
    'name' => string,
    'desc' => string,
    ...
  )>;

  private static function isTypecheckerAware(
    string $name,
    string $path,
  ): bool {
    $lines = \HH\Asio\join(execute_async(
      'hh_client',
      '--search', "\\".$name,
      '--json',
      $path,
    ));
    $json = Str\join($lines, "\n");
    $results = TypeAssert\matches_type_structure(
      type_structure(self::class, 'TSearchResult'),
      \json_decode(
        $json,
        /* assoc = */ true,
        /* depth = */ 512,
        \JSON_FB_HACK_ARRAYS,
      ),
    );
    return C\any(
      $results,
      $result ==>
        $result['name'] === $name && (
          $result['desc'] === 'function' || $result['desc'] === 'constant'
        ),
    );
  }
}
