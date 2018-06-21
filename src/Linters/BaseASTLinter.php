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
use namespace Facebook\HHAST\Linters\{LinterException, SuppressASTLinter};

abstract class BaseASTLinter<
  T as HHAST\EditableNode,
  +Terror as ASTLintError<T>,
> extends BaseLinter {
  private ?HHAST\EditableNode $ast;

  <<__Override>>
  public function __construct(string $file) {
    parent::__construct($file);
  }

  private static async function getASTFromFileAsync(
    string $file,
  ): Awaitable<HHAST\EditableNode> {
    static $cache = null;

    $hash = \sha1(\file_get_contents($file), /* raw = */ true);
    if ($cache !== null && $cache['hash'] === $hash) {
      return $cache['ast'];
    }

    $ast = await HHAST\from_file_async($file);

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

    $ast = $this->getAST()->traverseWithParents();

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
  final public async function getLintErrorsAsync(
  ): Awaitable<Traversable<Terror>> {
    $this->ast = await self::getASTFromFileAsync($this->getFile());
    $target = static::getTargetType();

    $errors = vec[];
    foreach ($this->getASTWithParents() as list($node, $parents)) {
      if ($node instanceof $target) {
        try {
          $error = $this->getLintErrorForNode($node, $parents);
        } catch (LinterException $e) {
          if ($e->getPosition() !== null) {
            throw $e;
          }
          try {
            $position = HHAST\find_position($this->getAST(), $node);
          } catch (\Throwable $_) {
            throw $e;
          }
          throw new LinterException(
            $e->getLinterClass(),
            $e->getFileBeingLinted(),
            $e->getRawMessage(),
            $position,
            $e->getPrevious(),
          );
        } catch (\Throwable $t) {
          try {
            $position = HHAST\find_position($this->getAST(), $node);
          } catch (\Throwable $_) {
            throw $t;
          }
          throw new LinterException(
            static::class,
            $this->getFile(),
            $t->getMessage(),
            $position,
            $t,
          );
        }

        if (
          $error !== null &&
          !SuppressASTLinter\is_linter_error_suppressed(
            $this,
            $node,
            $parents,
            $error,
          )
        ) {
          $errors[] = $error;
        }
      }
    }
    return $errors;
  }

  final public function getAST(): HHAST\EditableNode {
    $ast = $this->ast;
    invariant($ast !== null, "Calling getAST before it was initialized");
    return $ast;
  }
}
