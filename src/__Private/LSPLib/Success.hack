/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPLib;

final class Success<TResult, TErrorCode as int, TErrorData>
  extends SuccessOrError<TResult, TErrorCode, TErrorData> {
  public function __construct(private TResult $result) {
  }

  <<__Override>>
  public function isSuccess(): bool {
    return true;
  }

  <<__Override>>
  public function getResult(): TResult {
    return $this->result;
  }

  <<__Override>>
  public function getError(): Error<TResult, TErrorCode, TErrorData> {
    invariant_violation('%s should not be called on %s', __METHOD__, __CLASS__);
  }
}
