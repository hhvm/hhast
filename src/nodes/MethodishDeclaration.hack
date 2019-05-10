/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;


final class MethodishDeclaration extends MethodishDeclarationGeneratedBase {
  use AttributeAsAttributeSpecTrait;

  public function hasBody(): bool {
    return $this->hasFunctionBody();
  }

  public function getBodyUNTYPED(): EditableNode {
    return $this->getFunctionBodyUNTYPED();
  }

  public function getBodyx(): CompoundStatement {
    return $this->getFunctionBodyx();
  }

  public function getBody(): ?CompoundStatement {
    return $this->getFunctionBody();
  }
}
