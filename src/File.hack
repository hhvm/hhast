/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{Dict, Keyset, Regex, Str, Vec};

final class File {
  private function __construct(
    private string $path,
    private string $contents,
    private bool $isDirty,
  ) {}

  public function isDirty(): bool {
    return $this->isDirty;
  }

  private function getLines(): vec<string> {
    return Str\split($this->contents, "\n");
  }

  const type TLineNumber = int;

  /**
   * Returns the 1-based line number of lint markers in the file.
   */
  <<__Memoize>>
  public function lintMarkersForLineBasedSuppression(
  ): dict<string, keyset<self::TLineNumber>> {
    return $this->getLines()
      |> Vec\map_with_key(
        $$,
        ($line_index, $line_content) ==>
          Regex\every_match($line_content, re"/(?<marker_name>\w+)\[\w+\]/")
          |> Vec\filter(
            $$,
            $match ==> LintMarkerName::isValid($match['marker_name']),
          )
          |> Vec\map($$, $match ==> tuple($line_index + 1, $match[0])),
      )
      |> Vec\flatten($$)
      |> Dict\group_by($$, $line_marker ==> $line_marker[/* marker */ 1])
      |> Dict\map(
        $$,
        $line_markers ==> Keyset\map(
          $line_markers,
          $line_marker ==> $line_marker[/* line number */ 0],
        ),
      );
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
      \HHVM_REPO_SCHEMA,
      null,
      \SODIUM_CRYPTO_GENERICHASH_KEYBYTES,
    );
  }
}
