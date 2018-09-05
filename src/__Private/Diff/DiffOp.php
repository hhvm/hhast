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

<<__Sealed(DiffDeleteOp::class, DiffInsertOp::class, DiffKeepOp::class)>>
abstract class DiffOp<TContent> {
  abstract public function getContent(): TContent;

  public function asDeleteOp(): DiffDeleteOp<TContent> {
    invariant_violation('not a deletion');
  }

  public function asInsertOp(): DiffInsertOp<TContent> {
    invariant_violation('not an insertion');
  }

  public function asKeepOp(): DiffKeepOp<TContent> {
    invariant_violation('not a keep');
  }

  final public function getDiffOpClass(): classname<DiffOp<TContent>> {
    return static::class;
  }
}
