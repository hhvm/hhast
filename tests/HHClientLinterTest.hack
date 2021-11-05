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

final class HHClientLinterTest extends TestCase {
  use LinterTestTrait;

  /**
   * The temporary directory to include testing source files to lint.
   *
   * Note that the temporary directory must be under the current directory,
   * otherwise hh_client will not work.
   */
  const string TMP_DIR = __DIR__.'/../.var/tmp/hhast/HHClientLinterTest';

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
    ];
  }

  protected function getLinter(string $file): HHClientLinter {
    $ext = Str\strip_suffix($file, '.in')
      |> Str\ends_with($$, '.php')
      |> $$ ? 'php' : 'hack';
    $hh_client_tmp_file =
      self::TMP_DIR.'/'.\bin2hex(\random_bytes(16)).'.'.$ext;
    \copy($file, $hh_client_tmp_file);
    return HHClientLinter::fromPath($hh_client_tmp_file);
  }

  <<__Override>>
  public static async function beforeFirstTestAsync(): Awaitable<void> {
    $mode = 0777;
    $recursive = true;
    \mkdir(self::TMP_DIR, $mode, $recursive);
  }

  <<__Override>>
  public static async function afterLastTestAsync(): Awaitable<void> {
    foreach (\scandir(self::TMP_DIR) as $file) {
      $path_file = self::TMP_DIR.'/'.$file;
      if (\is_file($path_file)) {
        \unlink($path_file);
      }
    }
    \rmdir(self::TMP_DIR);
  }

}
