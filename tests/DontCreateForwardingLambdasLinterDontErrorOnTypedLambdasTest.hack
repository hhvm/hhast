/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Vec;

/**
 * @see DontCreateForwardingLambdasLinterTest
 */
final class DontCreateForwardingLambdasLinterDontErrorOnTypedLambdasTest
  extends TestCase {
  use LinterTestTrait;

  <<__Override>>
  protected function getLinter(string $file): SingleRuleLinter {
    return DontCreateForwardingLambdasLinter::fromPathWithConfig(
      $file,
      shape('noErrorForLambdaWithTypedParametersOrReturn' => true),
    );
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      // Configurable noErrorForLambdaWithTypedParametersOrReturn
      'function _(): void {(int $x) ==> f($x);}',
      'function _(): void {($x): int ==> f($x);}',
      'function _(): void {(int $x): int ==> f($x);}',
    ]
      |> Vec\map($$, $x ==> tuple($x));
  }
}
