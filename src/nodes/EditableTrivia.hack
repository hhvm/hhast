/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Str;

abstract class EditableTrivia extends EditableNode {
  private string $_text;
  <<__Override>>
  public function __construct(
    string $trivia_kind,
    string $text,
    ?__Private\SourceRef $ref,
  ) {
    $this->_text = $text;
    parent::__construct($trivia_kind, $ref);
  }

  public function getText(): string {
    return $this->_text;
  }

  <<__Override>>
  protected function getCodeUncached(): string {
    return $this->_text;
  }

  <<__Override>>
  public function getWidth(): int {
    return Str\length($this->_text);
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
    return __Private\editable_trivia_from_json($json, shape(
      'file' => $file,
      'source' => $source,
      'offset' => $offset,
      'width' => $json['width'] as int,
    ));
  }

  <<__Override>>
  final public function rewriteChildren(
    self::TRewriter $_rewriter,
    vec<EditableNode> $_parents = vec[],
  ): this {
    // Trivia have no children
    return $this;
  }
}
