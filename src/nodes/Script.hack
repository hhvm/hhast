/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Dict, Vec};

final class Script extends ScriptGeneratedBase {
  <<__Memoize>>
  public function getTokens(): vec<Token> {
    return $this->getDescendantsOfType(Token::class);
  }

  <<__Memoize>>
  private function getTokenIndices(): dict<int, int> {
    return Dict\pull_with_key(
      $this->getTokens(),
      ($k, $_v) ==> $k,
      ($_k, $v) ==> $v->getUniqueID(),
    );
  }

  public function getPreviousToken(Token $token): ?Token {
    $idx = $this->getTokenIndices()[$token->getUniqueID()];
    if ($idx === 0) {
      return null;
    }
    return $this->getTokens()[$idx - 1];
  }

  const type TNamespace = shape(
    'decl' => NamespaceDeclaration,
    'statement' => bool,
    'uses' => shape(
      'namespaces' => dict<string, string>,
      'types' => dict<string, string>,
    ),
  );

  <<__Memoize>>
  public function getNamespaces(): vec<this::TNamespace> {
    $namespaces = $this->getDeclarationsx()
      ->getChildrenOfType(NamespaceDeclaration::class)
      |> vec($$);
    $count = C\count($namespaces);
    if ($count === 0) {
      return vec[];
    }
    $outer = __Private\Resolution\get_uses_directly_in_scope(
      $this->getDeclarationsx(),
    );

    if (
      $count === 1 && $namespaces[0]->getBody() is NamespaceEmptyBody
    ) {
      return vec[shape(
        'statement' => true,
        'decl' => $namespaces[0],
        'uses' => $outer,
      )];
    }

    return Vec\map(
      $namespaces,
      $ns ==> {
        $inner = __Private\Resolution\get_uses_directly_in_scope(
          ($ns->getBody() as NamespaceBody)->getDeclarationsx(),
        );
        return shape(
          'statement' => false,
          'decl' => $ns,
          'uses' => shape(
            'namespaces' =>
              Dict\merge($outer['namespaces'], $inner['namespaces']),
            'types' => Dict\merge($outer['types'], $inner['types']),
          ),
        );
      },
    );
  }
}
