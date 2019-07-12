/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\{FunctionDeclarationHeader, NameToken};

final class FunctionNamingLintError extends ASTLintError {
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
    FunctionDeclarationHeader $node,
  ) {
    $ns = $ns === null ? '' : $ns.'\\';
    if ($class === null) {
      $this->old = $ns.$old;
      $this->new = $ns.$new;
    } else {
      $this->old = $ns.$class.'::'.$old;
      $this->new = $ns.$class.'::'.$new;
    }
    parent::__construct(
      $linter,
      $description,
      $node,
      () ==> $node->withName(($node->getName() as NameToken)->withText($new)),
    );
  }
}
