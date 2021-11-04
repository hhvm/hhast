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

trait MemoizedLineLinterTrait {

  require extends BaseLinter;

  <<__Memoize>>
  public function getLinesFromFile(): vec<string> {
    $code = $this->getFile()->getContents();
    return Str\split($code, "\n");
  }

  public function getLine(int $l): ?string {
    return idx($this->getLinesFromFile(), $l);
  }

  /** Check if this linter has been disabled by a comment on the previous line.
   */
  protected function isLinterSuppressed(string $previous_line): bool {
    return Str\contains($previous_line, $this->getFixmeMarker()) ||
      Str\contains($previous_line, $this->getIgnoreSingleErrorMarker());
  }

}
