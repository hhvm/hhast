/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

use namespace HH\Lib\C;

abstract class TestCase extends \Facebook\HackTest\HackTest {
  protected static async function getNodeAndParentsAsync(
    string $code,
  ): Awaitable<(EditableNode, vec<EditableNode>)> {
    $ast = await from_file_async(File::fromPathAndContents('/dev/null', $code));
    $node = $ast->getDescendantsOfType(ClassishDeclaration::class) |> C\firstx($$);
    $parents = vec($ast->findWithParents($x ==> $x === $node));
    return tuple($node, $parents);
  }
}
