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

final class LinterException extends \Exception {
  public function __construct(
    private classname<Linter> $linter,
    private string $fileBeingLinted,
    private string $rawMessage,
    private ?(int, int) $position = null,
    ?\Throwable $previous = null,
  ) {
    parent::__construct(
      Str\format(
        "While running '%s' on '%s': %s",
        $linter,
        $fileBeingLinted,
        $rawMessage,
      ),
      /* code = */ 0,
      // Throwable should be fine but causes type errors. facebook/hhvm#8239
      $previous ?as \Exception,
    );
  }

  public function getLinterClass(): classname<Linter> {
    return $this->linter;
  }

  public function getFileBeingLinted(): string {
    return $this->fileBeingLinted;
  }

  public function getRawMessage(): string {
    return $this->rawMessage;
  }

  public function getPosition(): ?(int, int) {
    return $this->position;
  }
}
