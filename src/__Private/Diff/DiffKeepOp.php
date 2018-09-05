<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\Diff;

final class DiffKeepOp<TContent> extends DiffOp<TContent> {
  public function __construct(
    private int $oldPos,
    private int $newPos,
    private TContent $content,
  ) {
  }

  public function getOldPos(): int {
    return $this->oldPos;
  }

  public function getNewPos(): int {
    return $this->newPos;
  }

  <<__Override>>
  public function getContent(): TContent {
    return $this->content;
  }

  <<__Override>>
  public function asKeepOp(): DiffKeepOp<TContent> {
    return $this;
  }
}
