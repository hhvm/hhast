<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\HHAST\Linters;
use namespace HH\Lib\{C, Vec};

final class LinterCLIErrorHandlerJSON implements LinterCLIErrorHandler {

  const type TOutput = shape(
    'passed' => bool,
    'errors' => vec<self::TOutputError>,
  );

  const type TOutputError = shape(
    'path' => string,
    'range' => self::TOutputErrorRange,
    'message' => string,
    'linter' => string,
  );

  const type TOutputErrorRange = shape(
    'start' => ?self::TOutputErrorPosition,
    'end' => ?self::TOutputErrorPosition,
  );

  const type TOutputErrorPosition = shape(
    'line' => int,
    'character' => int,
  );

  private vec<self::TOutputError> $errors = vec[];

  public function processErrors(
    Linters\BaseLinter $linter,
    LinterCLIConfig::TFileConfig $config,
    Traversable<Linters\LintError> $errors,
  ): void {
    $transformed_errors = self::transformErrors($errors);
    $this->errors = Vec\concat($this->errors, $transformed_errors);
  }

  public function hadErrors(): bool {
    return !C\is_empty($this->errors);
  }

  public function print(): void {
    $c = new PerfCounter('#json_encode');
    $output = \json_encode($this->getOutput());
    $c->end();
    print($output);
  }

  private function getOutput(): self::TOutput {
    return shape(
      'passed' => !$this->hadErrors(),
      'errors' => $this->errors,
    );
  }

  private static function transformErrors(
    Traversable<Linters\LintError> $errors,
  ): vec<self::TOutputError> {
    return Vec\map(
      $errors,
      $error ==> {
        $start_position = $error->getPosition();
        $start = $start_position !== null
          ? shape('line' => $start_position[0], 'character' => $start_position[1])
          : null;
        return shape(
          'path' => $error->getFile(),
          'range' => shape(
            'start' => $start,
            'end' => null,
          ),
          'message' => $error->getDescription(),
          'linter' => $error->getLinter()->getLinterName(),
        );
      },
    );
  }
}
