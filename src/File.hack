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

final class File {
  private function __construct(
    private string $path,
    private string $contents,
    private bool $isDirty,
  ) {}

  public function isDirty(): bool {
    return $this->isDirty;
  }

  public function getPath(): string {
    return $this->path;
  }

  public function isHackFile(): bool {
    if (\pathinfo($this->path, \PATHINFO_EXTENSION) === 'hack') {
      return true;
    }

    $prefix = Str\slice($this->contents, 0, 4);
    if ($prefix === '<?hh') {
      return true;
    }

    if (!Str\starts_with($prefix, '#!')) {
      return false;
    }

    $prefix = Str\search($this->contents, "\n") ?? 0
      |> Str\slice($this->contents, $$ + 1, 4);

    return $prefix === '<?hh';
  }

  public function getContents(): string {
    return $this->contents;
  }

  public function withContents(string $contents): this {
    if ($contents === $this->contents) {
      return $this;
    }
    return new self($this->path, $contents, /* dirty = */ true);
  }

  public static function fromPath(string $path): this {
    return new File(
      $path,
      \file_get_contents($path), /* dirty = */
      false,
    );
  }

  public static function fromPathAndContents(
    string $path,
    string $contents,
  ): this {
    return new File($path, $contents, /* dirty = */ true);
  }

  <<__Memoize>>
  public function getHash(): string {
    return \sodium_crypto_generichash($this->contents, self::getHashKey());
  }

  <<__Memoize>>
  private static function getHashKey(): string {
    // If the way we parse things is changed without changing the actual nodes
    // (e.g. await precendence changes for await-as-an-expression), the parser
    // schema version may be unchanged, but HHVM_REPO_SCHEMA will be changed.
    return \sodium_crypto_generichash(
      SCHEMA_VERSION.
      '!'.
      /* HH_FIXME[4106] */ /* HH_FIXME[2049] */\HHVM_REPO_SCHEMA,
      null,
      \SODIUM_CRYPTO_GENERICHASH_KEYBYTES,
    );
  }
}
