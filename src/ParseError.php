<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

abstract class ParseError extends \Exception {
  public function __construct(
    private string $targetFile,
    ?int $offset,
    private string $rawMessage,
  ) {
    parent::__construct(\sprintf('In file "%s": %s', $targetFile, $rawMessage));
  }

  public function getTargetFile(): string {
    return $this->targetFile;
  }

  public function getRawMessage(): string {
    return $this->rawMessage;
  }
}
