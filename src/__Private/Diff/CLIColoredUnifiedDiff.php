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

/** Create a colored diff between two strings, using standard terminal
 * escape sequences.
 *
 * This class does not check that the current terminal supports color escape
 * sequences.
 *
 * If the terminal does not support color escape sequences (or if you don't
 * know), you probably want `StringDiff::lines($a, $b)->getUnifiedDiff()`
 * instead.
 */
final abstract class CLIColoredUnifiedDiff extends ColoredUnifiedDiff<string> {
  const string RESET = "\e[0m";
  const string BLACK = "\e[30m";
  const string BLUE = "\e[36m";
  const string RED = "\e[31m";
  const string GREEN = "\e[32m";

  /** Swap foreground and background colors */
  const string INVERTED = "\e[7m";

  const string HEADER_COLOR = self::BLUE;
  const string KEEP_COLOR = self::RESET;
  const string DELETE_COLOR = self::RED;
  const string INSERT_COLOR = self::GREEN;
  const string INTRALINE_DELETE_COLOR = self::INVERTED;
  const string INTRALINE_INSERT_COLOR = self::INVERTED;

  <<__Override>>
  protected static function colorHeaderLine(string $line): string {
    return self::HEADER_COLOR.$line.self::RESET;
  }

  <<__Override>>
  protected static function colorKeepLine(string $line): string {
    return self::KEEP_COLOR.$line.self::RESET;
  }

  <<__Override>>
  protected static function colorDeleteLine(string $line): string {
    return self::DELETE_COLOR.$line.self::RESET;
  }

  <<__Override>>
  protected static function colorInsertLine(string $line): string {
    return self::INSERT_COLOR.$line.self::RESET;
  }

  <<__Override>>
  final protected static function join(vec<string> $lines): string {
    return Str\join($lines, "\n")."\n";
  }

  <<__Override>>
  final protected static function colorDeleteLineWithIntralineEdits(
    vec<DiffOp<string>> $ops,
  ): string {
    $line = self::DELETE_COLOR.'- ';
    foreach ($ops as $op) {
      if ($op is DiffKeepOp<_>) {
        $line .= $op->getContent();
        continue;
      }
      if ($op is DiffDeleteOp<_>) {
        $line .= self::INTRALINE_DELETE_COLOR.
          $op->getContent().
          self::RESET.
          self::DELETE_COLOR;
        continue;
      }
    }
    return $line.self::RESET;
  }

  <<__Override>>
  final protected static function colorInsertLineWithIntralineEdits(
    vec<DiffOp<string>> $ops,
  ): string {
    $line = self::INSERT_COLOR.'+ ';
    foreach ($ops as $op) {
      if ($op is DiffKeepOp<_>) {
        $line .= $op->getContent();
        continue;
      }
      if ($op is DiffInsertOp<_>) {
        $line .= self::INTRALINE_INSERT_COLOR.
          $op->getContent().
          self::RESET.
          self::INSERT_COLOR;
        continue;
      }
    }
    return $line.self::RESET;
  }

}
