#!/usr/bin/env hhvm
<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\Schema;

type TTrivia =
  shape('trivia_kind_name' => string, 'trivia_type_name' => string);

type TToken = shape('token_kind' => string, 'token_text' => ?string);

type TASTField = shape('field_name' => string);

// We can't switch these arrays over to vec until we update to TypeAssert 3

type TAST = shape(
  'kind_name' => string,
  'type_name' => string,
  'description' => string,
  'prefix' => string,
  'fields' => Traversable<TASTField>,
);

type TSchema = shape(
  'trivia' => Traversable<TTrivia>,
  'tokens' => Traversable<TToken>,
  'AST' => Traversable<TAST>,
  ?'description' => string,
  'version' => string,
);
