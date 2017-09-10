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
  public function __construct(string $trivia_kind, string $text) {
    parent::__construct($trivia_kind);
    $this->_text = $text;
  }

  public function text(): string {
    return $this->_text;
  }

  public function full_text(): string {
    return $this->_text;
  }

  public function width(): int {
    return strlen($this->_text);
  }

  public function is_trivia(): bool {
    return true;
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield break;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): EditableTrivia {
    return __Private\editable_trivia_from_json($json, $position, $source);
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    return $rewriter($this, $parents ?? vec[]);
  }
}
