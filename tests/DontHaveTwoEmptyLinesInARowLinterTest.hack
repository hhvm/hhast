/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class DontHaveTwoEmptyLinesInARowLinterTest extends TestCase {
  use AutoFixingLinterTestTrait<ASTLintError>;

  protected function getLinter(
    string $file,
  ): DontHaveTwoEmptyLinesInARowLinter {
    return DontHaveTwoEmptyLinesInARowLinter::fromPath($file);
  }

  public function getCleanExamples(): vec<(string)> {
    return vec[
      tuple(<<<'HACK'
<?hh

function

dont_format_your_code_list_this

(

<<

Attr

,

OtherAttr

>>

string

$string

,

)

:

string

{

return

$string

;

}

HACK
      ),
      tuple(<<<'HACK'
<?hh

/**



*/
function _(): void {
  //

  //

  //

/*


*/
}
HACK
      ),
      tuple(<<<'HACK'
<?hh

function _(): void {
$single_quotes = '


';

$double_quotes = "


";

$now_doc = <<<'NOW'


NOW;

$here_doc = <<<HERE


HERE;
}
HACK
      ),
    ];
  }
}
