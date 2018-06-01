<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  EditableNode,
  FunctionDeclaration,
  IFunctionishDeclaration,
  MethodishDeclaration,
};
use namespace HH\Lib\{C, Str};

class AsyncFunctionAndMethodLinter extends FunctionNamingLinter {
  <<__Override>>
  final public function getSuggestedNameForFunction(
    string $name,
    FunctionDeclaration $func,
  ): string {
    list($head, $suffix) = self::splitName($name);
    $declaration_header = $func->getDeclarationHeader()->getCode();
    if (
        \preg_match('/^test/', $head) !== 1 &&
        \preg_match('/:\s*Awaitable.*$/', $declaration_header) === 1 &&
        \preg_match('/(_async|_asyncx)$/', $head) !== 1
    ) {
      return $head
        |> ($suffix === null ? $$.'_async' : $$.'_async_'.$suffix);
    }
    return $name;
  }

  <<__Override>>
  final public function getSuggestedNameForInstanceMethod(
    string $name,
    MethodishDeclaration $meth,
  ): string {
    list($head, $suffix) = self::splitName($name);
    $declaration_header = $meth->getFunctionDeclHeader()->getCode();
    if (
      \preg_match('/^test/', $head) !== 1 &&
      \preg_match('/:\s*Awaitable.*$/', $declaration_header) === 1 &&
      \preg_match('/(Async|Asyncx)$/', $head) !== 1
    ) {
      return $head
        |> ($suffix === null ? $$.'Async' : $$.'Async'.$suffix);
    }
    return $name;
  }

  <<__Override>>
  final public function getSuggestedNameForStaticMethod(
    string $name,
    MethodishDeclaration $meth,
  ): string {
    return $this->getSuggestedNameForInstanceMethod($name, $meth);
  }

  protected static function splitName(string $name): (string, ?string) {
    $suffixes = vec['UNTYPED', 'UNSAFE', 'DEPRECATED'];
    foreach ($suffixes as $suffix) {
      if (Str\ends_with_ci($name, $suffix)) {
        return tuple(
          Str\slice($name, 0, Str\length($name) - Str\length($suffix))
          |> Str\strip_suffix($$, '_'),
          $suffix,
        );
      }
    }
    return tuple($name, null);
  }
}
