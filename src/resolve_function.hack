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
use namespace Facebook\HHAST\__Private\Resolution;

function resolve_function(string $name, Script $root, Node $node): string {
  $uses = Resolution\get_current_uses($root, $node);

  if (C\contains_key($uses['functions'], $name)) {
    return $uses['functions'][$name];
  }

  return Resolution\resolve_name($name, $root, $node, $uses['namespaces']);
}
