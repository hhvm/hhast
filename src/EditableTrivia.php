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

abstract class EditableTrivia extends EditableSyntax {
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
  public function full_text(): string {
    return $this->_text;
  }

  <<__Override>>
  public function width(): int {
    return strlen($this->_text);
  }

  <<__Override>>
  public function is_trivia(): bool {
    return true;
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield break;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): EditableTrivia {
    return __Private\editable_trivia_from_json($json, $position, $source);
  }

  <<__Override>>
  final public function rewrite_children(
    self::TRewriter $_rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    // Trivia have no children
    return $this;
  }
}
