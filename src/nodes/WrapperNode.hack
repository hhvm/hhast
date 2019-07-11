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
abstract class WrapperNode extends Node {
  const string SYNTAX_KIND = 'hhhast_wrapper';
  abstract const type TWrapped as Node;

  abstract public function getWrappedNode(): this::TWrapped;

  <<__Override>>
  final public function __construct(protected this::TWrapped $wrapped) {
    parent::__construct($wrapped->sourceRef);
  }

  <<__Override>>
  final protected function getCodeUncached(): string {
    return $this->wrapped->getCodeUncached();
  }


  <<__Override>>
  final public function getChildren(): dict<string, Node> {
    return dict['wrapped' => $this->wrapped];
  }

  <<__Override>>
  final public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $new = $rewriter($this->wrapped, $parents);
    if ($new === $this->wrapped) {
      return $this;
    }

    return new static(/* HH_FIXME[4110] need <<__Enforceable>> */ $new);
  }
}
