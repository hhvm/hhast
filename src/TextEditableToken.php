<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

<<__ConsistentConstruct>>
abstract class TextEditableToken extends EditableToken {

  abstract const string KIND;

  public function __construct(
    EditableNode $leading,
    EditableNode $trailing,
    string $token_text
  ){
    parent::__construct(static::KIND, $leading, $trailing, $token_text);
  }

}
