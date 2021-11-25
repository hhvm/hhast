/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class HHClientLinterTest extends TestCase {
  use HHClientLinterTestTrait;

  <<__Override>>
  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple("<?hh\nclass Foo {}"),
      tuple(
        '<?hh
        function invalid_null_check(): void {
          $cannot_be_null = 42;
          // HHAST_FIXME[5611]
          if ($cannot_be_null is null) {
            throw new Exception();
          }
        }',
      ),
      tuple(
        '<?hh
        function dont_clone(): void {
          // HHAST_FIXME[5562]
          clone shape();
        }',
      ),
      tuple(
        '<?hh
        function invalid_null_check(): void {
          $cannot_be_null = 42;
          // HHAST_IGNORE_ERROR[5611]
          if ($cannot_be_null is null) {
            throw new Exception();
          }
        }',
      ),
      tuple(
        '<?hh
        function dont_clone(): void {
          // HHAST_IGNORE_ERROR[5562]
          clone shape();
        }',
      ),
    ];
  }

  const HHClientLinter::TConfig CONFIG = shape();

}
