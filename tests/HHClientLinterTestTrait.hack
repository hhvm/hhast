/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{Regex, Str};

trait HHClientLinterTestTrait {
  use LinterTestTrait;

  abstract const HHClientLinter::TConfig CONFIG;

  /**
   * The temporary directory to include testing source files to lint.
   *
   * Note that the temporary directory must be under the current directory,
   * otherwise hh_client will not work.
   */
  private static function temporarySourceDirectory():string {
    return __DIR__.'/../.var/tmp/hhast/'.(Regex\first_match(static::class, re"/\\\\(\w+)$/")[1] ?? static::class);
  }

  protected function getLinter(string $file): HHClientLinter {
    $ext = Str\strip_suffix($file, '.in')
      |> Str\ends_with($$, '.php')
      |> $$ ? 'php' : 'hack';
    $hh_client_tmp_file =
      self::temporarySourceDirectory().'/'.\bin2hex(\random_bytes(16)).'.'.$ext;
    \copy($file, $hh_client_tmp_file);
    return HHClientLinter::fromPathWithConfig($hh_client_tmp_file, static::CONFIG);
  }

  <<__Override>>
  public static async function beforeFirstTestAsync(): Awaitable<void> {
    $mode = 0777;
    $recursive = true;
    \mkdir(self::temporarySourceDirectory(), $mode, $recursive);
  }

  <<__Override>>
  public static async function afterLastTestAsync(): Awaitable<void> {
    foreach (\scandir(self::temporarySourceDirectory()) as $file) {
      $path_file = self::temporarySourceDirectory().'/'.$file;
      if (\is_file($path_file)) {
        \unlink($path_file);
      }
    }
    \rmdir(self::temporarySourceDirectory());
  }

}
