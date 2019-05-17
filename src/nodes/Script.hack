/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Dict;

final class Script extends ScriptGeneratedBase {
  <<__Memoize>>
  public function getTokens(): vec<EditableToken> {
    return $this->getDescendantsOfType(EditableToken::class);
  }

  <<__Memoize>>
  private function getTokenIndices(): dict<int, int> {
    return Dict\pull_with_key(
        $this->getTokens(),
        ($k, $_v) ==> $k,
        ($_k, $v) ==> $v->getUniqueID(),
    );
  }

  public function getPreviousToken(EditableToken $token): ?EditableToken {
    $idx = $this->getTokenIndices()[$token->getUniqueID()];
    if ($idx === 0) {
      return null;
    }
    return $this->getTokens()[$idx - 1];
  }
}
