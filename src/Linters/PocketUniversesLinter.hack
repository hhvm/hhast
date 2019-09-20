/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class PocketLinterMessage {
  const string Message =
    'This is a reserved syntax for the Pocket Universes prototype.\n'.
    'Only use it if you know  what you are doing.\n'.
    'We advise you to remove it.';
}

// Displays warning for the :@atom_name case
final class PocketAtomExpressionLinter extends ASTLinter {
  const type TNode = PocketAtomExpression;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    PocketAtomExpression $expr,
  ): ?ASTLintError {
    return new ASTLintError($this, PocketLinterMessage::Message, $expr);
  }
}

// Displays warning for the Class:@Enum::foo case
final class PocketIdentifierExpressionLinter extends ASTLinter {
  const type TNode = PocketIdentifierExpression;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    PocketIdentifierExpression $expr,
  ): ?ASTLintError {
    return new ASTLintError($this, PocketLinterMessage::Message, $expr);
  }
}

// Displays warning for any Pocket Universes declaration/definition
final class PocketEnumDeclarationLinter extends ASTLinter {
  const type TNode = PocketEnumDeclaration;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    PocketEnumDeclaration $expr,
  ): ?ASTLintError {
    return new ASTLintError($this, PocketLinterMessage::Message, $expr);
  }
}
