/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Str;

abstract class ParseError extends \Exception {
  public function __construct(
    private string $targetFile,
    ?int $_offset,
    private string $rawMessage,
  ) {
    parent::__construct(
      Str\format('In file "%s": %s', $targetFile, $rawMessage),
    );
  }

  public function getTargetFile(): string {
    return $this->targetFile;
  }

  public function getRawMessage(): string {
    return $this->rawMessage;
  }
}
