<?hh
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 */

namespace Facebook\HHAST\__Private\CLIOptions;

abstract class CLIOption {
  public function __construct(
    private string $helpText,
    private string $long,
    private ?string $short,
  ) {
  }

  final public function getHelpText(): string {
    return $this->helpText;
  }

  final public function getLong(): string {
    return $this->long;
  }

  final public function getShort(): ?string {
    return $this->short;
  }
}
