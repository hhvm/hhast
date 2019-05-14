/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  EditableList,
  EndOfLine,
  MarkupSuffix,
  SingleLineComment,
  Script,
  WhiteSpace,
};

class StrictModeOnlyLinter extends AutoFixingASTLinter<MarkupSuffix> {
  <<__Override>>
  protected static function getTargetType(): classname<MarkupSuffix> {
    return MarkupSuffix::class;
  }

  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    MarkupSuffix $node,
  ): ?ASTLintError<MarkupSuffix> {
    $name = $node->getName();
    if ($name === null) {
      // '<?'
      return null;
    }

    if ($name->getText() !== 'hh') {
      return null;
    }

    if ($name->getTrailing()->getCode() === " // strict\n") {
      return null;
    }

    return new ASTLintError($this, 'Use `<?hh // strict`', $node);
  }

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Use `<?hh // strict`';
  }

  <<__Override>>
  public function getFixedNode(MarkupSuffix $node): MarkupSuffix {
    $name = $node->getName();
    invariant($name !== null, "Shouldn't be asked to fix a `<?hh`'");
    return $name->withTrailing(EditableList::createNonEmptyListOrMissing(vec[
      new WhiteSpace(' '),
      new SingleLineComment('// strict'),
      new EndOfLine("\n"),
    ])) |> $node->withName($$);
  }
}
