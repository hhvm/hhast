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
use namespace HH\Lib\Str;

final class ListItem<+T as ?Node> extends Node {

  const string SYNTAX_KIND = 'list_item';

  private Node $_item;
  private Node $_separator;

  public function __construct(
    Node $item,
    Node $separator,
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
    $offset += $item->getWidth();
    $separator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['list_separator'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $separator->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($item, $separator, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'item' => $this->_item,
      'separator' => $this->_separator,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $item = $rewriter($this->_item, $parents);
    $separator = $rewriter($this->_separator, $parents);
    if ($item === $this->_item && $separator === $this->_separator) {
      return $this;
    }
    return new static($item, $separator);
  }

  public function withItem(Node $value): this {
    if ($value === $this->_item) {
      return $this;
    }
    return new static($value, $this->_separator);
  }

  public function hasItem(): bool {
    return !$this->_item->isMissing();
  }

  public function getItemUNTYPED(): Node {
    return $this->_item;
  }

  public function getItem(): T {
    if ($this->_item->isMissing()) {
      return /* HH_FIXME[4110] trust that T is nullable */ null;
    }
    return /* HH_FIXME[4110] */ $this->_item;
  }

  public function getItemx(): T where T as nonnull {
    return $this->getItem() as nonnull;
  }

  public function getSeparatorUNTYPED(): Node {
    return $this->_separator;
  }

  public function withSeparator(Node $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new static($this->_item, $value);
  }

  public function hasSeparator(): bool {
    return !$this->_separator->isMissing();
  }

  /**
   * @return null | CommaToken | SemicolonToken | BackslashToken
   */
  public function getSeparator(): ?Token {
    if ($this->_separator->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(Token::class, $this->_separator);
  }

  /**
   * @return CommaToken | SemicolonToken | BackslashToken
   */
  public function getSeparatorx(): Token {
    return TypeAssert\not_null($this->getSeparator());
  }
}
