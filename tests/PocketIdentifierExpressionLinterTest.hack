/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class PocketIdentifierExpressionLinterTest extends TestCase {
    use LinterTestTrait;

    protected function getLinter(
        string $file,
    ): PocketIdentifierExpressionLinter {
        return PocketIdentifierExpressionLinter::fromPath($file);
    }

    public function getCleanExamples(): vec<(string)> {
        return vec[tuple('<?hh if (true) {} else if (false) {}')];
    }
}
