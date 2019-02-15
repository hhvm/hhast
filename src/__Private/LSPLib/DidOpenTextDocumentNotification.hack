/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPLib;

use namespace Facebook\HHAST\__Private\LSP;

abstract class DidOpenTextDocumentNotification extends ClientNotification {
  const string METHOD = 'textDocument/didOpen';
  const type TParams = LSP\DidOpenTextDocumentParams;
}
