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
use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class NoParamsIsAMissingNodeTest extends HackTest {
  /**
   * @see `NodeList::__construct()`
   * If this test fails, don't try and fix it.
   * Just remove the comment (and this test) if this ever starts failing.
   */
  public function testTheFollowingCommentStaysCorrect(): void {
    $_error = null;
    $json = \HH\ffp_parse_string('function no_params( ): void {}')
      |> \json_encode_pure($$, inout $_error);
    expect($json)->toContainSubstring(
      '"function_parameter_list":{"kind":"missing"}',
    );
  }
}
