/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

<<__ConsistentConstruct>>
abstract class TokenWithVariableText extends Token {

  abstract const string KIND;

  public function __construct(
    Node $leading,
    Node $trailing,
    string $token_text,
    ?__Private\SourceRef $ref,
  ) {
    parent::__construct(static::KIND, $leading, $trailing, $token_text, $ref);
  }

}
