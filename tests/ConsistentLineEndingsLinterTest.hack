/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class ConsistentLineEndingsLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<LineLintError>;

  protected function getLinter(
    string $file,
  ): AutoFixingLineLinter<LineLintError> {
    return ConsistentLineEndingsLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(<<<LF
<?hh

const string HERP = 'herp';

const string DERP = 'derp';

LF
      ),
    ];
  }
}
