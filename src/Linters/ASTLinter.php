<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\EditableNode;
use type Facebook\HHAST\__Private\PerfCounter;
use namespace Facebook\HHAST;

abstract class ASTLinter<T as HHAST\EditableNode> extends BaseLinter {
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

    $perf = (new PerfCounter(static::class.'#getASTFromFile'))
      ->endAtScopeExit();

    $hash = sha1(file_get_contents($file), /* raw = */ true);
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

  abstract protected static function getTargetType(): classname<T>;

  abstract protected function getLintErrorForNode(
    T $node,
    vec<EditableNode> $parents,
  ): ?ASTLintError<T, this>;

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
  ): Traversable<ASTLintError<T, this>> {
    $target = static::getTargetType();

    foreach ($this->ast->traverseWithParents() as $node => $parents) {
      $parents = vec($parents);

      if ($node instanceof $target) {
        $error = $this->getLintErrorForNode($node, $parents);
        if ($error !== null) {
          yield $error;
        }
      }
    }
  }

  public function getAST(): HHAST\EditableNode {
    return $this->ast;
  }
}
