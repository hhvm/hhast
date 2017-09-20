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

use function Facebook\FBExpect\expect;
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str};

abstract class TestCase extends \PHPUnit\Framework\TestCase {
  protected static function getNodeAndParents(
    string $code,
  ): (EditableNode, vec<EditableNode>) {
    $ast = from_code($code);
    $node = $ast->getDescendantsOfType(ClassishDeclaration::class) |> C\firstx($$);
    $parents = vec($ast->findWithParents($x ==> $x === $node));
    return tuple($node, $parents);
  }
}
