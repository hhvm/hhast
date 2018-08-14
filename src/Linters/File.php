<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

final class File {
  public function __construct(private string $path, private string $contents) {
  }

  public function getPath(): string {
    return $this->path;
  }

  public function getContents(): string {
    return $this->contents;
  }

  public function withContents(string $contents): this {
    if ($contents === $this->contents) {
      return $this;
    }
    return new self($this->path, $contents);
  }
}
