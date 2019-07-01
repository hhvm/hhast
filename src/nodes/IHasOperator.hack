/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

interface IHasOperator {
  require extends Node;

  public function hasOperator(): bool;
  public function getOperator(): ?Token;
  public function getOperatorx(): Token;
  public function getOperatorUNTYPED(): ?Node;
}
