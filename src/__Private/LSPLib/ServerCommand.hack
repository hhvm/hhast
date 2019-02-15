/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPLib;

abstract class ServerCommand {
  abstract const string METHOD;
  abstract const type TParams;
  abstract const type TResponse;
  abstract const type TErrorCode as int;
  abstract const type TErrorData;

  const type TExecuteResult =
    SuccessOrError<this::TResponse, this::TErrorCode, this::TErrorData>;

  abstract public function executeAsync(
    this::TParams $in,
  ): Awaitable<this::TExecuteResult>;

  final protected static function success(
    this::TResponse $in,
  ): this::TExecuteResult {
    return new Success($in);
  }

  final protected static function error(
    this::TErrorCode $code,
    string $message,
    this::TErrorData $data,
  ): this::TExecuteResult {
    return new Error($code, $message, $data);
  }
}
