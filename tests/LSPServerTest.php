<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST;

use function Facebook\HHAST\TestLib\expect;
use namespace Facebook\HHAST\__Private\LSP;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{Dict, Str, Tuple};

final class LSPServerTest extends TestCase {
  use LinterCLITestTrait;

  public function testImmediateExit(): void {
    list($cli, $in, $out, $err) = $this->getCLI('--mode', 'lsp');

    shape(
      'jsonrpc' => '2.0',
      'method' => 'exit',
      'params' => shape(),
    )
    |> $this->messageToRPC($$)
    |> $in->appendToBuffer($$);

    $in->close();

    $exit_code = \HH\Asio\join($cli->mainAsync());
    expect($exit_code)->toBeSame(1);
    expect($err->getBuffer())->toBeSame('');
  }

  public function testExitAfterShutdown(): void {
    list($cli, $in, $out, $err) = $this->getCLI('--mode', 'lsp');

    shape(
      'jsonrpc' => '2.0',
      'id' => __LINE__,
      'method' => 'shutdown',
      'params' => shape(),
    )
    |> $this->messageToRPC($$)
    |> $in->appendToBuffer($$);

    shape(
      'jsonrpc' => '2.0',
      'method' => 'exit',
      'params' => shape(),
    )
    |> $this->messageToRPC($$)
    |> $in->appendToBuffer($$);

    $in->close();

    $exit_code = \HH\Asio\join($cli->mainAsync());
    expect($exit_code)->toBeSame(0);
    expect($err->getBuffer())->toBeSame('');
  }

  private function messageToRPC(LSP\Message $data): string {
    $json = \json_encode($data);
    return Str\format("Content-Length: %d\r\n\r\n%s", Str\length($json), $json);
  }

  public function provideExampleExchanges(): array<array<string>> {
    return [['basic-diagnostic']];
  }

  const type TExchange = vec<LSP\Message>;

  /**
   * @dataProvider provideExampleExchanges
   */
  public function testExampleExchange(string $name): void {
    $mappings = dict[
      'HHAST_ROOT_URI' =>  'file://'.\realpath(\dirname(__DIR__)),
      'HHAST_FIXTURES_URI' => 'file://'.\realpath(__DIR__.'/fixtures'),
    ];

    $messages = \file_get_contents(__DIR__.'/lsp/'.$name.'.json')
      |> Str\replace_every($$, $mappings)
      |> \json_decode(
        $$,
        /* assoc = */ true,
        /* depth = */ 512,
        \JSON_FB_HACK_ARRAYS,
      )
      |> TypeAssert\matches_type_structure(
        type_structure(self::class, 'TExchange'),
        $$,
      );

    list($cli, $input, $output, $error) = $this->getCLI('--mode', 'lsp');
    list($code, $_) = \HH\Asio\join(Tuple\from_async(
      $cli->mainAsync(),
      async {
        foreach ($messages as $message) {
          $message = \json_encode($message);
          $input->appendToBuffer(
            'Content-Length: '.Str\length($message)."\r\n\r\n".$message,
          );
          // Wait for the implementation to deal with the message
          await \HH\Asio\later();
        }
        $input->close();
      },
    ));

    $output = $output->getBuffer()
      |> Str\replace_every($$, Dict\flip($mappings))
      |> $$."\n";
    expect($output)->toMatchExpectFileWithInputFile(
      __DIR__.'/lsp/'.$name.'.expect',
      __DIR__.'/lsp/'.$name.'.json',
    );
  }
}
