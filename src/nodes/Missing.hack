/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class Missing extends Node {
  const string SYNTAX_KIND = 'missing';
  <<__Override>>
  public function __construct() {
    parent::__construct(null);
  }

  <<__Override>>
  public function isMissing(): bool {
    return true;
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[];
  }

  <<__Memoize>>
  public static function getInstance(): Missing {
    return new self();
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $_json,
    string $_file,
    int $_position,
    string $_source,
  ): this {
    return self::getInstance();
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $_rewriter,
    vec<Node> $_parents = vec[],
  ): this {
    return $this;
  }
}

function Missing(): Missing {
  return Missing::getInstance();
}
