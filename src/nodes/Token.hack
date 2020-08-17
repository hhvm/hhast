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
use namespace HH\Lib\{C, Str, Vec};

abstract class Token extends Node {
  private string $_token_kind;
  private NodeList<Trivia> $_leading;
  private NodeList<Trivia> $_trailing;
  private string $_text;

  const string SYNTAX_KIND = 'token';

  public function __construct(
    string $token_kind,
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $text,
    ?__Private\SourceRef $ref,
  ) {
    $this->_token_kind = $token_kind;
    $this->_leading = $leading ?? new NodeList(vec[]);
    $this->_trailing = $trailing ?? new NodeList(vec[]);
    $this->_text = $text;
    $this->_width = Str\length($text) +
      $this->_leading->getWidth() +
      $this->_trailing->getWidth();
    parent::__construct($ref);
  }

  public function getTokenKind(): string {
    return $this->_token_kind;
  }

  final public function getText(): string {
    return $this->_text;
  }

  final public function hasLeading(): bool {
    return $this->_leading->isEmpty();
  }

  final public function hasTrailing(): bool {
    return $this->_trailing->isEmpty();
  }

  public function getLeading(): NodeList<Trivia> {
    return $this->_leading;
  }

  final public function getLeadingWhitespace(): ?Trivia {
    $leading = $this->getLeading();
    $last = null;
    foreach ($leading->getChildren() as $child) {
      if ($child is WhiteSpace || $child is EndOfLine) {
        $last = $child;
      }
    }
    return $last;
  }

  final public function getTrailingWhitespace(): NodeList<Trivia> {
    $trailing = $this->getTrailing();
    $result = vec[];
    foreach ($trailing->getChildren() as $child) {
      if ($child is WhiteSpace) {
        $result[] = $child;
      } else if ($child is EndOfLine) {
        $result[] = $child;
        break;
      }
    }
    return NodeList::createMaybeEmptyList($result);
  }

  public function getTrailing(): NodeList<Trivia> {
    return $this->_trailing;
  }

  <<__Override>>
  public function getChildren(): dict<string, NodeList<Trivia>> {
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

  public abstract function withLeading(?NodeList<Trivia> $leading): this;

  public abstract function withTrailing(?NodeList<Trivia> $trailing): this;

  <<__Override>>
  final public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $offset,
    string $source,
    string $_type_hint,
  ): Token {
    $leading_list = __Private\fold_map<dict<string, mixed>, Trivia, int>(
      /* HH_FIXME[4110] need like types */ $json['leading'],
      ($j, $p) ==> Trivia::fromJSON($j, $file, $p, $source, 'Node'),
      ($j, $p) ==> ($j as dict<_, _>)['width'] as int + $p,
      $offset,
    )
      |> Vec\filter_nulls($$);

    $leading = C\is_empty($leading_list)
      ? new NodeList(vec[])
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
    $trailing_list = __Private\fold_map<dict<string, mixed>, Trivia, int>(
      /* HH_FIXME[4110] need like-types */ $json['trailing'],
      ($j, $p) ==> Trivia::fromJSON($j, $file, $p, $source, 'Node'),
      ($j, $p) ==> $j as KeyedContainer<_, _>['width'] as int + $p,
      $trailing_position,
    )
      |> Vec\filter_nulls($$);
    $trailing = C\is_empty($trailing_list)
      ? new NodeList(vec[])
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
