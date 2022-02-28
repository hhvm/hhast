/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class UnreachableCodeLinterTest extends TestCase {
    use LinterTestTrait;

    <<__Override>>
    protected function getLinter(string $file): UnreachableCodeLinter {
        return UnreachableCodeLinter::fromPath($file);
    }

    <<__Override>>
    public function getCleanExamples(): vec<(string)> {
        return vec[
            tuple('<?hh function foo(): int { return 5; }'),
            tuple('<?hh function foo(): void { return; }'),
            tuple('<?hh function foo(): void { if (true) return; }'),
            tuple(
                '<?hh function foo(int $i): int { if ($i == 1) { return 5; } else { return 6; } }',
            ),
            tuple(
                '<?hh function foo(): void { return; /* comment node after return */ }',
            ),
        ];
    }
}
