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

abstract class ASTLinter<Tnode as HHAST\EditableNode> extends BaseLinter {
  private ?HHAST\EditableNode $ast;

  private static async function getASTFromFileAsync(
    File $file,
  ): Awaitable<HHAST\EditableNode> {
    static $cache = null;

    $hash = \sha1($file->getContents(), /* raw = */ true);
    if ($cache !== null && $cache['hash'] === $hash) {
      return $cache['ast'];
    }

    $ast = await HHAST\from_code_async($file->getContents());

    $cache = shape(
      'hash' => $hash,
      'ast' => $ast,
    );
    return $ast;
  }

  private function getASTWithParents(): vec<(EditableNode, vec<EditableNode>)> {
    static $cache = null;

    $ast = $this->getAST();
    if ($cache !== null && $cache[0][0] === $ast) {
      return $cache;
    }
    $cache = $ast->traverseWithParents();
    return $cache;
  }

  abstract protected static function getTargetType(): classname<Tnode>;

  abstract protected function getLintErrorForNode(
    Tnode $node,
    vec<EditableNode> $parents,
  ): ?ASTLintError<Tnode>;

  /**
   * Some parts of the node may be irrelevant to the actual error; strip them
   * out here to display more concise messages to humans.
   */
  public function getPrettyTextForNode(
    Tnode $node,
  ): string {
    return $node->getCode();
  }

  <<__Override>>
  final public async function getLintErrorsAsync(
  ): Awaitable<vec<ASTLintError<Tnode>>> {
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
            $this->getFile()->getPath(),
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
