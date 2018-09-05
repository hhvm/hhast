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

final abstract class CLIColoredUnifiedDiff extends ColoredUnifiedDiff<string> {
  const string RESET = "\e[0m";
  const string BLUE = "\e[36m";
  const string RED = "\e[31m";
  const string GREEN = "\e[32m";

  const string HEADER_COLOR = self::BLUE;
  const string KEEP_COLOR = self::RESET;
  const string DELETE_COLOR = self::RED;
  const string INSERT_COLOR = self::GREEN;

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
}
