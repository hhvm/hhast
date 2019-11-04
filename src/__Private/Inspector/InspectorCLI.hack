/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Dict, Str};
use type Facebook\CLILib\CLIWithRequiredArguments;
use type HH\Lib\_Private\PHPWarningSuppressor;
use namespace Facebook\CLILib\CLIOptions;

final class InspectorCLI extends CLIWithRequiredArguments {
  private ?string $outputPath = null;
  private bool $open = false;

  <<__Override>>
  public static function getHelpTextForRequiredArguments(): vec<string> {
    return vec['FILE'];
  }

  <<__Override>>
  protected function getSupportedOptions(): vec<CLIOptions\CLIOption> {
    return vec[
      CLIOptions\with_required_string(
        $path ==> {
          $this->outputPath = $path;
        },
        'File path to use for output',
        '--output',
        '-o',
      ),
      CLIOptions\flag(
        () ==> {
          $this->open = true;
        },
        'Automatically open the generated file',
        '--open',
      ),
    ];
  }

  <<__Override>>
  public async function mainAsync(): Awaitable<int> {
    $err = $this->getStderr();
    if (C\count($this->getArguments()) !== 1) {
      await $err->writeAsync("Provide exactly one file name\n");
      return 1;
    }

    $input = C\onlyx($this->getArguments());
    if (!\is_file($input)) {
      await $err->writeAsync("Provided path is not a file.\n");
      return 1;
    }

    $ast = await HHAST\from_file_async(HHAST\File::fromPath($input));

    // No XHP as XHP currently doesn't support namespaces
    $output = $this->outputPath ??
      Str\format(
        '%s/hhast-inspect-%s.html',
        Str\strip_suffix(\sys_get_temp_dir(), '/'),
        \bin2hex(\random_bytes(16)),
      );

    \file_put_contents(
      $output,
      self::getHTMLHeader().$this->getHTMLForNode($ast).self::getHTMLFooter(),
    );

    print $output."\n";

    if ($this->open) {
      if (!self::openFileInBrowser($output)) {
        await $err->writeAsync("We failed to open your browser.\n");
      }
    }

    return 0;
  }

  private static function openFileInBrowser(string $filename): bool {
    $env = \HH\global_get('_ENV');
    $os = OSFAMILY;
    if ($os is null) {
      return false;
    }

    switch ($os) {
      case OSFamily::MACOS:
        $result = \pcntl_exec('/usr/bin/open', varray[$filename], $env);
        break;
      case OSFamily::LINUX:
        using ($_no_warnings = new PHPWarningSuppressor()) {
          $result = \pcntl_exec(
            '/usr/bin/sensible-browser',
            varray[$filename],
            $env,
          );
        }
        if ($result === false) {
          $result = \pcntl_exec('/usr/bin/xdg-open', varray[$filename], $env);
        }
        break;
      default:
        $result = false;
    }

    return $result;
  }

  private static function getHTMLHeader(): string {
    return "<html><head><style>".
      \file_get_contents(__DIR__.'/syntax.css').
      \file_get_contents(__DIR__.'/inspector.css').
      '</style></head><body>'.
      '<div class="info">Click on some code to get started.</div>'.
      '<pre><code class="language-hack">';
  }

  private static function getHTMLFooter(): string {
    return '</code></pre>'.
      '<script>'.
      \file_get_contents(__DIR__.'/inspector.js').
      '</script>'.
      "</body></html>\n";
  }

  private function getHTMLForNode(HHAST\Node $node): string {
    if ($node->isTrivia()) {
      $inner = \htmlspecialchars($node->getCode());
    } else if ($node is HHAST\Token) {
      $inner = '';

      $leading = $node->getLeading();
      $inner .= '<span data-field="leading">'.
        $this->getHTMLForNode($leading).
        '</span>';

      $inner .= \htmlspecialchars($node->getText());

      $trailing = $node->getTrailing();
      $inner .= '<span data-field="trailing">'.
        $this->getHTMLForNode($trailing).
        '</span>';
    } else {
      $inner = $node->getChildren()
        |> Dict\map_with_key(
          $$,
          ($key, $child) ==> Str\format(
            '<span data-field="%s">%s</span>',
            (string)$key,
            $this->getHTMLForNode($child),
          ),
        )
        |> Str\join($$, '');
    }

    $class = \get_class($node)
      |> Str\split($$, "\\")
      |> C\lastx($$);

    return Str\format(
      '<span class="hs-%s" data-node="%s">%s</span>',
      $class |> Str\strip_prefix($$, ''),
      $class,
      $inner,
    );
  }
}
