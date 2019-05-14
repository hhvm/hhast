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
use namespace Facebook\HHAST\__Private\Resolution;
use type Facebook\HackTest\DataProvider;
use namespace HH\Lib\Vec;

final class ResolutionTest extends TestCase {
  public async function testWithoutNamespaces(): Awaitable<void> {
    list($node, $parents) = await self::getNodeAndParentsAsync(
      '<?hh class Foo {}',
    );
    expect(Resolution\get_current_namespace($node, $parents))->toBeNull();
  }

  public async function testMultipleClassesInNamespaceBlock(): Awaitable<void> {
    $code = '<?hh namespace MyNS\\SubNS { class Foo {}; class Bar {} }';
    $ast = await from_file_async(File::fromPathAndContents('/dev/null', $code));
    $namespace_names = $ast->getDescendantsOfType(NamespaceDeclaration::class)
      |> Vec\map($$, $namespace ==> $namespace->getQualifiedNameAsString());
    expect($namespace_names)->toBeSame(vec[
      "MyNS\\SubNS",
    ]);
    $class_names = $ast->getDescendantsOfType(ClassishDeclaration::class)
      |> Vec\map($$, $class ==> {
        $parents = $ast->findWithParents($x ==> $x === $class);
        return Resolution\get_current_namespace($class, $parents).
          "\\".
          ($class->getName() as EditableToken)->getText();
      });
    expect($class_names)->toBeSame(vec[
      "MyNS\\SubNS\\Foo",
      "MyNS\\SubNS\\Bar",
    ]);
  }

  public async function testWithNamespaceStatement(): Awaitable<void> {
    list($node, $parents) = await self::getNodeAndParentsAsync(
      '<?hh namespace MyNS\\SubNS; class Foo {}',
    );
    expect(Resolution\get_current_namespace($node, $parents))
      ->toBeSame('MyNS\\SubNS');
  }

  public async function testWithNamespaceBlock(): Awaitable<void> {
    list($node, $parents) = await self::getNodeAndParentsAsync(
      '<?hh namespace MyNS\\SubNS { class Foo {} }',
    );
    expect(Resolution\get_current_namespace($node, $parents))
      ->toBeSame('MyNS\\SubNS');
  }

  public async function testWithUnrelatedNamespaceBlock(): Awaitable<void> {
    list($node, $parents) = await self::getNodeAndParentsAsync(
      '<?hh namespace \\MyNS { } namespace { class Foo {} }',
    );
    expect(Resolution\get_current_namespace($node, $parents))->toBeNull();
  }

  public function getUseStatementExamples(
  ): array<(
    string,
    shape(
      'namespaces' => dict<string, string>,
      'types' => dict<string, string>,
    ),
  )> {
    return [
      tuple(
        '<?hh use Foo; use Bar, Baz; class Target {}',
        shape(
          'namespaces' => dict[
            'Foo' => 'Foo',
            'Bar' => 'Bar',
            'Baz' => 'Baz',
          ],
          'types' => dict[
            'Foo' => 'Foo',
            'Bar' => 'Bar',
            'Baz' => 'Baz',
          ],
        ),
      ),
      tuple(
        '<?hh use namespace Foo, type Bar; class Target {}',
        shape(
          'namespaces' => dict['Foo' => 'Foo'],
          'types' => dict['Bar' => 'Bar'],
        ),
      ),
      tuple(
        '<?hh use Foo as Bar, type Herp as Derp; class Target {}',
        shape(
          'namespaces' => dict['Bar' => 'Foo'],
          'types' => dict['Bar' => 'Foo', 'Derp' => 'Herp'],
        ),
      ),
      tuple(
        '<?hh use type Foo;'.
        'namespace Bar { use type Herp\\Derp; class Target {} }',
        shape(
          'namespaces' => dict[],
          'types' => dict['Foo' => 'Foo', 'Derp' => 'Herp\\Derp'],
        ),
      ),
      tuple(
        '<?hh use type Foo;'.
        'namespace Bar { use type Herp\\Derp; } class Target {}',
        shape(
          'namespaces' => dict[],
          'types' => dict['Foo' => 'Foo'],
        ),
      ),
      tuple(
        '<?hh use type NS\\{Foo, Bar}; class Target{}',
        shape(
          'namespaces' => dict[],
          'types' => dict['Foo' => 'NS\\Foo', 'Bar' => 'NS\\Bar'],
        ),
      ),
    ];
  }

  <<DataProvider('getUseStatementExamples')>>
  public async function testUseStatementResolution(
    string $code,
    shape(
      'namespaces' => dict<string, string>,
      'types' => dict<string, string>,
    ) $expected,
  ): Awaitable<void> {
    list($node, $parents) = await self::getNodeAndParentsAsync($code);
    expect(Resolution\get_current_uses($node, $parents))->toBeSame($expected);
  }

  public function getTypeResolutionExamples(): array<(string, string, string)> {
    return [
      tuple('<?hh class Target {}', 'Foo', 'Foo'),
      tuple('<?hh use Foo\\Bar; class Target {}', 'Bar', 'Foo\\Bar'),
      tuple('<?hh use Foo as Bar; class Target {}', 'Bar', 'Foo'),
      tuple('<?hh use Foo as Bar; class Target {}', 'Bar\\Baz', 'Foo\\Baz'),
      tuple(
        '<?hh use namespace Foo as Bar; use type Herp as Bar; class Target {}',
        'Bar',
        'Herp',
      ),
      tuple(
        '<?hh use namespace Foo as Bar; use type Herp as Bar; class Target {}',
        'Bar\\Baz',
        'Foo\\Baz',
      ),
      tuple(
        '<?hh use namespace Foo as Bar; use type Herp as Bar; class Target {}',
        'Herp\\Derp',
        'Herp\\Derp',
      ),
    ];
  }

  <<DataProvider('getTypeResolutionExamples')>>
  public async function testTypeResolution(
    string $code,
    string $type,
    string $expected,
  ): Awaitable<void> {
    list($node, $parents) = await self::getNodeAndParentsAsync($code);
    expect(resolve_type($type, $node, $parents))
      ->toBeSame($expected);
  }
}
