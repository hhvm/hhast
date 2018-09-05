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

use namespace HH\Lib\{C, Str, Vec};

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

  /** Render a deletion line from character keep/delete operations.
   *
   * If we have `- foo` `+ bar` where `foo` and `bar` are very similar, this
   * allows highlighting the changed characters in addition to/instead of the
   * whole line.
   *
   * Note that the input does not include the `- `, and you may want to re-add
   * it.
   *
   * The default implementation prepends `- ` then delegates to
   * `colorDeleteLine()` without doing any special handling.
   */
  protected static function colorDeleteLineWithIntralineEdits(
    vec<DiffOp<string>> $ops,
  ): TOut {
    return static::colorDeleteLine(
      '- '.(Vec\map($ops, $op ==> $op->getContent()) |> Str\join($$, '')),
    );
  }

  /** Render an insertion line from character keep/insert operations.
   *
   * If we have `- foo` `+ bar` where `foo` and `bar` are very similar, this
   * allows highlighting the changed characters in addition to/instead of the
   * whole line.
   *
   * Note that the input does not include the `+ `, and you may want to re-add
   * it.
   *
   * The default implementation prepends `+ ` then delegates to
   * `colorInsertLine()` without doing any special handling.
   */
	protected static function colorInsertLineWithIntralineEdits(
		vec<DiffOp<string>> $ops,
	): TOut {
		return static::colorInsertLine(
			'+ '.(Vec\map($ops, $op ==> $op->getContent()) |> Str\join($$, '')),
		);
	}


  abstract protected static function join(vec<TOut> $lines): TOut;

  final public static function create(
    string $a,
    string $b,
    int $context = 3,
  ): TOut {
    $diff = StringDiff::lines($a, $b)->getUnifiedDiff($context);

    $out = vec[];
    $lines = Str\split($diff, "\n");
    while (!C\is_empty($lines)) {
      $line = C\firstx($lines);
      $lines = Vec\drop($lines, 1);

      if ($line === '') {
        invariant(C\is_empty($lines), "Blank line was not last line");
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
        $next = C\first($lines);
        if (
          $next !== null
          && $next !== ''
          && $next[0] === '+'
          // -2 to deal with the prefix
          && \levenshtein($line, $next) - 2 <= (0.5 * (Str\length($line) - 2))
        ) {
          // Drop the prefix
          $line = Str\slice($line, 2);
          $next = Str\slice($next, 2);
          $lines = Vec\drop($lines, 1);

          $intraline = StringDiff::characters($line, $next)->getDiff();
          $out[] = $intraline
            |> Vec\filter($$, $op ==> !$op is DiffInsertOp<_>)
            |> static::colorDeleteLineWithIntralineEdits($$);
          $out[] = $intraline
            |> Vec\filter($$, $op ==> !$op is DiffDeleteOp<_>)
            |> static::colorInsertLineWithIntralineEdits($$);
          continue;
        }
        $out[] = static::colorDeleteLine($line);
        continue;
      }
      invariant_violation('unhandled line prefix: %s', $line[0]);
    }

    return static::join($out);
  }
}
