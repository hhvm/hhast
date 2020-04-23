/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

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
  );

  public function fetch(File $file): ?dict<string, mixed> {
    $path = self::getCacheFileName($file);
    if ($path === null) {
      return null;
    }
    if (!\file_exists($path)) {
      return null;
    }

    try {
      $cache = \unserialize(\gzinflate(\file_get_contents($path)) as string)
        |> TypeAssert\matches_type_structure(self::getCacheTS(), $$);
    } catch (\Exception $_) {
      \unlink($path);
      return null;
    }
    if ($cache['hash'] !== \bin2hex($file->getHash())) {
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
    $path = self::getCacheFileName($file);
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
      ))),
    );
  }

  private static function getCacheFileName(File $file): ?string {
    if ($file->isDirty()) {
      return null;
    }
    $source = $file->getPath();
    return \dirname($source).'/.'.\basename($source).'.hhast.parser-cache';
  }

  <<__Memoize>>
  private static function getCacheTS(): TypeStructure<self::TCached> {
    return type_structure(self::class, 'TCached');
  }
}
