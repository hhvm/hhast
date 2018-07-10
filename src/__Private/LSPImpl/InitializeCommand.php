<?hh // strict
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

final class InitializeCommand
extends LSPLib\InitializeCommand<ServerState> {

  const type TInitializationOptions = shape(
    ?'lintMode' => LintMode,
  );

  const LSP\ServerCapabilities SERVER_CAPABILITIES = shape(
    'textDocumentSync' => shape(
      'save' => shape(
        'includeText' => false,
      ),
      'openClose' => true,
      ),
      'codeActionProvider' => true,
      'executeCommandProvider' => shape(
        'commands' => ExecuteCommandCommand::COMMANDS,
      ),
    );

  <<__Override>>
  public async function executeAsync(
    self::TParams $p,
  ): Awaitable<this::TExecuteResult> {
    $options = TypeAssert\matches_type_structure(
      type_structure(self::class, 'TInitializationOptions'),
      $p['initializationOptions'] ?? shape(),
    );

    $lint_mode = $options['lintMode'] ?? null;
    if ($lint_mode !== null) {
      $this->state->lintMode = $lint_mode;
    }

    return await parent::executeAsync($p);
  }
}
