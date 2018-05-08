<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class Missing extends EditableNode {
  <<__Override>>
  public function __construct() {
    parent::__construct('missing');
  }

  <<__Override>>
  public function isMissing(): bool {
    return true;
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    return $this;
  }
}

function Missing(): Missing {
  return Missing::getInstance();
}
