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

  <<__Override>>
  public function hasBody(): bool {
    return $this->hasFunctionBody();
  }

  <<__Override>>
  public function getBodyUNTYPED(): ?Node {
    return $this->getFunctionBodyUNTYPED();
  }

  <<__Override>>
  public function getBodyx(): CompoundStatement {
    return $this->getFunctionBodyx();
  }

  <<__Override>>
  public function getBody(): ?CompoundStatement {
    return $this->getFunctionBody();
  }
}
