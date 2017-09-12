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
  AttributeSpecification,
  ClassishDeclaration,
  ClassToken,
  EditableSyntax,
  GenericTypeSpecifier,
  MethodishDeclaration,
  SimpleTypeSpecifier
};
use type Facebook\TypeAssert\TypeAssert;
use function Facebook\HHAST\__Private\Resolution\resolve_type;
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};

class MustUseOverrideAttributeLinter
extends ASTLinter<MethodishDeclaration>
implements AutoFixingASTLinter<MethodishDeclaration> {
  protected static function getTargetType(): classname<MethodishDeclaration> {
    return MethodishDeclaration::class;
  }

  public function getLintErrorForNode(
    MethodishDeclaration $node,
    vec<EditableSyntax> $parents,
  ): ?ASTLintError<MethodishDeclaration, this> {
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
        $node
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

  public function getPrettyNode(
    MethodishDeclaration $node,
  ): MethodishDeclaration {
    $body = $node->getFunctionBody();
    if ($body === null) {
      return $node;
    }

    return $node->withFunctionBody(
      $body
        ->withStatements(HHAST\Missing())
        ->withRightBrace(HHAST\Missing())
        ->withLeftBrace($body->getLeftBracex()->withTrailing(HHAST\Missing()))
    );
  }

  public function getFixedNode(
    MethodishDeclaration $node,
  ): MethodishDeclaration {
    $attrs = $node->getAttribute();
    if ($attrs === null) {
      return $node->withAttribute(
        new AttributeSpecification(
          new HHAST\LessThanLessThanToken(
            $node->getFirstTokenx()->getLeading(),
            HHAST\Missing(),
          ),
          new HHAST\Attribute(
            new HHAST\NameToken(HHAST\Missing(), HHAST\Missing(), '__Override'),
            HHAST\Missing(),
            HHAST\Missing(),
            HHAST\Missing(),
          ),
          new HHAST\GreaterThanGreaterThanToken(
            HHAST\Missing(),
            Str\contains(
              $node->getFirstTokenx()->getLeading()->full_text(),
              "\n",
            ) ?  HHAST\Missing() : new HHAST\WhiteSpace("\n"),
          ),
        ),
      );
    }
    return $node;
  }
}
