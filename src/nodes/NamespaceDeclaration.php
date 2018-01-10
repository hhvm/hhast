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

namespace Facebook\HHAST;

use namespace HH\Lib\{Str, Vec};

final class NamespaceDeclaration extends NamespaceDeclarationGeneratedBase {
  public function getQualifiedNameAsString(): string {
    $name = $this->getName();
    if ($name instanceof NameToken) {
      return $name->getText();
    }

    return $this->getDescendantsOfType(NameToken::class)
      |> Vec\map($$, $t ==> $t->getText())
      |> Str\join($$, "\\");
  }
}
