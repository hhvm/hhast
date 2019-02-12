/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPLib;

/* HH_IGNORE_ERROR[2049] __Sealed is new in 3.27 */
<<__Sealed(Success::class, Error::class)>>
abstract class SuccessOrError<TSuccess, TErrorCode as int, TErrorData> {
  abstract public function isSuccess(): bool;

  final public function isError(): bool {
    return !$this->isSuccess();
  }

  abstract public function getResult(): TSuccess;
  abstract public function getError(): Error<TSuccess, TErrorCode, TErrorData>;
}
