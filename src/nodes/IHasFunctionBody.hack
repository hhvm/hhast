/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

interface IHasFunctionBody {
  require extends Node;

  // We can't refine the type further as lambdas can have expressions as
  // bodies, and making IExpression implement an IFunctionBody would make the
  // interface pretty meaningless.
  public function hasBody(): bool;
  public function getBody(): ?Node;
  public function getBodyx(): Node;
  public function getBodyUNTYPED(): ?Node;
}
