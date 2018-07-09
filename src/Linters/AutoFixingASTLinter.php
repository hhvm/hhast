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
use namespace Facebook\HHAST\__Private\LSP;
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str};

abstract class AutoFixingASTLinter<Tnode as EditableNode>
extends BaseASTLinter<Tnode, FixableASTLintError<Tnode>>
implements LSPAutoFixingLinter<FixableASTLintError<Tnode>> {

  abstract public function getFixedNode(Tnode $node): ?EditableNode;

  public function getFixTitle(FixableASTLintError<Tnode> $_error): string {
    return \get_class($this)
      |> Str\split($$, "\\")
      |> C\lastx($$)
      |> Str\strip_suffix($$, "Linter")
      |> 'Fix '.$$.' Error';
  }

  final public function getCodeActionForError(
    FixableASTLintError<Tnode> $error,
  ): ?LSP\CodeAction {
    $node = $error->getBlameNode();
    $fixed = $this->getFixedNode($node);
    if ($fixed === null) {
      return null;
    }

    $offset = HHAST\find_offset_of_leading($this->getAST(), $node);
    $start = $this->getAST()->getCode()
      |> Str\slice($$, 0, $offset)
      |> Str\split($$, "\n")
      |> tuple(C\count($$), Str\length(C\lastx($$)));

    $code = $node->getCode();
    $lines = Str\split($code, "\n");
    $count = C\count($lines);
    if ($count === 1) {
      $end = tuple($start[0], $start[1] + Str\length($code));
    } else {
      $end = tuple($start[0] + $count - 1, Str\length(C\lastx($lines)));
    }
    return shape(
      'title' => $this->getFixTitle($error),
      'kind' => LSP\CodeActionKind::QUICK_FIX,
      'edit' => shape(
        'changes' => dict[
          'file://'.\realpath($this->getFile()) => vec[shape(
            'range' => shape(
              'start' =>
                shape('line' => $start[0] - 1, 'character' => $start[1]),
              'end' => shape('line' => $end[0] - 1, 'character' => $end[1]),
            ),
            'newText' => $fixed->getCode(),
          )],
        ],
      ),
    );
  }

  final public function fixLintErrors(
    Traversable<FixableASTLintError<Tnode>> $errors,
  ): void {
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
    \file_put_contents(
      $this->getFile(),
      $ast->getCode(),
    );
  }
}
