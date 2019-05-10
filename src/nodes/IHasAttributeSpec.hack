/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

interface IHasAttributeSpec {
  require extends EditableNode;

  public function hasAttributeSpec(): bool;
  public function getAttributeSpec(): ?AttributeSpecification;
  public function getAttributeSpecx(): AttributeSpecification;
  public function getAttributeSpecUNTYPED(): EditableNode;
}
