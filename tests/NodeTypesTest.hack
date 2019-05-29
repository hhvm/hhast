/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

final class NodeTypesTest extends TestCase {
  public function testListVariance(): void {
    $_typecheck = ((?NodeList<IParameter> $_) ==> null)(
      (null ?as FunctionDeclarationHeader)?->getParameterListx(),
    );
    $_typecheck = ((?NodeList<Node> $_) ==> null)(
      (null ?as FunctionDeclarationHeader)?->getParameterListx(),
    );
  }

  public function testBinaryExpressionOperandsAreExpressions(): void {
    $typecheck = (?IExpression $_) ==> null;
    $be = null ?as BinaryExpression;
    $typecheck($be?->getLeftOperand());
    $typecheck($be?->getRightOperand());
  }
}
