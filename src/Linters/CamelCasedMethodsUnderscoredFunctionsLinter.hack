/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\{FunctionDeclaration, MethodishDeclaration};
use namespace HH\Lib\{C, Str};

class CamelCasedMethodsUnderscoredFunctionsLinter extends FunctionNamingLinter {
  <<__Override>>
  final public function getSuggestedNameForFunction(
    string $name,
    FunctionDeclaration $func,
  ): string {
    list($head, $suffix) = self::splitName($name);
    if (\preg_match('/^[a-z0-9_]+$/', $head) === 1) {
      return $name;
    }

    // Allow camel-case if it's a factory function, e.g.
    //   function Missing(): Missing;
    $type = $func->getDeclarationHeader()->getType()?->getCode();
    if ($type !== null) {
      $type = $type
        |> Str\trim($$)
        |> Str\split($$, '<')
        |> C\firstx($$)
        |> Str\split($$, '\\')
        |> C\lastx($$);
      if ($type === $name) {
        return $name;
      }
    }

    return camel_case_to_snake_case($head)
      |> Str\lowercase($$)
      |> ($suffix === null ? $$ : $$.'_'.$suffix);
  }

  <<__Override>>
  final public function getSuggestedNameForInstanceMethod(
    string $name,
    MethodishDeclaration $_,
  ): string {
    list($head, $suffix) = self::splitName($name);
    if (\preg_match('/^[a-z][a-zA-Z0-9]+$/', $head) === 1) {
      return $name;
    }

    $_count = null;
    $name = \preg_replace_callback(
      '/_[a-z]/',
      $matches ==> Str\uppercase($matches[0][1]),
      $head,
      -1,
      inout $_count,
    )
      |> ($suffix === null ? $$ : $$.'_'.$suffix);
    $name[0] = Str\lowercase($name[0]);
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
    $suffixes = vec['UNTYPED', 'UNSAFE', 'DEPRECATED', 'DO_NOT_USE'];
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
