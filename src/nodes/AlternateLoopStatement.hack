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
  public function getBody(): IStatement {
    return new CompoundStatement(Missing(), $this->getStatements(), Missing());
  }

  <<__Override>>
  public function withBody(IStatement $body): this {
    if ($body instanceof CompoundStatement && !$body->hasLeftBrace()) {
      return $this->withStatements($body->getStatements() as nonnull);
    }
    return $this->withStatements(NodeList::createMaybeEmptyList(vec[$body]));
  }
}
