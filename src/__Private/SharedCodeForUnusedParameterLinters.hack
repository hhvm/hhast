/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{C, Str};
use type Facebook\HHAST\{
  DecoratedExpression,
  IParameter,
  Node,
  ParameterDeclaration,
  VariableToken,
  VariadicParameter,
};

trait SharedCodeForUnusedParameterLinters {
  final private static function extractVariableFromParam(
    IParameter $p,
  ): ?VariableToken {
    // This isn't the modern `function _(mixed ... $collecting_vec): void {}` style.
    // This is the old `function `function _(...): void {}` style.
    if ($p is VariadicParameter) {
      return null;
    }

    invariant(
      $p is ParameterDeclaration,
      'A new unknown parameter type was found: %s',
      \get_class($p),
    );

    // `public function __construct(private string $x) {}` is never unused.
    if ($p->getVisibility() is nonnull) {
      return null;
    }

    $var = $p->getName();
    if ($var is DecoratedExpression) {
      $var = $var->getExpression();
    }

    invariant(
      $var is VariableToken,
      'Unexpected parameter type: %s did not yield a variable token',
      \get_class($p),
    );

    return $var;
  }

  final private static function isUsedInBody(
    Node $body,
    VariableToken $var,
  ): bool {
    $search_text = $var->getText();
    return C\any(
      $body->traverse(),
      $tok ==> $tok ?as VariableToken?->getText() === $search_text,
    );
  }

  final private static function prefixWithUnderscore(
    VariableToken $v,
  ): VariableToken {
    return $v->withText('$_'.Str\strip_prefix($v->getText(), '$'));
  }

  final private static function startsWithUnder(VariableToken $v): bool {
    $name = $v->getText();
    return Str\starts_with($name, '$_');
  }
}
