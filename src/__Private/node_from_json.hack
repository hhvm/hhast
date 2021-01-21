/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HHAST\Node;

function node_from_json(
  dict<string, mixed> $json,
  string $file,
  int $offset,
  string $source,
  string $type_hint,
): ?Node {
  try {
    $node = node_from_json_unwrapped(
      $json,
      $file,
      $offset,
      $source,
      $type_hint,
    );
    if ($node === null) {
      return $node;
    }
    if ($type_hint === 'IExpression') {
      return Wrap\wrap_IExpression($node);
    }
    if ($type_hint === 'ITypeSpecifier') {
      return Wrap\wrap_ITypeSpecifier($node);
    }
    if ($type_hint === 'ITypeSpecifierOrContexts') {
      /* As of 4.93 (2021-01-19), the FFP seems to always generate a
       * SimpleTypeSpecifier here rather than just a NameToken. Things that
       * aren't a HHAST\Contexts can re-use `Wrap\wrap_ITypeSpecifier()`.
       *
       * If this ends up being a practical problem, you probably want to do
       * that, but please add a unit test while you're here if the existing
       * tests don't fail :)
       */
      invariant(
        $node is \Facebook\HHAST\ITypeSpecifierOrContexts,
        'Expected an ITypeSpecifierOrContexts, got a "%s"; wrapping may be '.
        'needed via `wrap_ITypeSpecifier()`.',
        \get_class($node),
      );
    }
    return $node;
  } catch (\Facebook\HHAST\ASTError $e) {
    throw $e;
  } catch (\Exception $t) {
    throw new \Facebook\HHAST\ASTDeserializationError(
      $file,
      $offset,
      $source,
      $t,
    );
  }
}
