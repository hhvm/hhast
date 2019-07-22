/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;


trait AttributeAsAttributeSpecTrait {
  require extends Node;

  abstract public function hasAttribute(): bool;
  abstract public function getAttribute(): ?OldAttributeSpecification;
  abstract public function getAttributex(): OldAttributeSpecification;
  abstract public function getAttributeUNTYPED(): ?Node;

  final public function hasAttributeSpec(): bool {
    return $this->hasAttribute();
  }

  final public function getAttributeSpec(): ?OldAttributeSpecification {
    return $this->getAttribute();
  }

  public function getAttributeSpecx(): OldAttributeSpecification {
    return $this->getAttributex();
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->getAttributeUNTYPED();
  }
}
