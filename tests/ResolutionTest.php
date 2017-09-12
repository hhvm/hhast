<?hh // strict

/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

use function Facebook\FBExpect\expect;
use namespace Facebook\HHAST\__Private\Resolution;
use namespace HH\Lib\{C, Vec};

final class ResolutionTest extends TestCase {
  private static function getNodeAndParents(
    string $code,
  ): (EditableSyntax, vec<EditableSyntax>) {
    $ast = from_code($code);
    $node = $ast->of_class(ClassishDeclaration::class) |> C\firstx($$);
    $parents = vec($ast->find_with_parents($x ==> $x === $node));
    return tuple($node, $parents);
  }
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

  public function testWithNamespaceStatementAndLeadingBackslash(): void {
    list($node, $parents) = self::getNodeAndParents(
      '<?hh namespace \\MyNS\\SubNS; class Foo {}'
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

  public function testWithNamespaceBlockAndLeadingBackslash(): void {
    list($node, $parents) = self::getNodeAndParents(
      '<?hh namespace \\MyNS\\SubNS { class Foo {} }'
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
}
