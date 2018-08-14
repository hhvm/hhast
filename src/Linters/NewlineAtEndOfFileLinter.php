<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use namespace HH\Lib\{C, Math, Str, Vec};

final class NewlineAtEndOfFileLinter
  extends BaseLinter
  implements AutoFixingLinter<FixableLintError> {
  <<__Override>>
  public async function getLintErrorsAsync(
  ): Awaitable<Traversable<FixableLintError>> {
    $contents = $this->getFile()->getContents();
    $trimmed = Str\trim_right($contents);
    $expected = $trimmed."\n";
    if ($contents === $expected) {
      return vec[];
    }

    $trailing = Str\slice($contents, Str\length($trimmed));
    $blame = $trimmed
      |> Str\split($$, "\n")
      |> Vec\slice($$, Math\maxva(0, C\count($$) - 3))
      |> Str\join($$, "\n")
      |> $$.$trailing;

    $lines = Str\split($contents, "\n") |> C\count($$);

    return (
      new BuiltLintError(
        $this,
        "Files should end with a single trailing newline",
      )
    )
      ->withPosition($lines, 0)
      ->withBlameCode($blame)
      ->withFix($blame, Str\trim_right($blame)."\n")
      |> vec[$$];
  }

  public function fixLintErrors(Traversable<FixableLintError> $_): File {
    return $this->getFile()->withContents(
      $this->getFile()->getContents()
        |> Str\trim_right($$)
        |> $$."\n",
    );
  }
}
