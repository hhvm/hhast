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
  public function getExamples(): dict<string, (string, classname<Node>)> {
    return dict[
      'unwrapped type specifier' => tuple(
        'abstract const type TFoo as shape(...)',
        ShapeTypeSpecifier::class,
      ),
      'wrapped type specifier' => tuple(
        'abstract const type TFoo as MyClass',
        SimpleTypeSpecifier::class,
      ),
      'contexts' =>
        tuple('abstract const ctx CFoo super [defaults]', Contexts::class),
    ];
  }

  <<DataProvider('getExamples')>>
  public async function testExample(
    string $code,
    classname<Node> $expected,
  ): Awaitable<void> {
    if (\HHVM_VERSION_ID < 409300) {
      self::markTestSkipped('Requires HHVM 4.93');
    }
    $ast = await from_file_async(
      File::fromPathAndContents(
        '/dev/null',
        'abstract class Foo { '.$code.'; }',
      ),
    );
    $constraint = $ast->getFirstDescendantByType<TypeConstraint>() as nonnull;
    expect($constraint->getType())->toBeInstanceOf($expected);
  }
}
