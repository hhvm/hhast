<?hh // strict
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

final class ResolutionTest extends TestCase {
  public function testWithoutNamespaces(): void {
    list($node, $parents) = self::getNodeAndParents('<?hh class Foo {}');
    expect(Resolution\get_current_namespace($node, $parents))->toBeNull();
  }

  public function testWithNamespaceStatement(): void {
    list($node, $parents) = self::getNodeAndParents(
      '<?hh namespace MyNS\\SubNS; class Foo {}'
    );
    expect(Resolution\get_current_namespace($node, $parents))
      ->toBeSame('MyNS\\SubNS');
  }

  public function testWithNamespaceBlock(): void {
    list($node, $parents) = self::getNodeAndParents(
      '<?hh namespace MyNS\\SubNS { class Foo {} }'
    );
    expect(Resolution\get_current_namespace($node, $parents))
      ->toBeSame('MyNS\\SubNS');
  }

  public function testWithUnrelatedNamespaceBlock(): void {
    list($node, $parents) = self::getNodeAndParents(
      '<?hh namespace \\MyNS { } namespace { class Foo {} }'
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
  public function testUseStatementResolution(
    string $code,
    shape(
      'namespaces' => dict<string, string>,
      'types' => dict<string, string>,
    ) $expected,
  ): void {
    list($node, $parents) = self::getNodeAndParents($code);
    expect(Resolution\get_current_uses($node, $parents))->toBeSame($expected);
  }

  public function getTypeResolutionExamples(): array<(string, string, string)> {
    return [
      tuple(
        '<?hh class Target {}',
        'Foo',
        'Foo',
      ),
      tuple(
        '<?hh use Foo\\Bar; class Target {}',
        'Bar',
        'Foo\\Bar',
      ),
      tuple(
        '<?hh use Foo as Bar; class Target {}',
        'Bar',
        'Foo',
      ),
      tuple(
        '<?hh use Foo as Bar; class Target {}',
        'Bar\\Baz',
        'Foo\\Baz',
      ),
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
  public function testTypeResolution(
    string $code,
    string $type,
    string $expected,
  ): void {
    list($node, $parents) = self::getNodeAndParents($code);
    expect(resolve_type($type, $node, $parents))
      ->toBeSame($expected);
  }
}
