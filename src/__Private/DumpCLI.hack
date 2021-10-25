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
use namespace Facebook\CLILib\CLIOptions;

final class DumpCLI extends CLIWithRequiredArguments {
  <<__Override>>
  public static function getHelpTextForRequiredArguments(): vec<string> {
    return vec['PATH'];
  }

  <<__Override>>
  protected function getSupportedOptions(): vec<CLIOptions\CLIOption> {
    return vec[];
  }

  <<__Override>>
  public async function mainAsync(): Awaitable<int> {
    $err = $this->getStderr();
    if (C\count($this->getArguments()) !== 1) {
      await $err->writeAllAsync("Provide exactly one file name\n");
    }
    $file = C\onlyx($this->getArguments());
    if (!\is_file($file)) {
      await $err->writeAllAsync("Provided path is not a file.\n");
      return 1;
    }

    $ast = await HHAST\from_file_async(HHAST\File::fromPath($file));
    await $this->getStdout()->writeAllAsync($this->textForNode($ast)."\n");
    return 0;
  }

  private function inlineOrIndent(string $text): string {
    $indent = '  ';
    if (Str\length($text) < 60 && !Str\contains($text, "\n") && !Str\starts_with($text, '  ')) {
      return ' '.$text;
    }
    return "\n".$indent.Str\replace($text, "\n", "\n".$indent);
  }

  private function inlineOrIndentNode(HHAST\Node $node): string {
    return $this->inlineOrIndent($this->textForNode($node));
  }

  private function textForNode(HHAST\Node $node): string {
    $class = \get_class($node) |> Str\split($$, '\\') |> C\lastx($$);

    if ($node is HHAST\Token) {
      return vec[
        $class.':',
        '  leading:'.$this->inlineOrIndentNode($node->getLeading()),
        '  text:'.$this->inlineOrIndent(\var_export($node->getText(), true)),
        '  trailing:'.$this->inlineOrIndentNode($node->getTrailing()),
      ] |> Str\join($$, "\n");
    }

    if ($node is HHAST\NodeList<_>) {
      $class.= Str\format('[%d]', C\count($node->getChildren()));
    }

    return
      Dict\map_with_key($node->getChildren(), ($key, $child) ==>
        $key.':'.$this->inlineOrIndentNode($child)
      )
      |> Str\join($$, "\n")
      |> $class.':'.$this->inlineOrIndent($$);
  }
}
