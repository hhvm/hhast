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
use type Facebook\TypeAssert\TypeCoercionException;
use namespace HH\Lib\{Dict, Str};

abstract class Server {
  protected function getSupportedCommands(): vec<Command> {
    return vec[];
  }

  protected function getSupportedClientNotifications(): vec<ClientNotification> {
    return vec[new InitializedNotification()];
  }

  private dict<string, Command> $commands = dict[];
  private dict<string, ClientNotification> $notifications = dict[];
  private bool $inited = false;

  public function __construct() {
    $this->commands = Dict\pull(
      $this->getSupportedCommands(),
      $class ==> $class,
      $class ==> $class::METHOD,
    );
    $this->notifications = Dict\pull(
      $this->getSupportedClientNotifications(),
      $class ==> $class,
      $class ==> $class::METHOD,
    );
  }

  abstract protected function sendMessage(LSP\Message $message): void;

  final protected function sendResponseMessage(
    LSP\ResponseMessage $message,
  ): void {
    $this->sendMessage($message);
  }

  final protected function sendNotificationMessage(
    LSP\NotificationMessage $message,
  ): void {
    $this->sendMessage($message);
  }

  <<__Memoize>>
  final public async function waitForInitAsync(): Awaitable<void> {
    while (!$this->inited) {
      /* HHAST_IGNORE_ERROR[DontAwaitInALoop] */
      await \HH\Asio\later();
    }
  }

  final public async function handleMessageAsync(
    string $json,
  ): Awaitable<void> {
    $was_request = await $this->tryHandleMessageTypeAsync(
      type_alias_structure(LSP\RequestMessage::class),
      async $r ==> await $this->handleRequestMessageAsync($r),
      $json,
    );
    if ($was_request) {
      return;
    }

    $was_notification = await $this->tryHandleMessageTypeAsync(
      type_alias_structure(LSP\NotificationMessage::class),
      async $n ==> await $this->handleClientNotificationMessageAsync($n),
      $json,
    );
    if ($was_notification) {
      return;
    }

    invariant_violation(
      "Don't know how to handle this message type: %s",
      $json,
    );
  }

  private async function tryHandleMessageTypeAsync<T>(
    TypeStructure<T> $type_structure,
    (function(T): Awaitable<void>) $impl,
    string $json,
  ): Awaitable<bool> {
    try {
      $message = self::jsonDecode(
        $type_structure,
        $json,
      );
    } catch (TypeCoercionException $_) {
      return false;
    }
    await $impl($message);
    return true;
  }

  private async function handleClientNotificationMessageAsync(
    LSP\NotificationMessage $notification,
  ): Awaitable<void> {
    $handler = $this->notifications[$notification['method']] ?? null;
    if ($handler === null) {
      throw new \Exception("Don't know how to handle ".$notification['method']);
      return;
    }
    $params = ($notification['params'] ?? null)
      |> TypeSpec\__Private\from_type_structure(
        type_structure($handler, 'TParams'),
      )->coerceType($$);
    await $handler->executeAsync($params);
    if ($handler instanceof InitializedNotification) {
      $this->inited = true;
    }
  }

  private async function handleRequestMessageAsync(
    LSP\RequestMessage $request,
  ): Awaitable<void> {
    $command = $this->commands[$request['method']] ?? null;
    if ($command === null) {
      $this->sendResponseMessage(
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
      return;
    }

    $params = ($request['params'] ?? null)
      |> TypeSpec\__Private\from_type_structure(
        type_structure($command, 'TParams'),
      )->coerceType($$);
    $result = await $command->executeAsync($params);
    if ($result instanceof Success) {
      $this->sendResponseMessage(shape(
        'jsonrpc' => '2.0',
        'id' => $request['id'],
        'result' => $result->getResult(),
      ));
      return;
    }

    $error = $result->getError();
    $this->sendResponseMessage(shape(
      'jsonrpc' => '2.0',
      'id' => $request['id'],
      'error' => $result->getError()->asResponseError(),
    ));
    return;
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
