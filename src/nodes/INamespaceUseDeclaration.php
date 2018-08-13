<?hh // strict
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
  require extends EditableNode;

  public function withKeyword(EditableNode $value): this;
  public function hasKeyword(): bool;
  public function getKeyword(): UseToken;
  public function getKeywordx(): UseToken;

  public function withKind(EditableNode $value): this;
  public function hasKind(): bool;
  public function getKind(): ?EditableToken;
  public function getKindx(): EditableToken;

  public function withClauses(EditableNode $value): this;
  public function hasClauses(): bool;
  public function getClauses(): EditableList<NamespaceUseClause>;
  public function getClausesx(): EditableList<NamespaceUseClause>;

  public function getSemicolon(): ?SemicolonToken;
 }
