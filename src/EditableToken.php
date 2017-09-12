<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST;

use type Facebook\TypeAssert\TypeAssert;
use namespace HH\Lib\Str;

abstract class EditableToken extends EditableSyntax {
  private string $_token_kind;
  private EditableSyntax $_leading;
  private EditableSyntax $_trailing;
  private string $_text;

  public function __construct(
    string $token_kind,
    EditableSyntax $leading,
    EditableSyntax $trailing,
    string $text,
  ) {
    parent::__construct('token');
    $this->_token_kind = $token_kind;
    $this->_leading = $leading;
    $this->_trailing = $trailing;
    $this->_text = $text;
    $this->_width = strlen($text) + $leading->width() + $trailing->width();
  }

  public function token_kind(): string {
    return $this->_token_kind;
  }

  public function getText(): string {
    return $this->_text;
  }

  public function getLeading(): EditableSyntax {
    return $this->_leading;
  }

  public function getTrailing(): EditableSyntax {
    return $this->_trailing;
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'leading' => $this->getLeading();
    yield 'trailing' => $this->getTrailing();
  }

  public function is_token(): bool {
    return true;
  }

  public function full_text(): string {
    return $this->getLeading()->full_text().
      $this->getText().
      $this->getTrailing()->full_text();
  }

  public abstract function withLeading(EditableSyntax $leading): EditableToken;

  public abstract function withTrailing(
    EditableSyntax $trailing,
  ): EditableToken;

  private static function factory(
    string $token_kind,
    EditableSyntax $leading,
    EditableSyntax $trailing,
    string $token_text,
  ): EditableToken {
    return __Private\editable_token_from_data(
      $token_kind,
      $leading,
      $trailing,
      $token_text,
    );
  }

  public function reduce<TAccumulator>(
    (function(
      EditableSyntax,
      TAccumulator,
      array<EditableSyntax>,
    ): TAccumulator) $reducer,
    TAccumulator $accumulator,
    ?array<EditableSyntax> $parents = null,
  ): TAccumulator {
    $accumulator = $this->getLeading()->reduce($reducer, $accumulator);
    $accumulator = $reducer($this, $accumulator, $parents ?? []);
    $accumulator = $this->getTrailing()->reduce($reducer, $accumulator);
    return $accumulator;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): EditableToken {
    $leading_list = __Private\fold_map(
      /* HH_IGNORE_ERROR[4110] */ $json['leading'],
      ($j, $p) ==> EditableSyntax::from_json($j, $p, $source),
      ($j, $p) ==> $j['width'] + $p,
      $position,
    );

    $leading = EditableList::to_list($leading_list);
    $token_position = $position + $leading->width();
    $token_width = TypeAssert::isInt($json['width']);
    $token_text = Str\slice($source, $token_position, $token_width);
    $trailing_position = $token_position + $token_width;
    $trailing_list = __Private\fold_map(
      /* HH_IGNORE_ERROR[4110] */ $json['trailing'],
      ($j, $p) ==> EditableSyntax::from_json($j, $p, $source),
      ($j, $p) ==> $j['width'] + $p,
      $trailing_position,
    );
    $trailing = EditableList::to_list($trailing_list);
    return EditableToken::factory(
      /* HH_IGNORE_ERROR[4110] */ $json['kind'],
      $leading,
      $trailing,
      $token_text,
    );
  }

  <<__Override>>
  final public function getFirstToken(): EditableToken {
    return $this;
  }

  <<__Override>>
  final public function getLastToken(): EditableToken {
    return $this;
  }
}
