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

final class NoFinalMethodInFinalClassLinter extends AutoFixingASTLinter {
  const type TNode = MethodishDeclaration;
  const type TContext = ClassishDeclaration;

  <<__Override>>
  public function getLintErrorForNode(
    ClassishDeclaration $class,
    MethodishDeclaration $method,
  ): ?ASTLintError {
    $class_modifiers = $class->getModifiers() ?? new NodeList();
    if (!self::hasFinalModifier($class_modifiers)) {
      return null;
    }
    $function_modifiers = $method->getFunctionDeclHeader()->getModifiers() ??
      new NodeList();
    if (!self::hasFinalModifier($function_modifiers)) {
      return null;
    }

    return new ASTLintError(
      $this,
      Str\format(
        'Method %s is final in the class %s, which is also final. This is redundant.',
        Str\trim($class->getName()->getCode()),
        Str\trim($method->getFunctionDeclHeader()->getCode()),
      ),
      $method,
      () ==> $this->getFixedNode($method),
    );

    echo $class->getName()->getCode().
      ' is final and has the final method '.
      $method->getFunctionDeclHeader()->getName()->getCode().
      \PHP_EOL;
  }

  <<__Override>>
  public function getTitleForFix(LintError $_): string {
    return 'Remove final from methods in final classes';
  }

  public function getFixedNode(
    MethodishDeclaration $method,
  ): MethodishDeclaration {
    $function_decl_header = $method->getFunctionDeclHeader();
    $modifiers = $function_decl_header->getModifiers() as nonnull;

    $final = $modifiers->filterChildren($modifier ==> $modifier is FinalToken)
      ->getFirstTokenx();
    $non_final = $modifiers->filterChildren(
      $modifier ==> !$modifier is FinalToken,
    );

    $decl_without_final = $function_decl_header->withModifiers($non_final);

    $decl_without_final = self::preserveTrivia(
      $final,
      $decl_without_final->getFirstTokenx(),
      $decl_without_final,
    );

    return $method->withFunctionDeclHeader($decl_without_final);
  }

  private static function preserveTrivia(
    Token $final,
    Token $first_token,
    FunctionDeclarationHeader $context,
  ): FunctionDeclarationHeader {

    $final_trivia = NodeList::concat(
      $final->getLeading(),
      $final->getTrailing()
        |> $$->getCode() === ' ' ? new NodeList() : $$,
    );
    $first_trivia = NodeList::concat($first_token->getLeading(), $final_trivia);

    return $context->replaceDescendant(
      $first_token,
      $first_token->withLeading($first_trivia),
    );
  }

  private static function hasFinalModifier(NodeList<Token> $modifiers): bool {
    return C\any($modifiers->toVec(), $token ==> $token is FinalToken);
  }
}
