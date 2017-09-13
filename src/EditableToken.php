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
use namespace HH\Lib\{C, Str};

abstract class EditableToken extends EditableSyntax {
  private string $_token_kind;
  private EditableSyntax $_leading;
  private EditableSyntax $_trailing;
  private string $_text;

  <<__Override>>
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
    $this->_width = strlen($text) + $leading->getWidth() + $trailing->getWidth();
  }

  public function getTokenKind(): string {
    return $this->_token_kind;
  }

  public function getText(): string {
    return $this->_text;
  }

  public function getLeading(): EditableSyntax {
    return $this->_leading;
  }

  final public function getLeadingWhitespace(): EditableSyntax {
    $leading = $this->getLeading();
    if ($leading->isMissing()) {
      return $leading;
    }
    if ($leading instanceof WhiteSpace || $leading instanceof EndOfLine) {
      return $leading;
    }
    if (!$leading instanceof EditableList) {
      return Missing();
    }
    $last = Missing();
    foreach ($leading->getChildren() as $child) {
      if ($child instanceof WhiteSpace || $child instanceof EndOfLine) {
        $last = $child;
      }
    }
    return $last;
  }

  final public function getTrailingWhitespace(): EditableSyntax {
    $trailing = $this->getTrailing();
    if ($trailing->isMissing()) {
      return $trailing;
    }
    if ($trailing instanceof WhiteSpace || $trailing instanceof EndOfLine) {
      return $trailing;
    }
    if (!$trailing instanceof EditableList) {
      return Missing();
    }
    $result = vec[];
    foreach ($trailing->getChildren() as $child) {
      if ($child instanceof WhiteSpace) {
        $result[] = $child;
      } else if ($child instanceof EndOfLine) {
        $result[] = $child;
        break;
      }
    }
    return EditableList::fromItems($result);
  }

  public function getTrailing(): EditableSyntax {
    return $this->_trailing;
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'leading' => $this->getLeading();
    yield 'trailing' => $this->getTrailing();
  }

  <<__Override>>
  final public function isToken(): bool {
    return true;
  }

  <<__Override>>
  public function getCode(): string {
    return $this->getLeading()->getCode().
      $this->getText().
      $this->getTrailing()->getCode();
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

  <<__Override>>
  public function reduce<TAccumulator>(
    (function(
      EditableSyntax,
      TAccumulator,
      vec<EditableSyntax>,
    ): TAccumulator) $reducer,
    TAccumulator $accumulator,
    ?vec<EditableSyntax> $parents = null,
  ): TAccumulator {
    $accumulator = $this->getLeading()->reduce($reducer, $accumulator);
    $accumulator = $reducer($this, $accumulator, $parents ?? vec[]);
    $accumulator = $this->getTrailing()->reduce($reducer, $accumulator);
    return $accumulator;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): EditableToken {
    $leading_list = __Private\fold_map(
      /* HH_IGNORE_ERROR[4110] */ $json['leading'],
      ($j, $p) ==> EditableSyntax::fromJSON($j, $p, $source),
      ($j, $p) ==> $j['width'] + $p,
      $position,
    );

    $leading = EditableList::fromItems($leading_list);
    $token_position = $position + $leading->getWidth();
    $token_width = TypeAssert::isInt($json['width']);
    $token_text = Str\slice($source, $token_position, $token_width);
    $trailing_position = $token_position + $token_width;
    $trailing_list = __Private\fold_map(
      /* HH_IGNORE_ERROR[4110] */ $json['trailing'],
      ($j, $p) ==> EditableSyntax::fromJSON($j, $p, $source),
      ($j, $p) ==> $j['width'] + $p,
      $trailing_position,
    );
    $trailing = EditableList::fromItems($trailing_list);
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
