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
use type Facebook\HackTest\DataProvider;

final class TypeSpecifierOrContextsTest extends TestCase {
  public function getTypeConstraintExamples(
  ): dict<string, (string, classname<Node>)> {
    return dict[
      'unwrapped type specifier' => tuple(
        'abstract const type TFoo as shape(...)',
        ShapeTypeSpecifier::class,
      ),
      'wrapped type specifier' => tuple(
        'abstract const type TFoo as MyClass',
        SimpleTypeSpecifier::class,
      ),
    ];
  }

  <<DataProvider('getTypeConstraintExamples')>>
  public async function testTypeConstraintExample(
    string $code,
    classname<Node> $expected,
  ): Awaitable<void> {
    $ast = await from_file_async(
      File::fromPathAndContents(
        '/dev/null',
        'abstract class Foo { '.$code.'; }',
      ),
    );
    $constraint = expect($ast->getFirstDescendantByType<TypeConstraint>())
      ->toNotBeNull('Expected the AST to contain a %s!', TypeConstraint::class);
    expect($constraint->getType())->toBeInstanceOf($expected);
  }

  public function getContextConstraintExamples(): dict<string, (string)> {
    return dict[
      'contexts' => tuple('abstract const ctx CFoo super [defaults]'),
    ];
  }

  <<DataProvider('getContextConstraintExamples')>>
  public async function testContextConstraintExample(
    string $code,
  ): Awaitable<void> {
    $ast = await from_file_async(
      File::fromPathAndContents(
        '/dev/null',
        'abstract class Foo { '.$code.'; }',
      ),
    );
    expect($ast->getFirstDescendantByType<ContextConstraint>())->toNotBeNull(
      'Expected the AST to contain a %s!',
      ContextConstraint::class,
    );
  }
}
