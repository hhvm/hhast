/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\TestLib;

use namespace Facebook\DiffLib;
use namespace HH\Lib\{C, Str, Vec};

final class ExpectObj<T> extends \Facebook\FBExpect\ExpectObj<T> {
  public function __construct(private T $var) {
    parent::__construct($var);
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
    if (!Str\starts_with($expect_file, '/')) {
      $expect_file = __DIR__.'/../examples/'.$expect_file;
      $input_file = __DIR__.'/../examples/'.$input_file;
    }
    $out_file = Str\strip_suffix($expect_file, '.expect').'.out';
    $code = $this->var;

    \file_put_contents(Str\strip_suffix($expect_file, '.expect').'.out', $code);
    if (!\file_exists($expect_file)) {
      \stream_set_blocking(\STDERR, true);
      \fprintf(\STDERR, "\n===== NEW TEST: %s =====\n", $expect_file);
      \fprintf(\STDERR, "----- %s -----\n", $input_file);
      \fwrite(\STDERR, \file_get_contents($input_file));
      \fprintf(\STDERR, "----- %s -----\n", $out_file);
      \fwrite(\STDERR, $code);

      $diff = DiffLib\StringDiff::lines(\file_get_contents($input_file), $code);
      $kept_lines = $diff->getDiff()
        |> Vec\filter($$, $op ==> $op is DiffLib\DiffKeepOp<_>)
        |> C\count($$);
      $total_lines = Str\split($code, "\n") |> C\count($$);
      // Arbitrary heuristic for if rendering a diff makes sense; e.g. if the
      // input file is Hack but the output is JSON error data, it doesn't.
      if ($kept_lines >= 0.1 * $total_lines) {
        if (\posix_isatty(\STDERR)) {
          $diff = DiffLib\CLIColoredUnifiedDiff::create(
            \file_get_contents($input_file),
            $code,
          );
        } else {
          $diff = $diff->getUnifiedDiff();
        }
        \fprintf(
          \STDERR,
          "----- diff -u %s %s ----\n",
          \basename($input_file),
          \basename($out_file),
        );
        \fwrite(\STDERR, $diff);
      }
      \fwrite(\STDERR, "----- END -----\n");
      \stream_set_blocking(\STDERR, false);

      if (\posix_isatty(\STDIN) && \posix_isatty(\STDERR)) {
        \fprintf(\STDERR, 'Would you like to save this output? [y/N] ');
        \stream_set_blocking(\STDIN, true);
        $response = Str\trim(\fgets(\STDIN));
        \stream_set_blocking(\STDIN, false);
        if ($response === 'y') {
          \file_put_contents($expect_file, $code);
        }
      } else {
        throw new \Exception($expect_file.' does not exist');
      }
    }
    $this->toBeSame(\file_get_contents($expect_file));
  }
}
