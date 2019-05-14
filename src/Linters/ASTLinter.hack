/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use namespace Facebook\HHAST;
use namespace Facebook\HHAST\Linters\SuppressASTLinter;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Vec;

abstract class ASTLinter<Tnode as HHAST\EditableNode> extends BaseLinter {
  abstract const type TContext as HHAST\EditableNode;
  private ?HHAST\Script $ast;

  abstract protected static function getTargetType(): classname<Tnode>;

  abstract protected function getLintErrorForNode(
    this::TContext $context,
    Tnode $node,
  ): ?ASTLintError<Tnode>;

  /**
   * Some parts of the node may be irrelevant to the actual error; strip them
   * out here to display more concise messages to humans.
   */
  public function getPrettyTextForNode(Tnode $node): string {
    return $node->getCode();
  }

  <<__MemoizeLSB>>
  protected static function getAncestorType(): classname<this::TContext> {
    return \type_structure(static::class, 'TContext')['classname'];
  }

  <<__Override>>
  final public async function getLintErrorsAsync(
  ): Awaitable<vec<ASTLintError<Tnode>>> {
    $ast = await HHAST\__Private\ASTCache::get()->fetchAsync($this->getFile());
    $this->ast = $ast;
    $targets = dict[];
    $ancestor = static::getAncestorType();
    $target = static::getTargetType();
    if ($ancestor === HHAST\Script::class) {
      $context = TypeAssert\instance_of($ancestor, $ast);
      $targets = Vec\map(
        $ast->getDescendantsOfType($target),
        $node ==> tuple($context, $node),
      );
    } else {
      foreach (
        $ast->getDescendantsOfType(static::getAncestorType()) as $context
      ) {
        foreach ($context->getDescendantsOfType($target) as $node) {
          $targets[$node->getUniqueID()] = tuple($context, $node);
        }
      }
    }

    $errors = vec[];
    foreach ($targets as list($context, $node)) {
      try {
        $error = $this->getLintErrorForNode($context, $node);
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
          vec[],
          $error,
        )
      ) {
        $errors[] = $error;
      }
    }
    return $errors;
  }


  final public function getAST(): HHAST\Script {
    $ast = $this->ast;
    invariant($ast !== null, "Calling getAST before it was initialized");
    return $ast;
  }
}
