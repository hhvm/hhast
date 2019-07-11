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
use namespace HH\Lib\{Dict, Str};

final class ListItem<+T as ?Node> extends Node {

  const string SYNTAX_KIND = 'list_item';

  private T $_item;
  private ?Token $_separator;

  public function __construct(
    T $item,
    ?Token $separator,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_item = $item;
    $this->_separator = $separator;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $type_hint,
  ): this {
    if (Str\starts_with($type_hint, 'ListItem<')) {
      $type_hint = $type_hint
        |> Str\strip_prefix($$, 'ListItem<')
        |> Str\strip_suffix($$, '>');
    } else {
      $type_hint = 'Node';
    }
    $offset = $initial_offset;
    $item = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['list_item'],
      $file,
      $offset,
      $source,
      $type_hint,
    );
    $offset += $item?->getWidth() ?? 0;
    $separator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['list_separator'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $separator?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $item,
      $separator as ?Token,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return Dict\filter_nulls(dict[
      'item' => $this->_item,
      'separator' => $this->_separator,
    ]);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): ListItem<T> {
    $parents[] = $this;
    $item = $this->_item === null
      ? $this->_item
      : $rewriter($this->_item, $parents);
    $separator = $this->_separator === null
      ? null
      : $rewriter($this->_separator, $parents) as ?Token;
    if ($item === $this->_item && $separator === $this->_separator) {
      return $this;
    }
    return new static(/* HH_FIXME[4110] */ $item, $separator);
  }

  public function withItem<Tnode super T as Node>(
    Tnode $value,
  ): ListItem<Tnode> {
    if ($value === $this->_item) {
      return $this;
    }
    return new static($value, $this->_separator);
  }

  public function hasItem(): bool {
    return $this->_item !== null;
  }

  public function getItemUNTYPED(): ?Node {
    return $this->_item;
  }

  public function getItem(): T {
    if ($this->_item === null) {
      return /* HH_FIXME[4110] trust that T is nullable */ null;
    }
    return $this->_item;
  }

  public function getItemx(): T where T as nonnull {
    return $this->getItem() as nonnull;
  }

  public function getSeparatorUNTYPED(): ?Token {
    return $this->_separator;
  }

  public function withSeparator(?Token $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new static($this->_item, $value);
  }

  public function hasSeparator(): bool {
    return $this->_separator !== null;
  }

  /**
   * @return null | CommaToken | SemicolonToken | BackslashToken
   */
  public function getSeparator(): ?Token {
    return $this->_separator;
    return TypeAssert\instance_of(Token::class, $this->_separator);
  }

  /**
   * @return CommaToken | SemicolonToken | BackslashToken
   */
  public function getSeparatorx(): Token {
    return TypeAssert\not_null($this->getSeparator());
  }
}
