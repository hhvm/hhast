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

final class UnparsedReplacementCodeNode extends Node {
  const string SYNTAX_KIND = 'hhast_replacement_code';

  private string $code;

  <<__Override>>
  final public function __construct(Str\SprintfFormatString $format, mixed ...$args) {
    $this->code = Str\format(/* HH_FIXME[4027] */ $format, ...$args);
    parent::__construct(/* sourceref = */ null);
  }

  <<__Override>>
  final protected function getCodeUncached(): string {
    return $this->code;
  }


  <<__Override>>
  final public function getChildren(): dict<string, Node> {
    return dict[];
  }

  <<__Override>>
  final public function rewriteChildren(
    self::TRewriter $_rewriter,
    vec<Node> $_parents = vec[],
  ): this {
    return $this;
  }
}
