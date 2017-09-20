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

namespace Facebook\HHAST\TestLib;

use namespace HH\Lib\{C, Str};
use type Facebook\FBExpect\ExpectObj as ExpectBase;

final class ExpectObj<T> extends ExpectBase<T> {
  public function __construct(
    protected ImmVector<T> $vars,
  ) {
    parent::__construct($vars);
  }

  public function toMatchExpectFile(
    string $expect_file,
  ): void where T = string {
    $this->toMatchExpectFileWithInputFile(
      $expect_file,
      Str\strip_suffix($expect_file, '.expect').'.in',
    );
  }

  public function toMatchExpectFileWithInputFile(
    string $expect_file,
    string $input_file,
  ): void where T = string {
    $expect_file = __DIR__.'/../fixtures/'.$expect_file;
    $out_file = Str\strip_suffix($expect_file, '.expect').'.out';
    $in_file = __DIR__.'/../fixtures/'.$input_file;
    $code = C\onlyx($this->vars);

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
    $this->toBeSame(file_get_contents($expect_file));
  }
}
