/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use namespace Facebook\TypeAssert;
use namespace Facebook\HHAST\__Private\{LSP, LSPLib};

final class ExecuteCommandCommand extends LSPLib\ExecuteCommandCommand {

  const string HHAST_ApplyWorkspaceEdit = 'hhast/applyWorkspaceEdit';
  const type THHAST_ApplyWorkspaceEditParams = vec<LSP\WorkspaceEdit>;

  const vec<string> COMMANDS = vec[self::HHAST_ApplyWorkspaceEdit];

  public function __construct(private LSPLib\Client $client) {
  }

  <<__Override>>
  public async function executeAsync(
    self::TParams $p,
  ): Awaitable<this::TExecuteResult> {
    $command = $p['command'];
    switch ($command) {
      case self::HHAST_ApplyWorkspaceEdit:
        $args = TypeAssert\matches_type_structure(
          type_structure(self::class, 'THHAST_ApplyWorkspaceEditParams'),
          $p['arguments'] ?? vec[],
        );
        await $this->client
          ->sendRequestMessageAsync(
            (
              new LSPLib\ApplyWorkspaceEditCommand(
                self::generateID(),
                shape(
                  'edit' => $args[0],
                ),
              )
            )->asMessage(),
          );
        return self::success(null);
    }
    return self::error(0, 'Unsupported command: '.$command, null);
  }

  private static int $idCounter = 0;

  private static function generateID(): string {
    $id = __CLASS__.'!'.self::$idCounter;
    self::$idCounter++;
    return $id;
  }
}
