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
        Str\trim($method->getFunctionDeclHeader()->getName()->getCode()),
        Str\trim($class->getName()->getCode()),
      ),
      $method,
      () ==> $this->getFixedNode($method),
    );
  }

  <<__Override>>
  public function getTitleForFix(LintError $_): string {
    return 'Remove final from method';
  }

  public function getFixedNode(
    MethodishDeclaration $method,
  ): MethodishDeclaration {
    $function_decl_header = $method->getFunctionDeclHeader();
    $modifiers = $function_decl_header->getModifiers() as nonnull;

    $final = $modifiers
      ->filterChildren($modifier ==> $modifier is FinalToken)
      ->getFirstTokenx();

    $next_token = $this->getAST()->getNextToken($final);
    invariant($next_token is nonnull, 'Could not find token after final');

    $decl_without_final = $function_decl_header->withModifiers(
      $modifiers->filterChildren($modifier ==> !$modifier is FinalToken),
    );


    $final_trivia = $final->getTrailing()->getCode() === ' '
      // In the /common/ case that final only has one trailing space,
      // ignore it for nicer diffs.
      ? $final->getLeading()
      : NodeList::concat($final->getLeading(), $final->getTrailing());

    $decl_without_final = $decl_without_final->replace(
      $next_token,
      $next_token->withLeading(
        NodeList::concat($final_trivia, $next_token->getLeading()),
      ),
    );

    return $method->withFunctionDeclHeader($decl_without_final);
  }

  private static function hasFinalModifier(NodeList<Token> $modifiers): bool {
    return C\any($modifiers->toVec(), $token ==> $token is FinalToken);
  }
}
