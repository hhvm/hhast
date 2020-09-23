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
use namespace HH\Lib\{C, Dict, Str, Vec};
use type Facebook\CLILib\CLIWithRequiredArguments;
use type HH\Lib\_Private\PHPWarningSuppressor;
use namespace Facebook\CLILib\CLIOptions;

use namespace /* HHAST_IGNORE_ERROR[UseStatementWithAs] */ Facebook\XHP\Core as x
;
use type Facebook\XHP\HTML\{
  body,
  code,
  div,
  head,
  html,
  pre,
  script,
  span,
  style,
};

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
      await $err->writeAllAsync("Provide exactly one file name\n");
      return 1;
    }

    $input = C\onlyx($this->getArguments());
    if (!\is_file($input)) {
      await $err->writeAllAsync("Provided path is not a file.\n");
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
      await $this->getXHPDocument($ast)->toStringAsync(),
    );

    print $output."\n";

    if ($this->open) {
      if (!self::openFileInBrowser($output)) {
        await $err->writeAllAsync("We failed to open your browser.\n");
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

  private function getXHPDocument(HHAST\Node $node): x\node {
    return (
      <html>
        <head>
          <style>
            {\file_get_contents(__DIR__.'/syntax.css')}
            {\file_get_contents(__DIR__.'/inspector.css')}
          </style>
        </head>
        <body>
          <div class="info">Click on some code to get started.</div>
          <pre>
            <code class="language-hack">
              {$this->getXHPForNode($node)}
            </code>
          </pre>
          <script>{\file_get_contents(__DIR__.'/inspector.js')}</script>
        </body>
      </html>
    );
  }

  private function getDataForTrace(vec<(HHAST\Node, arraykey)> $trace): string {
    // This data is all included in the CSS class names, but there's a /lot/ of
    // other stuff in there. Provide something less noisy for the JS
    return Vec\map($trace, $entry ==> {
      list($node, $field) = $entry;
      return Str\format(
        '%s.%d.%s',
        \get_class($node) |> Str\split($$, '\\') |> C\lastx($$),
        $node->getUniqueID(),
        (string)$field,
      );
    })
      |> Str\join($$, ' ');
  }

  private function getCSSClassesForTrace(
    vec<(HHAST\Node, arraykey)> $trace,
    HHAST\Node $innermost,
  ): string {
    // This returns anything we might want for highlighting; this includes:
    // - selection highlighting for parent AST nodes. As the parent
    //   AST nodes do not have a DOM node, every DOM node that would be part of
    //   that AST node needs a class indicating that node
    // - selection highlighting for a particular AST field: this introduces the
    //   need for (id, field), including in parents
    // - syntax highlighting; this introduces the need for:
    //   - (class)
    //   - (class, field)
    $trace = Vec\map($trace, $entry ==> {
      list($node, $field) = $entry;
      $class = \get_class($node) |> Str\split($$, '\\') |> C\lastx($$);
      return Str\format(
        'hs-%s hs-%s-%s hs-id-%d hs-id-%d-%s',
        $class,
        $class,
        (string)$field,
        $node->getUniqueID(),
        $node->getUniqueID(),
        (string)$field,
      );
    });
    $trace[] = Str\format(
      'hs-%s hs-id-%d',
      \get_class($innermost) |> Str\split($$, '\\') |> C\lastx($$),
      $innermost->getUniqueID(),
    );
    return Str\join($trace, ' ');
  }

  private function getXHPForNode(
    HHAST\Node $node,
    vec<(HHAST\Node, arraykey)> $trace = vec[],
  ): x\node {
    $class = \get_class($node) |> Str\split($$, '\\') |> C\lastx($$);
    if ($node is HHAST\Trivia) {
      return
        <span
          id={'hs-id-'.$node->getUniqueID()}
          class={$this->getCSSClassesForTrace($trace, $node)}
          data-kind={$class}
          data-trace={$this->getDataForTrace($trace)}>
          {$node->getCode()}
        </span>;
    }

    if ($node is HHAST\Token) {
      return
        <x:frag>
          {
            $this->getXHPForNode(
              $node->getLeading(),
              Vec\concat($trace, vec[tuple($node, 'leading')]),
            )
          }
          <span
            id={'hs-id-'.$node->getUniqueID()}
            class={$this->getCSSClassesForTrace($trace, $node)}
            data-kind={$class}
            data-trace={$this->getDataForTrace($trace)}>
            {$node->getText()}
          </span>
          {
            $this->getXHPForNode(
              $node->getTrailing(),
              Vec\concat($trace, vec[tuple($node, 'trailing')]),
            )
          }
        </x:frag>;
    }

    return $node->getChildren()
      |> Dict\map_with_key(
        $$,
        ($key, $child) ==> $this->getXHPForNode(
          $child,
          Vec\concat($trace, vec[tuple($node, $key)]),
        ),
      )
      |> <x:frag>{$$}</x:frag>;
  }
}
