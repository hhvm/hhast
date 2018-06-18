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

use namespace Facebook\HHAST\__Private\{LSP, LSPLib};

final class InitializeCommand
extends LSPLib\InitializeCommand<LSPLib\ServerState> {

  const LSP\ServerCapabilities SERVER_CAPABILITIES = shape(
    'textDocumentSync' => shape(
      'save' => shape(
        'includeText' => false,
      ),
    )
  );
}
