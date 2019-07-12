/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

interface INamespaceUseDeclaration {
  require extends Node;

  public function withKeyword(UseToken $value): this;
  public function hasKeyword(): bool;
  public function getKeyword(): UseToken;
  public function getKeywordx(): UseToken;

  public function withKind(Token $value): this;
  public function hasKind(): bool;
  public function getKind(): ?Token;
  public function getKindx(): Token;

  public function withClauses(
    NodeList<ListItem<NamespaceUseClause>> $value,
  ): this;
  public function hasClauses(): bool;
  public function getClauses(): NodeList<ListItem<NamespaceUseClause>>;
  public function getClausesx(): NodeList<ListItem<NamespaceUseClause>>;

  public function getSemicolon(): ?SemicolonToken;
}
