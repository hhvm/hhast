/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\File;
use namespace HH\Lib\{C, Math, Str, Vec};

final class NewlineAtEndOfFileLinter
  extends SingleRuleLinter
  implements AutoFixingLinter<SingleRuleLintError> {
  const type TConfig = shape();
  use AutoFixingLinterTrait<SingleRuleLintError>;

  <<__Override>>
  public async function getLintErrorsAsync(
  ): Awaitable<vec<SingleRuleLintError>> {
    $contents = $this->getFile()->getContents();
    $fixed = $this->getFixedFile(vec[])->getContents();
    if ($contents === $fixed) {
      return vec[];
    }

    $trimmed = Str\trim_right($contents);
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
        'Files should end with a single trailing newline',
      )
    )
      ->withPosition($lines, 0)
      ->withBlameCode($blame)
      |> vec[$$];
  }

  <<__Override>>
  protected function getTitleForFix(SingleRuleLintError $_): string {
    $contents = $this->getFile()->getContents();
    if (Str\ends_with($contents, "\n")) {
      return 'Remove extra trailing whitespace';
    }
    if (Str\trim_right($contents) === $contents) {
      return 'Add trailing newline';
    }
    return 'Replace trailng whitespace with newline';
  }

  public function getFixedFile(Traversable<SingleRuleLintError> $_): File {
    return $this->getFile()->withContents(
      $this->getFile()->getContents()
        |> Str\trim_right($$)
        |> $$."\n",
    );
  }
}
