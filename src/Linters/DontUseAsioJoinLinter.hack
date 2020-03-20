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

final class DontUseAsioJoinLinter extends AutoFixingASTLinter {
  const type TContext = Script;
  const type TNode = FunctionCallExpression;
  const string F_JOIN = 'HH\\Asio\\join';

  <<__Override>>
  public function getLintErrorForNode(
    Script $context,
    this::TNode $node,
  ): ?ASTLintError {
    $name = $node->getReceiver();

    if ($name is NameToken) {
      $string_name = $name->getText();
    } else if ($name is QualifiedName) {
      $string_name = $name->getDescendantsOfType(NameToken::class)
        |> Vec\map($$, $n ==> $n->getText())
        |> Str\join($$, '\\');
      if (qualified_name_is_fully_qualified($name)) {
        $string_name = '\\'.$string_name;
      }
    } else {
      return null;
    }

    // Performance won't suffer from resolving a fully qualified name.
    // This is handled very efficiently in resolve_function().
    $resolved_name = resolve_function($string_name, $context, $node);

    if ($resolved_name !== self::F_JOIN) {
      return null;
    }

    return new ASTLintError(
      $this,
      "Don't use ".static::F_JOIN,
      $node,
      () ==> null,
    );
  }
}
