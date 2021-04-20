/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{C, Str, Vec};
use namespace Facebook\TypeAssert;
use type Facebook\HHAST\File;

final class ParserCache {
  <<__Memoize>>
  public static function get(): this {
    return new self();
  }

  const type TCached = shape(
    'hash' => string,
    'ast' => dict<string, mixed>,
    ?'new_attribute_syntax_allowed' => bool,
  );

  public function fetch(File $file): ?dict<string, mixed> {
    $path = $this->getCacheFileName($file);
    if ($path === null) {
      return null;
    }
    if (!\file_exists($path)) {
      return null;
    }

    try {
      $cache = \unserialize(\gzinflate(\file_get_contents($path)) as string)
        |> TypeAssert\matches<self::TCached>($$);
    } catch (\Exception $_) {
      \unlink($path);
      return null;
    }
    if ($cache['hash'] !== \bin2hex($file->getHash())) {
      return null;
    }
    if (
      Shapes::idx($cache, 'new_attribute_syntax_allowed', false) !==
        is_new_attribute_syntax_allowed()
    ) {
      return null;
    }

    $data = $cache['ast'];
    invariant(
      $data['version'] === \Facebook\HHAST\SCHEMA_VERSION,
      'Expected schema version mismatch to be detected by hash - %s vs %s',
      \Facebook\HHAST\SCHEMA_VERSION,
      ($data['version'] ?? '<none>') as string,
    );
    $data['program_text'] = $file->getContents();
    return $data;
  }

  public function store(File $file, dict<string, mixed> $ast): void {
    $path = $this->getCacheFileName($file);
    if ($path === null) {
      return;
    }
    // We've already checked the version is compatible when parsing, so
    // use the codegen version
    $ast['version'] = \Facebook\HHAST\SCHEMA_VERSION;
    unset($ast['program_text']);
    \file_put_contents(
      $path,
      \gzdeflate(\serialize(shape(
        'hash' => \bin2hex($file->getHash()),
        'ast' => $ast,
        'new_attribute_syntax_allowed' => is_new_attribute_syntax_allowed(),
      ))),
    );
  }

  private ?string $repoRoot = null;
  const string NO_REPO_ROOT = "\0NO_REPO_ROOT";

  private function getRepoRoot(string $file_path): ?string {
    if ($this->repoRoot === self::NO_REPO_ROOT) {
      return null;
    }
    if (
      $this->repoRoot !== null && Str\starts_with($file_path, $this->repoRoot)
    ) {
      return $this->repoRoot;
    }

    $parts = Str\split($file_path, '/');
    while (!C\is_empty($parts)) {
      $dir = Str\join($parts, '/');
      if (\file_exists($dir.'/.hhconfig')) {
        $this->repoRoot = $dir;
        return $dir;
      }
      $parts = Vec\take($parts, C\count($parts) - 1);
    }
    $this->repoRoot = self::NO_REPO_ROOT;
    return null;
  }

  private function getCacheFileName(File $file): ?string {
    if ($file->isDirty()) {
      return null;
    }

    $source = $file->getPath();
    $root = $this->getRepoRoot($source);
    if ($root !== null) {
      $dir = $root.'/.var/cache/hhvm/hhast/parser-cache';
      if (Str\starts_with($source, $root)) {
        $path = $dir.
          '/'.
          (Str\strip_prefix($source, $root) |> Str\strip_prefix($$, '/'));
      } else {
        $path = $dir.'/'.\sha1($source);
      }
      $path .= '.parser-cache';
      $dir = \dirname($path);
      if (!\is_dir($dir)) {
        \mkdir($dir, 0755, /* recursive = */ true);
      }
      return $path;
    }
    return \dirname($source).'/.'.\basename($source).'.hhast.parser-cache';
  }
}
