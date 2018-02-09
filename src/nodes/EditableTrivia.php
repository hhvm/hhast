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

abstract class EditableTrivia extends EditableNode {
  private string $_text;
  <<__Override>>
  public function __construct(string $trivia_kind, string $text) {
    parent::__construct($trivia_kind);
    $this->_text = $text;
  }

  public function getText(): string {
    return $this->_text;
  }

  <<__Override>>
  public function getCode(): string {
    return $this->_text;
  }

  <<__Override>>
  public function getWidth(): int {
    return \strlen($this->_text);
  }

  <<__Override>>
  final public function isTrivia(): bool {
    return true;
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[];
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): EditableTrivia {
    return __Private\editable_trivia_from_json($json, $file, $offset, $source);
  }

  <<__Override>>
  final public function rewriteDescendants(
    self::TRewriter $_rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    // Trivia have no children
    return $this;
  }
}
