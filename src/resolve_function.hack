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

/**
 *              Turns a (fully/partially/un qualified) function call
 *              from the source code a qualified name.
 *
 * @param $name The name of the function as a string as found in the code.
 *              This may be unqualified f.e. `htmlspecialchars`,
 *              fully qualified f.e. `\htmlspecialchars`,
 *              or partially qualified f.e. `Str\join`.
 *
 * @param $root The Script from which you got the $name.
 *              This is required to lookup the `use namespace Herp\Derp` and alike.
 *
 * @param $node The place in code that you'd like to have the qualified name of.
 *              This will be a NameToken or QualifiedName in the common case.
 *
 * @return      The returned string is the fully qualified name of the given $node
 *              without the leading `\`.
 *
 * @example     $name_token of the name `join`.
 *              $my_script as a `use function HH\Asio\join` at the top.
 *              `resolve_function($name_token->getText(), $my_script, $name_token);`
 *              Expected return "HH\Asio\join".
 */
function resolve_function(string $name, Script $root, Node $node): string {
  $uses = Resolution\get_current_uses($root, $node);

  if (C\contains_key($uses['functions'], $name)) {
    return $uses['functions'][$name];
  }

  return Resolution\resolve_name($name, $root, $node, $uses['namespaces']);
}
