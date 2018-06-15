<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPLib;

use namespace Facebook\HHAST\__Private\LSP;
use function Facebook\HHAST\__Private\type_alias_structure;
use namespace Facebook\TypeSpec;
use namespace HH\Lib\{Dict, Str};

abstract class Server {
  abstract const keyset<classname<Command>> COMMANDS;

  private dict<string, Command> $commands;

  public function __construct() {
    $this->commands = Dict\pull(
      static::COMMANDS,
      $class ==> new $class(),
      $class ==> $class::COMMAND,
    );
  }

  final public async function handleMessageAsync(
    string $json,
  ): Awaitable<string> {
    $request =
      self::jsonDecode(type_alias_structure(LSP\RequestMessage::class), $json);
    $command = $this->commands[$request['method']] ?? null;
    if ($command === null) {
      return self::encodeResponse(
        shape(
          'jsonrpc' => '2.0',
          'id' => $request['id'],
          'error' => shape(
            'code' => LSP\ErrorCode::METHOD_NOT_FOUND,
            'message' =>
              Str\format("Command '%s' is not implemented", $request['method']),
          ),
        ),
      );
    }

    $params = ($request['params'] ?? null)
      |> TypeSpec\__Private\from_type_structure(
        type_structure($command, 'TParams'),
      )->coerceType($$);
    $result = await $command->executeAsync($params);
    if ($result instanceof Success) {
      return self::encodeResponse(shape(
        'jsonrpc' => '2.0',
        'id' => $request['id'],
        'result' => $result->getResult(),
      ));
    }

    $error = $result->getError();
    return self::encodeResponse(shape(
      'jsonrpc' => '2.0',
      'id' => $request['id'],
      'error' => $result->getError()->asResponseError(),
    ));
  }

  private static function encodeResponse(LSP\ResponseMessage $response): string {
    return \json_encode($response);
  }

  private static function jsonDecode<T>(TypeStructure<T> $ts, string $json): T {
    $request = \json_decode(
      $json, /* assoc = */
      true, /* depth = */
      512,
      \JSON_FB_HACK_ARRAYS,
    );
    return TypeSpec\__Private\from_type_structure($ts)->coerceType($request);
  }
}
