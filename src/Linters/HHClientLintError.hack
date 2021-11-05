/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class HHClientLintError implements LintError {

  protected function getErrorCode(): string {
    return $this->getLintRule()->getErrorCode();
  }

  const type TJSONError = shape(
    'descr' => string,
    'severity' => HHClientLintSeverity,
    'path' => string,
    'line' => int,
    'start' => int,
    'end' => int,
    'code' => int,
    'bypass_changed_lines' => bool,
    'original' => string,
    'replacement' => string,
  );

  public function __construct(
    private File $file,
    private this::TJSONError $error,
    private ?string $blame_code = null
  ) {
  }

  public function getFile(): File {
    return $this->file;
  }

  public function getDescription(): string {
    return $this->error['descr'];
  }

  public function getPosition(): (int, int) {
    return tuple($this->error['line'], $this->error['end']);
  }

  public function getRange(): ((int, int), (int, int)) {
    return tuple(
      tuple($this->error['line'], $this->error['start']),
      tuple($this->error['line'], $this->error['end']),
    );
  }

  public function getBlameCode(): ?string {
    return $this->blame_code;
  }

  public function getPrettyBlame(): ?string {
    return $this->getBlameCode();
  }

  <<__Memoize>>
  public function getLintRule(): HHClientLintRule {
    return new HHClientLintRule($this->error['code']);
  }

}
