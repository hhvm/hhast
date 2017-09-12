<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  Attribute,
  ClassishDeclaration,
  ClassToken,
  EditableSyntax,
  GenericTypeSpecifier,
  MethodishDeclaration,
  SimpleTypeSpecifier
};
use type Facebook\TypeAssert\TypeAssert;
use function Facebook\HHAST\__Private\Resolution\resolve_type;
use namespace HH\Lib\{C, Str, Vec};

class MustUseOverrideAttributeLinter extends ASTLinter<MethodishDeclaration> {
  protected static function getTargetType(): classname<MethodishDeclaration> {
    return MethodishDeclaration::class;
  }

  public function getLintErrorForNode(
    MethodishDeclaration $node,
    vec<EditableSyntax> $parents,
  ): ?ASTLintError {
    $class = $parents
      |> Vec\filter($$, $x ==> $x instanceof ClassishDeclaration)
      |> C\lastx($$)
      |> TypeAssert::isInstanceOf(ClassishDeclaration::class, $$);

    if ($this->canIgnoreMethod($class, $node)) {
      return null;
    }

    $super = C\onlyx($class->getExtendsListx()->children());
    if ($super instanceof GenericTypeSpecifier) {
      $super = $super->getClassType();
    }
    $super = $super->full_text()
      |> Str\trim($$)
      |> resolve_type($$, $node, $parents);
    try {
      $method = $node->getFunctionDeclHeader()->getName()->full_text()
        |> Str\trim($$);

      $reflection_method = new \ReflectionMethod(
        $super,
        $method,
      );

      return new ASTLintError(
        $this,
        sprintf(
          '%s::%s() overrides %s::%s() without <<__Override>>',
          $class->getName()->full_text()
            |> Str\trim($$)
            |> resolve_type($$, $node, $parents),
          $method,
          $reflection_method->getDeclaringClass()->getName(),
          $method,
        ),
        $node,
      );
    } catch (\ReflectionException $_) {
      return null;
    }
  }

  private function canIgnoreMethod(
    ClassishDeclaration $class,
    MethodishDeclaration $node,
  ): bool {
    if (!$class->getKeyword() instanceof ClassToken) {
      return true;
    }

    if (!$class->hasExtendsList()) {
      return true;
    }

    $attrs = $node->getAttribute();
    if ($attrs === null) {
      return false;
    }
    $attrs = $attrs->getAttributes()->of_class(
      Attribute::class,
    ) |> Vec\map(
      $$,
      $attr ==> $attr->getName()->getText(),
    );
    return C\contains($attrs, '__Override');
  }
}
