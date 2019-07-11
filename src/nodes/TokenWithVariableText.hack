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
abstract class TokenWithVariableText extends Token {

  abstract const string KIND;

  public function __construct(
    ?NodeList<Trivia> $leading,
    ?NodeList<Trivia> $trailing,
    string $token_text,
    ?__Private\SourceRef $ref,
  ) {
    parent::__construct(static::KIND, $leading, $trailing, $token_text, $ref);
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
      $this->getText(),
      null,
    );
  }

  <<__Override>>
  final public function withLeading(?NodeList<Trivia> $value): this {
    $value ??= new NodeList(vec[]);
    if ($value === $this->getLeading()) {
      return $this;
    }
    return new static($value, $this->getTrailing(), $this->getText(), null);
  }

  <<__Override>>
  final public function withTrailing(?NodeList<Trivia> $value): this {
    $value ??= new NodeList(vec[]);
    if ($value === $this->getTrailing()) {
      return $this;
    }
    return new static($this->getLeading(), $value, $this->getText(), null);
  }

  final public function withText(string $value): this {
    if ($value === $this->getText()) {
      return $this;
    }
    return new static($this->getLeading(), $this->getTrailing(), $value, null);
  }
}
