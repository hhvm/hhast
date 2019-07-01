/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

interface IHasTypeHint {
  require extends Node;

  public function hasType(): bool;
  public function getType(): ?ITypeSpecifier;
  public function getTypex(): ITypeSpecifier;
  public function getTypeUNTYPED(): ?Node;
}
