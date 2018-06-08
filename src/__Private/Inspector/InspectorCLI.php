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

use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Dict, Str};

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
      CLIOptions\with_required_value(
        $path ==> { $this->outputPath = $path; },
        'File path to use for output',
        '--output',
        '-o',
      ),
      CLIOptions\flag(
        () ==> { $this->open = true; },
        'Automatically open the generated file',
        '--open',
      ),
    ];
  }

  <<__Override>>
  public async function mainAsync(): Awaitable<int> {
    if (C\count($this->getArguments()) !== 1) {
      \fwrite(\STDERR, "Provide exactly one file name\n");
      return 1;
    }

    $input = C\onlyx($this->getArguments());
    if (!\is_file($input)) {
      \fwrite(\STDERR, "Provided path is not a file.\n");
      return 1;
    }

    $ast = HHAST\from_file($input);

    // No XHP as XHP currently doesn't support namespaces
    $output = $this->outputPath ??
      Str\format(
        '%s/hhast-inspect-%s.html',
        Str\strip_suffix(\sys_get_temp_dir(), '/'),
        \bin2hex(\random_bytes(16)),
      );

    \file_put_contents(
      $output,
      $this->getHTMLHeader().$this->getHTMLForNode($ast).$this->getHTMLFooter(),
    );

    print $output."\n";

    if ($this->open) {
      \pcntl_exec('/usr/bin/open', [$output]);
    }

    return 0;
  }

  private function getHTMLHeader(): string {
    return "<html><head><style>".
      \file_get_contents(__DIR__.'/syntax.css').
      \file_get_contents(__DIR__.'/inspector.css').
      '</style></head><body>'.
      '<div class="info">Click on some code to get started.</div>'.
      '<pre><code class="language-hack">';
  }

  private function getHTMLFooter(): string {
    return '</code></pre>'.
      '<script>'.
      \file_get_contents(__DIR__.'/inspector.js').
      '</script>'.
      "</body></html>\n";
  }

  private function getHTMLForNode(HHAST\EditableNode $node): string {
    if ($node instanceof HHAST\Missing) {
      return '';
    }

    if ($node->isTrivia()) {
      $inner = \htmlspecialchars($node->getCode());
    } else if ($node instanceof HHAST\EditableToken) {
      $inner = '';

      $leading = $node->getLeading();
      if (!$leading instanceof HHAST\Missing) {
        $inner .=
          '<span data-field="leading">'.
          $this->getHTMLForNode($leading).
          '</span>';
      }

      $inner .= \htmlspecialchars($node->getText());

      $trailing = $node->getTrailing();
      if (!$trailing instanceof HHAST\Missing) {
        $inner .=
          '<span data-field="trailing">'.
          $this->getHTMLForNode($trailing).
          '</span>';
      }
    } else {
      $inner = $node->getChildren()
        |> Dict\map_with_key(
          $$,
          ($key, $child) ==> Str\format(
            '<span data-field="%s">%s</span>',
            $key,
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
      $class |> Str\strip_prefix($$, 'Editable'),
      $class,
      $inner,
    );
  }
}
