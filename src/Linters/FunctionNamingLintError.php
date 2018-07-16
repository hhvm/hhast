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

use type Facebook\HHAST\{
  EditableNode,
  IFunctionishDeclaration,
  MethodishDeclaration
};
use function Facebook\HHAST\__Private\execute;
use namespace HH\Lib\Str;

final class FunctionNamingLintError
extends ASTLintError<IFunctionishDeclaration> implements FixableLintError {
  private string $old;
  private string $new;

  <<__Override>>
  public function __construct(
    FunctionNamingLinter $linter,
    string $description,
    ?string $ns,
    ?string $class,
    string $old,
    string $new,
    IFunctionishDeclaration $node,
    ?EditableNode $context = null,
  ) {
    parent::__construct($linter, $description, $node, $context);
    $ns = $ns === null ? '' : $ns.'\\';
    if ($class === null) {
      $this->old = $ns.$old;
      $this->new = $ns.$new;
    } else {
      $this->old = $ns.$class.'::'.$old;
      $this->new = $ns.$class.'::'.$new;
    }
  }

  final public function isFixable(): bool {
    // plain functions aren't handled well: hh_client --refactor doesn't play
    // nicely with `use` statements.
    return $this->node instanceof MethodishDeclaration;
  }

  final public function getReadableFix(): (string, string) {
    return tuple(
      $this->getPrettyBlame(),
      Str\format(
        "$ hh_client --refactor %s \\\n>    %s \\\n>    %s",
        $this->node instanceof MethodishDeclaration ? 'Method' : 'Function',
        $this->old,
        $this->new,
      ),
    );
  }

  final public function refactorWithHHClient(): void {
    execute(
      'hh_client',
      '--refactor',
      $this->node instanceof MethodishDeclaration ? 'Method' : 'Function',
      $this->old,
      $this->new,
    );
  }

  final public function shouldRenderBlameAndFixAsDiff(): bool {
    return false;
  }
}
