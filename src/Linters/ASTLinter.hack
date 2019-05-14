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
use namespace HH\Lib\{C, Vec};

abstract class ASTLinter<Tnode as HHAST\EditableNode> extends BaseLinter {
  private ?HHAST\EditableNode $ast;

  private static ?shape('hash' => string, 'ast' => HHAST\EditableNode)
    $lastFileCache = null;

  private static async function getASTFromFileAsync(
    HHAST\File $file,
  ): Awaitable<HHAST\EditableNode> {
    $cache = self::$lastFileCache;
    $hash = $file->getHash();
    if ($cache is nonnull && $cache['hash'] === $hash) {
      return $cache['ast'];
    }

    $ast = await HHAST\from_file_async($file);

    self::$lastFileCache = shape(
      'hash' => $hash,
      'ast' => $ast,
    );
    return $ast;
  }

  abstract protected static function getTargetType(): classname<Tnode>;

  abstract protected function getLintErrorForNode(
    Tnode $node,
  ): ?ASTLintError<Tnode>;

  /**
   * Some parts of the node may be irrelevant to the actual error; strip them
   * out here to display more concise messages to humans.
   */
  public function getPrettyTextForNode(Tnode $node): string {
    return $node->getCode();
  }

  <<__Override>>
  final public async function getLintErrorsAsync(
  ): Awaitable<vec<ASTLintError<Tnode>>> {
    $ast = await self::getASTFromFileAsync($this->getFile());
    $this->ast = $ast;
    $target = static::getTargetType();

    $errors = vec[];
    foreach ($ast->getDescendantsOfType($target) as $node) {
      try {
        $error = $this->getLintErrorForNode($node);
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
          $this->getNodeAncestors($node),
          $error,
        )
      ) {
        $errors[] = $error;
      }
    }
    return $errors;
  }

  protected function getNodeAncestors(Tnode $node): vec<EditableNode> {
    $ast = $this->getAST();
    invariant($ast->isAncestorOf($node), "Do not have full AST for node");
    $stack = vec[$ast];
    $children = $ast->getChildren();
    while ($children) {
      $child = C\firstx($children);
      $children = Vec\drop($children, 1);
      if ($child === $node) {
        break;
      }
      if (!$child->isAncestorOf($node)) {
        continue;
      }
      $stack[] = $child;
      $children = $child->getChildren();
    }
    return $stack;
  }

  final public function getAST(): HHAST\EditableNode {
    $ast = $this->ast;
    invariant($ast !== null, "Calling getAST before it was initialized");
    return $ast;
  }
}
