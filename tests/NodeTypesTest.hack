/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use function Facebook\FBExpect\expect;
use namespace HH\Lib\{C, Str, Vec};

final class NodeTypesTest extends TestCase {
  public function testListVariance(): void {
    $_typecheck = (
      (?NodeList<ListItem<IParameter>> $_) ==> null
    )((null ?as FunctionDeclarationHeader)?->getParameterListx());
    $_typecheck = (
      (?NodeList<ListItem<Node>> $_) ==> null
    )((null ?as FunctionDeclarationHeader)?->getParameterListx());
    $_typecheck = (
      (?NodeList<Node> $_) ==> null
    )((null ?as FunctionDeclarationHeader)?->getParameterListx());
  }

  public function testBinaryExpressionOperandsAreExpressions(): void {
    $typecheck = (?IExpression $_) ==> null;
    $be = null ?as BinaryExpression;
    $typecheck($be?->getLeftOperand());
    $typecheck($be?->getRightOperand());
  }

  public function testFunctionTypeIsITypeSpecifier(): void {
    $typecheck = (?ITypeSpecifier $_) ==> null;
    $func = null ?as FunctionDeclarationHeader;
    $typecheck($func?->getType());
  }

  public async function testNoreturnFunctionTypeIsWrapped(): Awaitable<void> {
    $code = "<?hh function foo(): noreturn {}";
    $ast = await from_file_async(File::fromPathAndContents('/dev/null', $code));
    list($_markup, $func) = $ast->getDeclarations()->getChildren();
    $func = expect($func)->toBeInstanceOf(FunctionDeclaration::class);
    $ret = $func->getDeclarationHeader()->getType();
    $ret = expect($ret)->toBeInstanceOf(SimpleTypeSpecifier::class);
    expect($ret->getSpecifier())->toBeInstanceOf(NoreturnToken::class);
  }

  public async function testTypeConstantLHSIsWrapped(): Awaitable<void> {
    $code = "<?hh function foo(this::TFoo \$_): void {}";
    $ast = await from_file_async(File::fromPathAndContents('/dev/null', $code));
    list($_markup, $func) = $ast->getDeclarations()->getChildren();
    $func = expect($func)->toBeInstanceOf(FunctionDeclaration::class);
    $p = $func->getDeclarationHeader()
      ->getParameterListx()
      ->getChildrenOfItems()
      |> C\firstx($$);
    $t = expect($p->getType())->toBeInstanceOf(TypeConstant::class);
    $lhs = expect($t->getLeftType())->toBeInstanceOf(
      SimpleTypeSpecifier::class,
    );
    expect($lhs->getSpecifier())->toBeInstanceOf(ThisToken::class);
  }

  public async function testNameTokenWrappedAsExpression(): Awaitable<void> {
    $code = "<?hh \$x = SOME_CONST; \$y = SOME\\NAMESPACED\\CONST;";
    $ast = await from_file_async(File::fromPathAndContents('/dev/null', $code));
    list($_markup, $x, $y) = $ast->getDeclarations()->getChildren();

    $x = expect($x)->toBeInstanceOf(ExpressionStatement::class);
    $x_expr = $x->getExpressionx() as BinaryExpression;
    $some_const = expect($x_expr->getRightOperand())->toBeInstanceOf(
      NameExpression::class,
    );
    $name_token = expect($some_const->getWrappedNode())->toBeInstanceOf(
      NameToken::class,
    );
    expect($name_token->getText())->toBeSame('SOME_CONST');

    $y = expect($y)->toBeInstanceOf(ExpressionStatement::class);
    $y_expr = $y->getExpressionx() as BinaryExpression;
    $some_namespaced_const = expect($y_expr->getRightOperand())->toBeInstanceOf(
      NameExpression::class,
    );
    $qualified_name = expect($some_namespaced_const->getWrappedNode())
      ->toBeInstanceOf(QualifiedName::class);
    expect(
      $qualified_name->getDescendantsOfType(Token::class)
        |> Vec\map($$, $t ==> $t->getText())
        |> Str\join($$, ''),
    )->toBeSame("SOME\\NAMESPACED\\CONST");
  }

  public async function testNameTokenWrappedInListOfItemsOfExpressions(
  ): Awaitable<void> {
    // Make sure that tokens in List<ListItem<IExpression>> get wrapped
    $code = "<?hh \$x = tuple(SOME_CONST, SOME\\NAMESPACED\\CONST);";
    $ast = await from_file_async(File::fromPathAndContents('/dev/null', $code));
    list($_markup, $x) = $ast->getDeclarations()->getChildren();
    $x = expect($x)->toBeInstanceOf(ExpressionStatement::class);
    $x_expr = $x->getExpressionx() as BinaryExpression;
    $rhs = expect($x_expr->getRightOperand())->toBeInstanceOf(
      TupleExpression::class,
    );
    list($c1, $c2) = $rhs->getItemsx()->getChildrenOfItems();
    $c1 = expect($c1)->toBeInstanceOf(
      NameExpression::class,
      'constant in tuple is not wrapped',
    );
    $c2 = expect($c2)->toBeInstanceOf(
      NameExpression::class,
      'namespaced constant in tuple is not wrapped',
    );
    $c1 = expect($c1->getWrappedNode())->toBeInstanceOf(NameToken::class);
    expect($c1->getText())->toBeSame('SOME_CONST');
    $c2 = expect($c2->getWrappedNode())->toBeInstanceOf(QualifiedName::class);
    expect(
      $c2->getDescendantsOfType(Token::class)
        |> Vec\map($$, $t ==> $t->getText())
        |> Str\join($$, ''),
    )->toBeSame("SOME\\NAMESPACED\\CONST");
  }

  public async function testXHPClassNameAsNameExpression(
  ): Awaitable<void> {
    $code = "<?hh class :foo { children (pcdata | :bar+); }";
    $ast = await from_file_async(File::fromPathAndContents('/dev/null', $code));
    list($_markup, $x) = $ast->getDeclarations()->getChildren();
    $class = expect($x)->toBeInstanceOf(ClassishDeclaration::class);
    $decl = $class->getBody()->getElementsx()->getChildrenOfType(XHPChildrenDeclaration::class) |> C\onlyx($$);

    // :bar+
    $bin_expr = $decl->getDescendantsOfType(PostfixUnaryExpression::class) |> C\onlyx($$);
    $lhs = $bin_expr->getOperand();
    $lhs = expect($lhs)->toBeInstanceOf(NameExpression::class);
    expect($lhs->getCode())->toBeSame(':bar');
    expect($lhs->getWrappedNode())->toBeInstanceOf(XHPClassNameToken::class);
    $rhs = $bin_expr->getOperator();
    expect($rhs)->toBeInstanceOf(PlusToken::class);
  }
}
