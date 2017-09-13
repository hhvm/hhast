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
    ?string $in_file = null,
  ): void {
    $expect_file = __DIR__.'/fixtures/'.$expect_file;
    $out_file = Str\strip_suffix($expect_file, '.expect').'.out';
    $in_file = $in_file === null
      ? Str\strip_suffix($expect_file, '.expect').'.in'
      : __DIR__.'/fixtures/'.$in_file;

    file_put_contents(
      Str\strip_suffix($expect_file, '.expect').'.out',
      $code,
    );
    if (!file_exists($expect_file)) {
      fprintf(STDERR, "\n===== NEW TEST: %s =====\n", $expect_file);
      fprintf(STDERR, "----- %s -----\n", $in_file);
      fwrite(STDERR, file_get_contents($in_file));
      fprintf(STDERR, "----- %s -----\n", $out_file);
      fwrite(STDERR, $code);
      fwrite(STDERR, "----- END -----\n");

      $recorded = false;
      if (posix_isatty(STDIN) && posix_isatty(STDERR)) {
        fprintf(STDERR, "Would you like to save this output? [y/N] ");
        $response = Str\trim(fgets(STDIN));
        if ($response === 'y') {
          file_put_contents($expect_file, $code);
          $recorded = true;
        }
      } else {
        $this->markTestIncomplete($expect_file.' does not exist');
      }
    }
    expect($code)->toBeSame(file_get_contents($expect_file));
  }

  protected static function getNodeAndParents(
    string $code,
  ): (EditableSyntax, vec<EditableSyntax>) {
    $ast = from_code($code);
    $node = $ast->getDescendantsOfType(ClassishDeclaration::class) |> C\firstx($$);
    $parents = vec($ast->find_with_parents($x ==> $x === $node));
    return tuple($node, $parents);
  }
}
