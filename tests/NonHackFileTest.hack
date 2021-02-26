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
use type Facebook\HackTest\{DataProvider, HackTest};
use function Facebook\FBExpect\expect;

final class NonHackFileTest extends HackTest {
  public function provideNonHackFiles(): vec<(File)> {
    return vec[
      'php_files/empty_file.php.unparsable',
      'php_files/html_file.php.unparsable',
      'php_files/templated_html_file.php.unparsable',
      'php_files/real_php_file.php.unparsable',
    ]
      |> static::filePathsTheFiles($$)
      |> Vec\map($$, $file ==> tuple($file));
  }

  <<DataProvider('provideNonHackFiles')>>
  public function testFilesThatDoNotStartWithAnHHTokenOrASheebangFollowedByAnHHTokenAreNotHackFiles(
    File $file,
  ): void {
    expect($file->isHackFile())->toBeFalse(
      'File "%s" should not be a Hack file',
      $file->getPath(),
    );
  }

  public function provideHackFilesWithAmbiguousExtensions(): vec<(File)> {
    return vec[
      // We cannot exclude extensions, since `.in` and friends are valid hack files
      'incorrect_extension/hackfile.hack.in',
      'hack_files/deprecated.hck',
      'hack_files/hello_world.hh',
      'hack_files/hello_world.php',
      'hack_files/shee_bang.php',
    ]
      |> static::filePathsTheFiles($$)
      |> Vec\map($$, $file ==> tuple($file));
  }

  <<DataProvider('provideHackFilesWithAmbiguousExtensions')>>
  public function testFileThatStartWithAnHHTokenOrASheebangFollowedByAnHHTokenAreHackFiles(
    File $file,
  ): void {
    expect($file->isHackFile())->toBeTrue(
      'File "%s" should be a Hack file',
      $file->getPath(),
    );
  }

  public function testFilesWithADotHackExtensionAreAlwaysHackFiles(): void {
    $file = File::fromPathAndContents('_.hack', 'function main(): void {}');
    expect($file->isHackFile())->toBeTrue(
      'File "%s" should be a Hack file',
      $file->getContents(),
    );
  }

  private static function filePathsTheFiles(vec<string> $paths): vec<File> {
    return Vec\map(
      $paths,
      $path ==> File::fromPath(__DIR__.'/examples/NonHackFileTest/'.$path),
    );
  }
}
