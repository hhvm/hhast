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
use function Facebook\HHAST\find_line;
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
    $r = new \ReflectionClass($this);
    $linter_name = $r->getShortName();

    foreach ($this->ast->traverseWithParents() as list($node, $parents)) {
      if ($node instanceof $target) {
        $error = $this->getLintErrorForNode($node, $parents);

        if ($error !== null && !$this->isLinterDisabled($linter_name, $node)) {
          yield $error;
        }
      }
    }
  }

  /**
   * Allow users to disable specific cases where a linter is used.
   *
   * For example if migrating from a banned function the existing usages can be marked to pass the linter:
   *
   * banned_function_call(); # DisableBannedFunctionsLinter
   **/
  protected function isLinterDisabled(
    string $linter_name,
    EditableNode $node,
  ): bool {
    // This node caused the error, let's find the line
    $line = find_line($this->getAST(), $node);

    // Check to see if the line contains the DisableLinterName keyword
    return Str\search($line, "Disable".$linter_name) !== null;
  }

  final public function getAST(): HHAST\EditableNode {
    return $this->ast;
  }
}
