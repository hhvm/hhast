<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\Diff;

use namespace HH\Lib\Str;

/** Base class for colorizing diffs.
 *
 * Generic in output format - for example, `CLIColoredUnifiedDiff` produces
 * a `string`, but other subclasses could produce `XHPChild` if it were for
 * web use.
 */
abstract class ColoredUnifiedDiff<TOut> {
  abstract protected static function colorHeaderLine(string $line): TOut;
  abstract protected static function colorKeepLine(string $line): TOut;
  abstract protected static function colorDeleteLine(string $line): TOut;
  abstract protected static function colorInsertLine(string $line): TOut;

  abstract protected static function join(vec<TOut> $lines): TOut;

  final public static function create(
    string $a,
    string $b,
    int $context = 3,
  ): TOut {
    $diff = StringDiff::lines($a, $b)->getUnifiedDiff($context);

    $out = vec[];
    foreach (Str\split($diff, "\n") as $line) {
      if ($line === '') {
        break;
      }
      if ($line[0] === '@') {
        $out[] = static::colorHeaderLine($line);
        continue;
      }
      if ($line[0] === ' ') {
        $out[] = static::colorKeepLine($line);
        continue;
      }
      if ($line[0] === '+') {
        $out[] = static::colorInsertLine($line);
        continue;
      }
      if ($line[0] === '-') {
        $out[] = static::colorDeleteLine($line);
        continue;
      }
      invariant_violation('unhandled line prefix: %s', $line[0]);
    }

    return static::join($out);
  }
}
