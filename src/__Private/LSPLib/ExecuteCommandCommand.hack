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

abstract class ExecuteCommandCommand extends ServerCommand {
  const string METHOD = 'workspace/executeCommand';

  const type TParams = LSP\ExecuteCommandParams;
  const type TResponse = mixed;
  const type TErrorCode = int;
  const type TErrorData = mixed;
}
