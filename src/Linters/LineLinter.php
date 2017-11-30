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

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\Linters\{BaseLinter};

abstract class LineLinter extends BaseLinter {

  public function getLinesFromFile(): vec<string> {
    $code = file_get_contents($this->getFile());
    $lines = explode("\n", $code);
    return vec($lines);
  }

  public function getLine(int $l): ?string {
    return idx($this->getLinesFromFile(), $l);
  }
}
