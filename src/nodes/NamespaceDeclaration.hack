/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{Str, Vec};

final class NamespaceDeclaration extends NamespaceDeclarationGeneratedBase {

  public function getName(): ?INameishNode {
    return $this->getHeader()->getName();
  }

  public function getNamex(): INameishNode {
    return $this->getHeader()->getNamex();
  }

  public function hasName(): bool {
    return $this->getHeader()->hasName();
  }

  <<__Memoize>>
  public function getQualifiedNameAsString(): string {
    $name = $this->getName();
    if ($name is NameToken) {
      return $name->getText();
    }

    if ($name === null) {
      return '';
    }

    return $name->getDescendantsOfType(NameToken::class)
      |> Vec\map($$, $t ==> $t->getText())
      |> Str\join($$, '\\');
  }
}
