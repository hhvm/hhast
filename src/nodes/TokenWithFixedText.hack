/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;


<<__ConsistentConstruct>>
abstract class TokenWithFixedText extends Token {

  abstract const string KIND;
  abstract const string TEXT;

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    ?__Private\SourceRef $ref,
  ) {
    parent::__construct(static::KIND, $leading, $trailing, static::TEXT, $ref);
  }

  <<__Override>>
  final public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $leading = $rewriter($this->getLeading(), $parents);
    $trailing = $rewriter($this->getTrailing(), $parents);
    if (
      $leading === $this->getLeading() && $trailing === $this->getTrailing()
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] */ $leading,
      /* HH_FIXME[4110] */ $trailing,
      null,
    );
  }

  <<__Override>>
  final public function withLeading(?NodeList<Trivia> $value): this {
    $value ??= new NodeList(vec[]);
    if ($value === $this->getLeading()) {
      return $this;
    }
    return new static($value, $this->getTrailing(), null);
  }

  <<__Override>>
  final public function withTrailing(?NodeList<Trivia> $value): this {
    $value ??= new NodeList(vec[]);
    if ($value === $this->getTrailing()) {
      return $this;
    }
    return new static($this->getLeading(), $value, null);
  }
}
