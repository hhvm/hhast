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
use namespace HH\Lib\Str;

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

    $perf = (new PerfCounter(static::class.'#getASTFromFile'))
      ->endAtScopeExit();
    $perf2 = (new PerfCounter(self::class.'#getASTFromFile'))
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

    foreach ($this->ast->traverseWithParents() as list($node, $parents)) {
      if ($node instanceof $target) {
        $error = $this->getLintErrorForNode($node, $parents);

        if ($error !== null && !$this->isLinterDisabled($node, $error)) {
          yield $error;
        }
      }
    }
  }

   /**
   * Allow users to disable either all linter errors of this type in a file or
   * specific cases where a linter is used.
   **/
  protected function isLinterDisabled(EditableNode $node, LintError $error): bool {
    // This class of linter errors might be disabled for the entire file, let's find out.
    if($this->isLinterDisabledForFile($error->getFile())){
      return true;
    }

    // Is this specific instance of the linter error disabled?
    $token = $node->getFirstToken();
    if ($token === null) {
      return false;
    }

    return Str\contains($token->getLeading()->getCode(), $this->markerFixMe());
  }

  /**
   * Is this linter error disabled for the entire file?
   * Memoized since this should not change per run.
   */
  <<__Memoize>>
  protected function isLinterDisabledForFile(string $file_name): bool {
    $code = file_get_contents($file_name);
    return Str\contains($code, $this->markerIgnoreAll());
  }

  final public function getAST(): HHAST\EditableNode {
    return $this->ast;
  }
}
