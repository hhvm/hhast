<?hh // strict

/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\TestLib;

use namespace HH\Lib\{C, Str};

final class TemporaryProject implements \IDisposable {
  private resource $hhServer;
  private string $path;
  public function __construct(
    string $source_path,
  ) {
    $path = \sys_get_temp_dir().'/hhast-test-temp'.\bin2hex(\random_bytes(16));
    $orig = \umask(022);
    \mkdir($path);
    \umask($orig);
    $path = \realpath($path);
    $this->path = $path;

    $config_source = Str\strip_suffix($source_path, '.in').'.hhconfig';
    if (\file_exists($config_source)) {
      \file_put_contents(
        $path.'/.hhconfig',
        \file_get_contents($config_source),
      );
    } else {
      \touch($path.'/.hhconfig');
    }

    $pipes = [];
    $this->hhServer = \proc_open(
      'hh_server '.\escapeshellarg($path).' >/dev/null 2>/dev/null',
      [],
      &$pipes,
    );
    \file_put_contents($path.'/test.php', \file_get_contents($source_path));
  }

  public function getRootPath(): string {
    return $this->path;
  }

  public function getFilePath(): string {
    return $this->path.'/test.php';
  }

  public function __dispose(): void {
    \proc_terminate($this->hhServer);
    \unlink($this->getFilePath());
    \unlink($this->path.'/.hhconfig');
    \rmdir($this->path);
  }
}
