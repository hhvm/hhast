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

use type Facebook\CLILib\ITerminal;
use namespace Facebook\HHAST\Linters;
use namespace HH\Lib\{C, Vec};

final class LintRunJSONEventHandler implements LintRunEventHandler {
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

  public function __construct(
    private ITerminal $terminal,
  ) {
  }


  public function linterRaisedErrors(
    Linters\BaseLinter $linter,
    LintRunConfig::TFileConfig $config,
    Traversable<Linters\LintError> $errors,
  ): LintAutoFixResult {
    $transformed_errors = self::transformErrors($errors);
    $this->errors = Vec\concat($this->errors, $transformed_errors);
    return LintAutoFixResult::SOME_UNFIXED;
  }

  public function finishedFile(string $_, LintRunResult $_): void {
  }

  public function finishedRun(LintRunResult $_): void {
    $this->terminal->getStdout()->write(\json_encode($this->getOutput()));
  }

  private function getOutput(): self::TOutput {
    return shape(
      'passed' => !$this->errors,
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
