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
use type Facebook\HHAST\__Private\Diff\StringDiff;
use namespace Facebook\HHAST\Linters;
use namespace HH\Lib\{C, Str, Vec};

final class LintRunCLIEventHandler implements LintRunEventHandler {
  public function __construct(private ITerminal $terminal) {}

  public function linterRaisedErrors(
    Linters\BaseLinter $linter,
    LintRunConfig::TFileConfig $config,
    Traversable<Linters\LintError> $errors,
  ): LintAutoFixResult {
    $class = \get_class($linter);
    $to_fix = vec[];
    $result = LintAutoFixResult::ALL_FIXED;
    $colors = $this->terminal->supportsColors();

    foreach ($errors as $error) {
      $position = $error->getPosition();
      $this->terminal
        ->getStdout()
        ->write(Str\format(
          "%s%s%s\n"."  %sLinter: %s%s\n"."  Location: %s\n",
          $colors ? "\e[1;31m" : '',
          $error->getDescription(),
          $colors ? "\e[0m" : '',
          $colors ? "\e[90m" : '',
          \get_class($error->getLinter()),
          $colors ? "\e[0m" : '',
          $position === null
            ? $error->getFile()->getPath()
            : Str\format(
                '%s:%d:%d',
                $error->getFile()->getPath(),
                $position[0],
                $position[1],
              ),
        ));

      $fixable = $error instanceof Linters\FixableLintError &&
        (!C\contains_key($config['autoFixBlacklist'], $class)) &&
        $error->isFixable();

      if ($error instanceof Linters\FixableLintError && $fixable) {
        if ($this->shouldFixLint($error)) {
          $to_fix[] = $error;
        } else {
          $result = LintAutoFixResult::SOME_UNFIXED;
        }
      } else {
        $this->renderLintBlame($error);
        $result = LintAutoFixResult::SOME_UNFIXED;
      }
    }

    if (!C\is_empty($to_fix)) {
      self::fixErrors($linter, $to_fix);
    }

    return $result;
  }

  public function finishedFile(string $_, LintRunResult $_): void {
  }

  public function finishedRun(LintRunResult $result): void {
    if ($result === LintRunResult::NO_ERRORS) {
      $this->terminal->getStdout()->write("No errors.\n");
    }
  }

  private static function fixErrors(
    Linters\BaseLinter $linter,
    vec<Linters\FixableLintError> $errors,
  ): void {
    invariant(
      $linter instanceof Linters\AutoFixingLinter,
      '%s is not an auto-fixing-linter',
      \get_class($linter),
    );

    $file = $linter->getFixedFile($errors);
    \file_put_contents($file->getPath(), $file->getContents());
  }

  private function shouldFixLint(Linters\FixableLintError $error): bool {
    list($old, $new) = $error->getReadableFix();
    if ($old === $new) {
      $this->renderLintBlame($error);
      return false;
    }

    $prefix_lines = ($code, $prefix) ==> Str\split($code, "\n")
      |> Vec\map($$, $line ==> $prefix.$line)
      |> Str\join($$, "\n");


    $colors = $this->terminal->supportsColors();
    $reset = $colors ? "\e[0m" : '';

    if ($error->shouldRenderBlameAndFixAsDiff()) {
      $diff = StringDiff::lines($old, $new)->getUnifiedDiff();
      if (!$colors) {
        $this->terminal->getStdout()->write($diff);
      } else {
        $diff
          |> Str\split($$, "\n")
          |> Vec\map(
            $$,
            $line ==> {
              if (Str\starts_with($line, '@@')) {
                return "\e[36m".$line.$reset; // blue
              }
              if (Str\starts_with($line, '-')) {
                return "\e[31m".$line.$reset; // red;
              }
              if (Str\starts_with($line, '+')) {
                return "\e[32m".$line.$reset; // green;
              }
              return $line;
            },
          )
          |> Str\join($$, "\n")
          |> $this->terminal->getStdout()->write($$);
      }
    } else {
      $blame_color = $colors ? "\e[33m" : ''; // yellow
      $blame_marker = ' >';
      $fix_color = $colors ? "\e[33m" : ''; // yellow
      $fix_marker = '  ';
      $this->terminal
        ->getStdout()
        ->write(Str\format(
          "  Code:\n"."%s%s%s\n".
          "  Suggested fix:\n"."%s%s%s\n",
          $blame_color,
          $prefix_lines($old, '  '.$blame_marker),
          $reset,
          $fix_color,
          $prefix_lines($new, '  '.$fix_marker),
          $reset,
        ));
    }

    if (!$this->terminal->isInteractive()) {
      return false;
    }

    static $cache = dict[];
    $cache_key = \get_class($error->getLinter());
    if (C\contains_key($cache, $cache_key)) {
      $should_fix = $cache[$cache_key];
      $this->terminal
        ->getStdout()
        ->write(Str\format(
          "Would you like to apply this fix?\n  <%s to all>\n",
          $should_fix ? 'yes' : 'no',
        ));
      return $should_fix;
    }

    $response = null;
    do {
      $this->terminal
        ->getStdout()
        ->write(
          "\e[94mWould you like to apply this fix?\e[0m\n".
          "  \e[37m[y]es/[N]o/yes to [a]ll/n[o] to all:\e[0m ",
        );
      $response = \HH\Asio\join($this->terminal->getStdin()->readLineAsync());
      $response = Str\trim($response);
      switch ($response) {
        case 'a':
          $cache[$cache_key] = true;
          // FALLTHROUGH
        case 'y':
          return true;
        case 'o':
          $cache[$cache_key] = false;
          // FALLTHROUGH
        case 'n':
        case '':
          return false;
        default:
          $this->terminal
            ->getStderr()
            ->write(Str\format("'%s' is not a valid response.\n", $response));
          $response = null;
      }
    } while ($response === null);
    return false;
  }

  private function renderLintBlame(Linters\LintError $error): void {
    $blame = $error->getPrettyBlame();
    if ($blame === null) {
      return;
    }

    $colors = $this->terminal->supportsColors();
    $this->terminal
      ->getStdout()
      ->write(Str\format(
        "  Code:\n%s%s%s\n",
        $colors ? "\e[33m" : '',
        Str\split($blame, "\n")
        |> Vec\map($$, $line ==> '  >'.$line)
        |> Str\join($$, "\n"),
        $colors ? "\e[0m" : '',
      ));
  }
}
