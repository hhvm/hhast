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
use namespace Facebook\HHAST;
use namespace Facebook\HHAST\Linters\SuppressASTLinter;

abstract class BaseASTLinter<T as HHAST\EditableNode, +Terror as ASTLintError<T>> extends BaseLinter {
  private HHAST\EditableNode $ast;

  <<__Override>>
  public function __construct(
    string $file,
  ) {
    parent::__construct($file);

    $this->ast = self::getASTFromFile($file);
  }

  private static function getASTFromFile(string $file): HHAST\EditableNode {
    static $cache = null;

    $hash = \sha1(\file_get_contents($file), /* raw = */ true);
    if ($cache !== null && $cache['hash'] === $hash) {
      return $cache['ast'];
    }

    $ast = HHAST\from_file($file);

    $cache = shape(
      'hash' => $hash,
      'ast' => $ast,
    );
    return $ast;
  }

  private function getASTWithParents(): vec<(EditableNode, vec<EditableNode>)> {
    static $cache = null;

    $hash = \sha1(\file_get_contents($this->getFile()), /* raw = */ true);
    if ($cache !== null && $cache['hash'] === $hash) {
      return $cache['astWithParents'];
    }

    $ast = $this->ast->traverseWithParents();

    $cache = shape(
      'hash' => $hash,
      'astWithParents' => $ast,
    );
    return $ast;
  }

  abstract protected static function getTargetType(): classname<T>;

  abstract protected function getLintErrorForNode(
    T $node,
    vec<EditableNode> $parents,
  ): ?Terror;

  /**
   * Some parts of the node may be irrelevant to the actual error; strip them
   * out here to display more concise messages to humans.
   */
  public function getPrettyTextForNode(
    T $node,
    ?EditableNode $_context,
  ): string {
    return $node->getCode();
  }

  <<__Override>>
  final public function getLintErrors(
  ): Traversable<Terror> {
    $target = static::getTargetType();

    foreach ($this->getASTWithParents() as list($node, $parents)) {
      if ($node instanceof $target) {
        $error = $this->getLintErrorForNode($node, $parents);

        if (
          $error !== null &&
          !SuppressASTLinter\is_linter_error_suppressed($this, $node, $parents, $error)
        ) {
          yield $error;
        }
      }
    }
  }

  final public function getAST(): HHAST\EditableNode {
    return $this->ast;
  }
}
