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
use namespace HH\Lib\{Dict, Vec};

final class ResolutionTest extends TestCase {
  private static async function getRootAndNodeAsync(
    string $code,
  ): Awaitable<(Script, ClassishDeclaration)> {
    $ast = await from_file_async(File::fromPathAndContents('/dev/null', $code));
    $node = $ast->getFirstDescendantByType<ClassishDeclaration>() as nonnull;
    return tuple($ast, $node);
  }

  public async function testWithoutNamespaces(): Awaitable<void> {
    list($root, $node) = await self::getRootAndNodeAsync('<?hh class Foo {}');
    expect(Resolution\get_current_namespace($root, $node))->toBeNull();
  }

  public async function testMultipleClassesInNamespaceBlock(): Awaitable<void> {
    $code = '<?hh namespace MyNS\\SubNS { class Foo {}; class Bar {} }';
    $ast = await from_file_async(File::fromPathAndContents('/dev/null', $code));
    $namespace_names = $ast->getDescendantsByType<NamespaceDeclaration>()
      |> Vec\map($$, $namespace ==> $namespace->getQualifiedNameAsString());
    expect($namespace_names)->toBeSame(vec[
      'MyNS\\SubNS',
    ]);
    $class_names = $ast->getDescendantsByType<ClassishDeclaration>()
      |> Vec\map($$, $class ==> {
        return Resolution\get_current_namespace($ast, $class) as nonnull.
          '\\'.
          $class->getName()->getText();
      });
    expect($class_names)->toBeSame(vec[
      'MyNS\\SubNS\\Foo',
      'MyNS\\SubNS\\Bar',
    ]);
  }

  public async function testWithNamespaceStatement(): Awaitable<void> {
    list($root, $node) = await self::getRootAndNodeAsync(
      '<?hh namespace MyNS\\SubNS; class Foo {}',
    );
    expect(Resolution\get_current_namespace($root, $node))
      ->toBeSame('MyNS\\SubNS');
  }

  public async function testWithNamespaceBlock(): Awaitable<void> {
    list($root, $node) = await self::getRootAndNodeAsync(
      '<?hh namespace MyNS\\SubNS { class Foo {} }',
    );
    expect(Resolution\get_current_namespace($root, $node))
      ->toBeSame('MyNS\\SubNS');
  }

  public async function testWithUnrelatedNamespaceBlock(): Awaitable<void> {
    list($root, $node) = await self::getRootAndNodeAsync(
      '<?hh namespace MyNS { } namespace { class Foo {} }',
    );
    expect(Resolution\get_current_namespace($root, $node))->toBeNull();
  }

  public function getUseStatementExamples(): vec<(
    string,
    shape(
      'namespaces' => dict<string, string>,
      'types' => dict<string, string>,
      'functions' => dict<string, string>,
    ),
  )> {
    return vec[
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
          'functions' => dict[
            'Foo' => 'Foo',
            'Bar' => 'Bar',
            'Baz' => 'Baz',
          ],
        ),
      ),
      tuple(
        '<?hh use namespace Foo, type Bar, function Baz; class Target {}',
        shape(
          'namespaces' => dict['Foo' => 'Foo'],
          'types' => dict['Bar' => 'Bar'],
          'functions' => dict['Baz' => 'Baz'],
        ),
      ),
      tuple(
        '<?hh use Foo as Bar, type Herp as Derp, function Hot as Cold; '.
        'class Target {}',
        shape(
          'namespaces' => dict['Bar' => 'Foo'],
          'types' => dict['Bar' => 'Foo', 'Derp' => 'Herp'],
          'functions' => dict['Bar' => 'Foo', 'Cold' => 'Hot'],
        ),
      ),
      tuple(
        '<?hh use type Foo;'.
        'namespace Bar { use type Herp\\Derp; class Target {} }',
        shape(
          'namespaces' => dict[],
          'types' => dict['Foo' => 'Foo', 'Derp' => 'Herp\\Derp'],
          'functions' => dict[],
        ),
      ),
      tuple(
        '<?hh use type NS\\{Foo, Bar}; use function NS\\{Herp, Derp}; '.
        'class Target{}',
        shape(
          'namespaces' => dict[],
          'types' => dict['Foo' => 'NS\\Foo', 'Bar' => 'NS\\Bar'],
          'functions' => dict['Herp' => 'NS\\Herp', 'Derp' => 'NS\\Derp'],
        ),
      ),
      // Verify meaningless "\" are stripped.
      tuple(
        '<?hh use namespace \\Foo, type \\Bar, function \\Baz; class Target{}',
        shape(
          'namespaces' => dict['Foo' => 'Foo'],
          'types' => dict['Bar' => 'Bar'],
          'functions' => dict['Baz' => 'Baz'],
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
      'functions' => dict<string, string>,
    ) $expected,
  ): Awaitable<void> {
    list($root, $node) = await self::getRootAndNodeAsync($code);
    $uses = Resolution\get_current_uses($root, $node);
    // Discard blame node for comparison
    $actual = shape(
      'namespaces' => Dict\map($uses['namespaces'], $v ==> $v['name']),
      'types' => Dict\map($uses['types'], $v ==> $v['name']),
      'functions' => Dict\map($uses['functions'], $v ==> $v['name']),
    );
    expect($actual)->toBeSame($expected, 'Source: %s', $code);
  }

  public function getTypeResolutionExamples(): vec<(string, string, string)> {
    return vec[
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
      // generics
      tuple('<?hh namespace Foo; class Target<T> {}', 'T', 'T'),
      // multiple namespaces
      tuple(
        'namespace Foo; namespace Bar; class Target {}',
        'Target',
        'Bar\\Target',
      ),
      tuple(
        'namespace Foo; class Target {} namespace Bar;',
        'Target',
        'Foo\\Target',
      ),
      tuple(
        'class Target {} namespace Foo; namespace Bar;',
        'Target',
        'Target',
      ),
      // multiple namespaces with a "use" statement
      tuple(
        'use type Herp\Derp; namespace Foo; namespace Bar; class Target {}',
        'Derp',
        'Herp\\Derp',
      ),
      tuple(
        'namespace Foo; use type Herp\Derp; namespace Bar; class Target {}',
        'Derp',
        'Bar\\Derp',
      ),
      tuple(
        'namespace Foo; namespace Bar; use type Herp\Derp; class Target {}',
        'Derp',
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
    list($root, $node) = await self::getRootAndNodeAsync($code);
    expect(resolve_type($type, $root, $node)['name'])
      ->toBeSame($expected);
  }
}
