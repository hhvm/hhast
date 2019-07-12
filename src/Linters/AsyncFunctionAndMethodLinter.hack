/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Str;

class AsyncFunctionAndMethodLinter extends FunctionNamingLinter {
  <<__Override>>
  final public function getSuggestedNameForFunction(
    string $name,
    FunctionDeclaration $func,
  ): string {
    list($head, $suffix) = self::splitName($name);
    $type = $func->getDeclarationHeader()->getType();
    if (!$type is GenericTypeSpecifier) {
      return $name;
    }
    $type = $type->getClassType()->getCode();
    if (
      !Str\starts_with($head, 'test') &&
      $type === 'Awaitable' &&
      !Str\ends_with($head, '_async') &&
      !Str\ends_with($head, '_asyncx')
    ) {
      return ($suffix === null ? $head.'_async' : $head.'_async_'.$suffix);
    }
    return $name;
  }

  <<__Override>>
  final public function getSuggestedNameForInstanceMethod(
    string $name,
    MethodishDeclaration $meth,
  ): string {
    list($head, $suffix) = self::splitName($name);
    $type = $meth->getFunctionDeclHeader()->getType();
    if (!$type is GenericTypeSpecifier) {
      return $name;
    }
    $type = $type->getClassType()->getCode();
    if (
      !Str\starts_with($head, 'test') &&
      $type === 'Awaitable' &&
      !Str\ends_with($head, 'Async') &&
      !Str\ends_with($head, 'Asyncx')
    ) {
      return ($suffix === null ? $head.'Async' : $head.'Async'.$suffix);
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
