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

final class DiffDeleteOp<TContent> extends DiffOp<TContent> {
  public function __construct(
    private int $oldPos,
    private TContent $content,
  ) {
  }

  public function getOldPos(): int {
    return $this->oldPos;
  }

  <<__Override>>
  public function getContent(): TContent {
    return $this->content;
  }

  <<__Override>>
  public function asDeleteOp(): DiffDeleteOp<TContent> {
    return $this;
  }
}
