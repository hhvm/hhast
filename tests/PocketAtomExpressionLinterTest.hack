/*
 *  Copyright (c) 2019-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class PocketAtomExpressionLinterTest extends TestCase {
    use LinterTestTrait;

    protected function getLinter(string $file): PocketAtomExpressionLinter {
        return PocketAtomExpressionLinter::fromPath($file);
    }

    public function getCleanExamples(): vec<(string)> {
        return vec[tuple('<?hh if (true) {} else if (false) {}')];
    }
}
