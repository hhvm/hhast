/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\Node;
use function Facebook\HHAST\find_position;
use namespace HH\Lib\Str;

class ASTLintError extends LintError {
  <<__Override>>
  public function __construct(
    protected ASTLinter $linter,
    string $description,
    protected Node $node,
    private ?(function(): ?Node) $fixer = null,
  ) {
    parent::__construct($linter, $description);
  }

  final public function getBlameNode(): Node {
    return $this->node;
  }

  final public function getFixedNode(): ?Node {
    $fixer = $this->fixer;
    if ($fixer) {
      return $fixer();
    }
    return null;
  }

  <<__Override>>
  final public function getPosition(): (int, int) {
    return find_position($this->linter->getAST(), $this->getBlameNode());
  }

  <<__Override>>
  final public function getRange(): ((int, int), (int, int)) {
    $token = $this->getBlameNode()->getLastTokenx();
    list($line, $col) = find_position($this->linter->getAST(), $token);
    return tuple(
      $this->getPosition(),
      tuple($line, $col + Str\length($token->getText())),
    );
  }

  <<__Override>>
  final public function getBlameCode(): string {
    return $this->node->getCode();
  }

  <<__Memoize, __Override>>
  final public function getPrettyBlame(): string {
    return $this->linter->getPrettyTextForNode(/* HH_FIXME[4110] */$this->node);
  }
}
