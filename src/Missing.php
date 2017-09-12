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

final class Missing extends EditableSyntax {
  <<__Override>>
  public function __construct() {
    parent::__construct('missing');
  }

  <<__Override>>
  public function isMissing(): bool {
    return true;
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield break;
  }

  <<__Memoize>>
  public static function getInstance(): Missing {
    return new self();
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $_json,
    int $_position,
    string $_source,
  ): this {
    return self::getInstance();
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    return $this;
  }
}

function Missing(): Missing {
  return Missing::getInstance();
}
