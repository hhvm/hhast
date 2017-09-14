<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Linters;

class LintError {
  public function __construct(
    private BaseLinter $linter,
    private string $description,
  ) {
  }

  public function getFile(): string {
    return $this->linter->getFile();
  }

  public function getPosition(): ?(int, int) {
    return null;
  }

  public function getDescription(): string {
    return $this->description;
  }

  public function getBlameCode(): ?string {
    return null;
  }

  public function getPrettyBlameCode(): ?string {
    return $this->getBlameCode();
  }

  public function getLinter(): BaseLinter {
    return $this->linter;
  }
}
