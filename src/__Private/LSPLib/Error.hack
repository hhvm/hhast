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

final class Error<TResult, TErrorCode as int, TErrorData>
  extends SuccessOrError<TResult, TErrorCode, TErrorData> {
  public function __construct(
    private TErrorCode $code,
    private string $message,
    private TErrorData $data,
  ) {
  }

  <<__Override>>
  public function isSuccess(): bool {
    return false;
  }

  <<__Override>>
  public function getResult(): TResult {
    invariant_violation('%s should not be called on %s', __METHOD__, __CLASS__);
  }

  <<__Override>>
  public function getError(): this {
    return $this;
  }

  public function asResponseError(): LSP\ResponseError {
    $s = shape(
      'code' => $this->code,
      'message' => $this->message,
    );
    if ($this->data !== null) {
      $s['data'] = $this->data;
    }
    return $s;
  }
}
