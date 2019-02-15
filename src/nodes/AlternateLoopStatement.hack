/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;


final class AlternateLoopStatement extends AlternateLoopStatementGeneratedBase {
  <<__Override>>
  public function getBody(): EditableNode {
    return $this->getStatements();
  }

  <<__Override>>
  public function withBody(EditableNode $body): this {
    return $this->withStatements($body);
  }
}
