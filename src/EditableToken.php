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

use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Str};

abstract class EditableToken extends EditableNode {
  private string $_token_kind;
  private EditableNode $_leading;
  private EditableNode $_trailing;
  private string $_text;

  public function __construct(
    string $token_kind,
    EditableNode $leading,
    EditableNode $trailing,
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

  public function getLeading(): EditableNode {
    return $this->_leading;
  }

  final public function getLeadingWhitespace(): EditableNode {
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

  final public function getTrailingWhitespace(): EditableNode {
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

  public function getTrailing(): EditableNode {
    return $this->_trailing;
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'leading' => $this->getLeading(),
      'trailing' => $this->getTrailing(),
    ];
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

  public abstract function withLeading(EditableNode $leading): EditableToken;

  public abstract function withTrailing(
    EditableNode $trailing,
  ): EditableToken;

  private static function factory(
    string $file,
    int $offset,
    string $token_kind,
    EditableNode $leading,
    EditableNode $trailing,
    string $token_text,
  ): EditableToken {
    return __Private\editable_token_from_data(
      $file,
      $offset,
      $token_kind,
      $leading,
      $trailing,
      $token_text,
    );
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): EditableToken {
    $leading_list = __Private\fold_map(
      /* HH_IGNORE_ERROR[4110] */ $json['leading'],
      ($j, $p) ==> EditableNode::fromJSON($j, $file, $p, $source),
      ($j, $p) ==> $j['width'] + $p,
      $offset,
    );

    $leading = EditableList::fromItems($leading_list);
    $token_position = $offset + $leading->getWidth();
    $token_width = TypeAssert\int($json['width']);
    $token_text = Str\slice($source, $token_position, $token_width);
    $trailing_position = $token_position + $token_width;
    $trailing_list = __Private\fold_map(
      /* HH_IGNORE_ERROR[4110] */ $json['trailing'],
      ($j, $p) ==> EditableNode::fromJSON($j, $file, $p, $source),
      ($j, $p) ==> $j['width'] + $p,
      $trailing_position,
    );
    $trailing = EditableList::fromItems($trailing_list);
    return EditableToken::factory(
      $file,
      $token_position,
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
