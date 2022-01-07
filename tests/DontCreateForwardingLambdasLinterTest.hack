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

final class DontCreateForwardingLambdasLinterTest extends TestCase {
  use LinterTestTrait;

  <<__Override>>
  protected function getLinter(string $file): SingleRuleLinter {
    // This also tests that the default for `noErrorForLambdaWithTypedParametersOrReturn` is false.
    // For testing with this configuration option flipped, @see DontCreateForwardingLambdasLinterDontErrorOnTypedLambdasTest.
    return DontCreateForwardingLambdasLinter::fromPathWithConfig($file, null);
  }

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      // Different forms of the "same" lambda
      'function _(): void {$x ==> $f($x, 2);}',
      'function _(): void {$x ==> f($x, 2);}',
      'function _(): void {$x ==> C\\f($x, 2);}',
      'function _(): void {$x ==> C::f($x, 2);}',
      'function _(): void {$x ==> C\\C::f($x, 2);}',
      'function _(): void {($x) ==> $f($x, 2);}',
      'function _(): void {($x) ==> f($x, 2);}',
      'function _(): void {($x) ==> C\\f($x, 2);}',
      'function _(): void {($x) ==> C::f($x, 2);}',
      'function _(): void {($x) ==> C\\C::f($x, 2);}',
      'function _(): void {async ($x) ==> await $f($x, 2);}',
      'function _(): void {async ($x) ==> await f($x, 2);}',
      'function _(): void {async ($x) ==> await C\\f($x, 2);}',
      'function _(): void {async ($x) ==> await C::f($x, 2);}',
      'function _(): void {async ($x) ==> await C\\C::f($x, 2);}',

      // Body not a function call
      'function _(): void {($x) ==> $x;}',
      'function _(): void {($x) ==> $x[0];}',
      'function _(): void {($x) ==> $x + $x;}',
      // Special case, function calls in an async lambda is not treated as a function call.
      // We only treat it as a function call if the call is prefixed with `await`.
      // So `async ($x) ==> await f($x);`, would be a function call.
      'function _(): void {async ($x) ==> f($x);}',

      // Receiver could not be simplified
      'function _(): void {($x) ==> returns_function()($y);}',
      'function _(): void {($x) ==> $contains_functions[0]($y);}',
      'function _(): void {($x) ==> $obj->y($x);}',
      // Special case, it is not possible to create a reference to the `tuple()` instrinsic.
      // This lambda can not be replaced by `tuple<>`, since `tuple<>` is invalid.
      'function _(): void {($x) ==> tuple($x);}',
      // Special cases, creating a reference to `self::f<>` is only allowed in final classes.
      // The linter does not have the context of the enclosing class, so we never emit an error.
      // `parent::f<>` is always disallowed.
      'function _(): void {($x) ==> self::f($x);}',
      'function _(): void {($x) ==> parent::f($x);}',

      // Using defunct variadic syntax
      'function _(): void {($x, ...) ==> f($x);}',

      // Argument count mismatch
      'function _(): void {($x) ==> f($x, 1);}',
      'function _(): void {($x, $y) ==> f($x);}',

      // Parameter disqualifies
      'function _(): void {(inout $x) ==> f($x);}',
      'function _(): void {($x = 3) ==> f($x);}',

      // Argument disqualifies
      'function _(): void {($x) ==> f($x[0]);}',
      'function _(): void {($x) ==> f(q($x));}',
      'function _(): void {($x) ==> f($x->t);}',
      'function _(): void {($x) ==> f($x());}',

      // Parameter/Argument spread mismatch
      'function _(): void {(... $x) ==> f($x);}',
      'function _(): void {($x) ==> f(...$x);}',

      // Argument order differs
      'function _(): void {($x, $y) ==> f($y, $x);}',
    ]
      |> Vec\map($$, $x ==> tuple($x));
  }
}
