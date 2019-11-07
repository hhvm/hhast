/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Str;

class StrictModeOnlyLinter extends AutoFixingASTLinter {
  const type TNode = MarkupSuffix;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    MarkupSuffix $node,
  ): ?ASTLintError {
    $name = $node->getName();

    if ($name is null || $name->getText() !== 'hh') {
      // Stay safe with `<?` and `<?non-hh`
      return null;
    }

    $triv_text = $name->getTrailing()->getCode();

    if (Str\trim($triv_text, "\n") === '' || $triv_text === " // strict\n") {
      return null;
    }

    return new ASTLintError(
      $this,
      'Use `<?hh` (default)',
      $node,
      () ==> $this->getFixedNode($node),
    );
  }

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Use `<?hh` (default)';
  }

  public function getFixedNode(MarkupSuffix $node): MarkupSuffix {
    $name = $node->getName();
    invariant($name is nonnull, "Shouldn't be asked to fix a `<?hh`'");
    return $name->withTrailing(new NodeList(vec[
      new EndOfLine("\n"),
    ]))
      |> $node->withName($$);
  }
}
