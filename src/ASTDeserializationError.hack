/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str};

final class ASTDeserializationError extends ASTError {
  public function __construct(
    string $file,
    int $offset,
    string $source,
    \Throwable $previous,
  ) {
    $pre = Str\slice($source, 0, $offset) |> Str\split($$, "\n");
    $eol = Str\search($source, "\n", $offset);
    $pre_line = C\lastx($pre);
    $rest = Str\slice($source, $offset, $eol === null ? null : $eol - $offset);
    $line = $pre_line.$rest;
    $line_number = C\count($pre);
    $previous_line = $pre[$line_number - 2] ?? null;

    if ($previous_line === null) {
      $source = Str\format(
        "%5d %s\n     %s ^ HERE",
        $line_number,
        $line,
        Str\repeat('-', Str\length($pre_line)),
      );
    } else {
      $source = Str\format(
        "%5d %s\n%5d %s\n     %s ^ HERE",
        $line_number - 1,
        $previous_line,
        $line_number,
        $line,
        Str\repeat('-', Str\length($pre_line)),
      );
    }

    parent::__construct(
      $file,
      $offset,
      'Failed to deserialize AST: '.$previous->getMessage()."\n".$source,
    );
    $this->setPrevious(/* HH_FIXME[4110] bad HHI wants Exception */ $previous);
  }
}
