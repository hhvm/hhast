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
    return $node;
  } catch (\Facebook\HHAST\ASTError $e) {
    throw $e;
  } catch (\Throwable $t) {
    throw new \Facebook\HHAST\ASTDeserializationError(
      $file,
      $offset,
      $source,
      $t,
    );
  }
}
