/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Str};

abstract class Token extends Node {
  private string $_token_kind;
  private Node $_leading;
  private Node $_trailing;
  private string $_text;

  const string SYNTAX_KIND = 'token';

  public function __construct(
    string $token_kind,
    Node $leading,
    Node $trailing,
    string $text,
    ?__Private\SourceRef $ref,
  ) {
    $this->_token_kind = $token_kind;
    $this->_leading = $leading;
    $this->_trailing = $trailing;
    $this->_text = $text;
    $this->_width = Str\length($text) +
      $leading->getWidth() +
      $trailing->getWidth();
    parent::__construct($ref);
  }

  public function getTokenKind(): string {
    return $this->_token_kind;
  }

  public function getText(): string {
    return $this->_text;
  }

  public function getLeading(): Node {
    return $this->_leading;
  }

  final public function getLeadingWhitespace(): Node {
    $leading = $this->getLeading();
    if ($leading->isMissing()) {
      return $leading;
    }
    if ($leading instanceof WhiteSpace || $leading instanceof EndOfLine) {
      return $leading;
    }
    if (!$leading instanceof NodeList) {
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

  final public function getTrailingWhitespace(): Node {
    $trailing = $this->getTrailing();
    if ($trailing->isMissing()) {
      return $trailing;
    }
    if ($trailing instanceof WhiteSpace || $trailing instanceof EndOfLine) {
      return $trailing;
    }
    if (!$trailing instanceof NodeList) {
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
    return NodeList::createNonEmptyListOrMissing($result);
  }

  public function getTrailing(): Node {
    return $this->_trailing;
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
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
  protected function getCodeUncached(): string {
    return $this->getLeading()->getCode().
      $this->getText().
      $this->getTrailing()->getCode();
  }

  public abstract function withLeading(Node $leading): Token;

  public abstract function withTrailing(Node $trailing): Token;

  <<__Override>>
  final public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $offset,
    string $source,
    string $_type_hint,
  ): Token {
    $leading_list = __Private\fold_map(
      /* HH_FIXME[4110] use like-types when available*/ $json['leading'],
      ($j, $p) ==> Node::fromJSON($j, $file, $p, $source, 'Node'),
      ($j, $p) ==> $j['width'] + $p,
      $offset,
    );

    $leading = C\is_empty($leading_list)
      ? Missing()
      : new NodeList(
          $leading_list,
          shape(
            'file' => $file,
            'source' => $source,
            'offset' => $offset,
            'width' => $json['leading_width'] as int,
          ),
        );
    $token_position = $offset + $json['leading_width'] as int;
    $token_width = TypeAssert\int($json['width']);
    $token_text = Str\slice($source, $token_position, $token_width);
    $trailing_position = $token_position + $token_width;
    $trailing_list = __Private\fold_map(
      /* HH_IGNORE_ERROR[4110] */ $json['trailing'],
      ($j, $p) ==> Node::fromJSON($j, $file, $p, $source, 'Node'),
      ($j, $p) ==> $j['width'] + $p,
      $trailing_position,
    );
    $trailing = C\is_empty($trailing_list)
      ? Missing()
      : new NodeList(
          $trailing_list,
          shape(
            'file' => $file,
            'source' => $source,
            'offset' => $trailing_position,
            'width' => $json['trailing_width'] as int,
          ),
        );
    $width = $json['leading_width'] as int +
      $json['width'] as int +
      $json['trailing_width'] as int;

    return __Private\token_from_data(
      shape(
        'file' => $file,
        'source' => $source,
        'offset' => $offset,
        'width' => $width,
      ),
      $json['kind'] as string,
      $leading,
      $trailing,
      $token_text,
    );
  }

  <<__Override>>
  final public function getFirstToken(): Token {
    return $this;
  }

  <<__Override>>
  final public function getLastToken(): Token {
    return $this;
  }
}
