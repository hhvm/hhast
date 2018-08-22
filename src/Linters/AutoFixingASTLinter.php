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

use type Facebook\HHAST\EditableNode;
use namespace Facebook\HHAST\__Private\{LSP, LSPLib};
use namespace HH\Lib\{C, Str};

abstract class AutoFixingASTLinter<Tnode as EditableNode>
extends BaseASTLinter<Tnode, FixableASTLintError<Tnode>>
implements LSPAutoFixingLinter<FixableASTLintError<Tnode>> {

  abstract public function getFixedNode(Tnode $node): ?EditableNode;

  // Not abstract because of a variance issue in 3.27:
  // https://github.com/facebook/hhvm/issues/8255
  protected function getTitleForFix(FixableASTLintError<Tnode> $_error): string {
    return \get_class($this)
      |> Str\split($$, "\\")
      |> C\lastx($$)
      |> Str\strip_suffix($$, "Linter")
      |> 'Fix '.$$.' Error';
  }

  final public function getCodeActionForError(
    FixableASTLintError<Tnode> $error,
  ): ?LSP\CodeAction {
    $fixed = $this->getFixedFile(vec[$error]);
    if ($fixed === null) {
      return null;
    }

    return shape(
      'title' => $this->getTitleForFix($error),
      'kind' => LSP\CodeActionKind::QUICK_FIX,
      'edit' => shape(
        'changes' => dict[
          'file://'.\realpath($this->getFile()->getPath()) =>
            LSPLib\create_textedits(
              $this->getFile()->getContents(),
              $fixed->getContents()
            ),
        ],
      ),
    );
  }

  final public function getFixedFile(
    Traversable<FixableASTLintError<Tnode>> $errors,
  ): File {
    $ast = $this->getAST();
    foreach ($errors as $error) {
      invariant(
        $error->getFile() === $this->getFile(),
        "Can't fix errors in another file",
      );
      invariant(
        $error->getLinter() === $this,
        "Can't fix errors from another linter",
      );
      $old = $error->getBlameNode();
      $new = $this->getFixedNode($old);
      invariant(
        $new !== null,
        "Shouldn't be attempting to fix a non-fixable error",
      );
      if ($ast === $old) {
        $ast = $new;
      } else {
        $ast = $ast->replace($old, $new);
      }
    }
    return $this->getFile()->withContents($ast->getCode());
  }
}
