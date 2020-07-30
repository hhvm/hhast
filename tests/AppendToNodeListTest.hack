/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

use function Facebook\HHAST\TestLib\expect;

final class AppendToNodeListTest extends TestCase {

  public async function testAppendToNodeList(): Awaitable<void> {
    $ast = await from_file_async(
      File::fromPath(__DIR__.'/examples/append_to_nodelist.hack.in'),
    );
    $ast = $ast->rewrite(
      ($node, $_) ==>
        $node is FunctionDeclaration ? self::rewriteFunction($node) : $node,
    );
    expect($ast->getCode())
      ->toMatchExpectFile('append_to_nodelist.hack.expect');
  }

  private static function rewriteFunction(
    FunctionDeclaration $fun,
  ): FunctionDeclaration {
    $new_params = vec[];
    foreach (vec['foo', 'bar'] as $param_name) {
      $new_params[] = new ParameterDeclaration(
        null,
        null,
        null,
        new SimpleTypeSpecifier(new IntToken(null, null)),
        new VariableToken(
          NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]),
          null,
          '$'.$param_name,
        ),
        null,
      );
    }

    $name = $fun->getDeclarationHeader()->getName() as NameToken->getText();
    $param_list = $fun->getDeclarationHeader()->getParameterList() ??
      NodeList::createMaybeEmptyList(vec[]);

    switch ($name) {
      case 'zero_to_one':
      case 'one_to_two':
      case 'two_to_three':
      case 'multiline_zero_to_one':
      case 'multiline_one_to_two':
      case 'multiline_two_to_three':
        // add 1 parameter
        return $fun->withDeclarationHeader(
          $fun->getDeclarationHeader()->withParameterList(
            append_to_nodelist(
              $param_list,
              vec[$new_params[0]],
              CommaToken::class,
            ),
          ),
        );
        break;

      case 'zero_to_two':
      case 'one_to_three':
      case 'two_to_four':
      case 'multiline_zero_to_two':
      case 'multiline_one_to_three':
      case 'multiline_two_to_four':
      case 'no_trailing_comma_one':
      case 'no_trailing_comma_two':
      case 'with_comments1':
      case 'with_comments2':
      case 'with_comments3':
      case 'with_comments4':
      case 'with_comments5':
      case 'with_comments6':
      case 'with_comments7':
      case 'with_comments8':
      case 'with_comments9':
      case 'with_comments10':
      case 'with_comments11':
      case 'with_comments12':
      case 'with_comments13':
      case 'with_comments14':
        // add 2 parameters
        return $fun->withDeclarationHeader(
          $fun->getDeclarationHeader()->withParameterList(
            append_to_nodelist($param_list, $new_params, CommaToken::class),
          ),
        );
        break;

      default:
        invariant_violation('Missing test code for function %s.', $name);
    }
  }
}
