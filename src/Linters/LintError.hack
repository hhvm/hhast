/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\File;

class LintError {
  public function __construct(
    private BaseLinter $linter,
    private string $description,
  ) {
  }

  final public function getFile(): File {
    return $this->linter->getFile();
  }

  public function getPosition(): ?(int, int) {
    return null;
  }

  public function getRange(): ?((int, int), ?(int, int)) {
    $pos = $this->getPosition();
    if ($pos === null) {
      return null;
    }
    return tuple($pos, null);
  }

  public function getDescription(): string {
    return $this->description;
  }

  public function getBlameCode(): ?string {
    return null;
  }

  public function getPrettyBlame(): ?string {
    return $this->getBlameCode();
  }

  final public function getLinter(): BaseLinter {
    return $this->linter;
  }
}
