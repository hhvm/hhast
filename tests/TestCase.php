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
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str};

abstract class TestCase extends \PHPUnit\Framework\TestCase {
  protected function assertMatches(
    string $code,
    string $expect_file,
  ): void {
    $expect_file = __DIR__.'/fixtures/'.$expect_file;
    $out_file = Str\strip_suffix($expect_file, '.expect').'.out';
    $in_file = Str\strip_suffix($expect_file, '.expect').'.in';

    file_put_contents(
      Str\strip_suffix($expect_file, '.expect').'.out',
      $code,
    );
    if (!file_exists($expect_file)) {
      printf("\n===== NEW TEST: %s =====\n", $expect_file);
      printf("----- %s -----\n", $in_file);
      print(file_get_contents($in_file));
      printf("----- %s -----\n", $out_file);
      print($code);
      print("----- END -----\n");

      $this->markTestIncomplete($expect_file.' does not exist');
    }
    expect($code)->toBeSame(file_get_contents($expect_file));
  }

  protected static function getNodeAndParents(
    string $code,
  ): (EditableSyntax, vec<EditableSyntax>) {
    $ast = from_code($code);
    $node = $ast->of_class(ClassishDeclaration::class) |> C\firstx($$);
    $parents = vec($ast->find_with_parents($x ==> $x === $node));
    return tuple($node, $parents);
  }
}
