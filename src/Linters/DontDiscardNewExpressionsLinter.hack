/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str};

final class DontDiscardNewExpressionsLinter extends ASTLinter {
  const type TConfig = shape(?'exceptionSuffixes' => vec<string>);
  const type TContext = Script;
  const type TNode = ExpressionStatement;

  const string BASE_MESSAGE = <<<'TEXT'
You are discarding the result of a `new` expression.
If you are intentionally discarding the newly created object,
consider assigning it to `$_` to communicate with your readers.

TEXT;

  const string UNTHROWN_EXCEPTION =
    'It looks like you are constructing an Exception. Did you intend to throw it?';

  const string SIDE_EFFECTS_IN_CONSTRUCTOR_SMELL = <<<'TEXT'
If you are running this constructor for its side-effects,
consider restructuring that class / constructor.
A constructor is meant for creating objects, not for causing effects.
TEXT;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    this::TNode $node,
  ): ?ASTLintError {
    $expression = $node->getExpression();
    if (!$expression is ObjectCreationExpression) {
      return null;
    }

    $message = static::BASE_MESSAGE.
      (
        $this->isConstructingAnException($expression)
          ? static::UNTHROWN_EXCEPTION
          : static::SIDE_EFFECTS_IN_CONSTRUCTOR_SMELL
      );

    return new ASTLintError($this, $message, $node);
  }

  private function isConstructingAnException(
    ObjectCreationExpression $expression,
  ): bool {
    $cls = $expression->getObject()->getType()->getLastToken()?->getText();
    return $cls is nonnull &&
      C\any(
        $this->getExceptionSuffixes(),
        $suffix ==> Str\ends_with($cls, $suffix),
      );
  }

  private function getExceptionSuffixes(): vec<string> {
    return $this->getConfig()['exceptionSuffixes'] ?? vec['Exception'];
  }
}
