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

type TAST = shape(
  'kind_name' => string,
  'type_name' => string,
  'description' => string,
  'prefix' => string,
  'fields' => vec<TASTField>,
);

type TSchema = shape(
  'trivia' => vec<TTrivia>,
  'tokens' => vec<TToken>,
  'AST' => vec<TAST>,
  ?'description' => string,
  'version' => string,
);
