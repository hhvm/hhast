/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\Str;

final class SubprocessException extends \Exception {
  public function __construct(vec<string> $command, private int $exitCode) {
    parent::__construct(
      Str\format(
        'Command "%s" failed with exit code %d',
        Str\join($command, ' '),
        $exitCode,
      ),
    );
  }

  public function getExitCode(): int {
    return $this->exitCode;
  }
}
