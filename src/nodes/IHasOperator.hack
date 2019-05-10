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
  require extends EditableNode;

  public function hasOperator(): bool;
  public function getOperator(): ?EditableToken;
  public function getOperatorx(): EditableToken;
  public function getOperatorUNTYPED(): EditableNode;
}
