/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\File;
use namespace HH\Lib\{C, Str};

<<__ConsistentConstruct>>
trait LinterTrait {
  require implements Linter;

  public static function shouldLintFile(File $_): bool {
    return true;
  }

  private File $file;
  private ?this::TConfig $config;
  private bool $shouldAllowSuppressionComments;

  private function __construct(
    File $file,
    ?this::TConfig $config,
    bool $should_allow_suppression_comments,
  ) {
    $this->file = $file;
    $this->config = $config;
    $this->shouldAllowSuppressionComments = $should_allow_suppression_comments;
  }

  public static function newInstance(
    File $file,
    ?this::TConfig $config,
    bool $should_allow_suppression_comments,
  ): this {
    return new static($file, $config, $should_allow_suppression_comments);
  }

  protected function getConfig(): ?this::TConfig {
    return $this->config;
  }

  final public static function fromPath(string $path): this {
    return static::fromPathWithConfig($path, null);
  }

  final public static function fromPathWithConfig(
    string $path,
    ?this::TConfig $config,
  ): this {
    return static::fromPathWithConfigAndShouldAllowSupressionComments(
      $path,
      $config,
      true,
    );
  }

  final public static function fromPathWithConfigAndShouldAllowSupressionComments(
    string $path,
    ?this::TConfig $config,
    bool $should_allow_suppression_comments,
  ): this {
    return new static(
      File::fromPath($path),
      $config,
      $should_allow_suppression_comments,
    );
  }

  final public function getFile(): File {
    return $this->file;
  }

  // A simple name for the linter, based on the class name
  <<__Memoize>>
  public function getLinterName(): string {
    return static::class
      |> Str\split($$, '\\')
      |> C\lastx($$)
      |> Str\strip_suffix($$, 'Linter');
  }

  public final function getErrorCode(): string {
    return $this->getLinterName();
  }

  abstract protected function isSuppressedForFile(File $file): bool;

  public function isLinterSuppressedForFile(): bool {
    return $this->isSuppressedForFile($this->getFile());
  }

  public function shouldAllowSuppressionComments(): bool {
    return $this->shouldAllowSuppressionComments;
  }
}
