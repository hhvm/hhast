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
use function Facebook\HHAST\resolve_type;
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};

class MustUseOverrideAttributeLinter
extends AutoFixingASTLinter<MethodishDeclaration> {
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

    $super = C\onlyx($class->getExtendsListx()->getChildren());
    if ($super instanceof GenericTypeSpecifier) {
      $super = $super->getClassType();
    }
    $super = $super->getCode()
      |> Str\trim($$)
      |> resolve_type($$, $node, $parents);
    try {
      $method = $node->getFunctionDeclHeader()->getName()->getCode()
        |> Str\trim($$);

      $reflection_method = new \ReflectionMethod(
        $super,
        $method,
      );

      return new ASTLintError(
        $this,
        sprintf(
          '%s::%s() overrides %s::%s() without <<__Override>>',
          $class->getName()->getCode()
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
    MethodishDeclaration $method,
  ): bool {
    $name = $method->getFunctionDeclHeader()->getName();
    if ($name instanceof HHAST\ConstructToken) {
      return true;
    }

    if ($name instanceof HHAST\DestructToken) {
      return true;
    }

    if (!$class->getKeyword() instanceof ClassToken) {
      return true;
    }

    if (!$class->hasExtendsList()) {
      return true;
    }

    $attrs = $method->getAttribute();
    if ($attrs === null) {
      return false;
    }
    $attrs = $attrs->getAttributes()->getDescendantsOfType(
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
      $first_token = $node->getFirstTokenx();
      return $node->withAttribute(
        new AttributeSpecification(
          new HHAST\LessThanLessThanToken(
            $first_token->getLeading(),
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
              C\lastx($first_token->getLeading()->getChildren())->getCode(),
              "\n",
            ) ?  HHAST\Missing() : new HHAST\WhiteSpace("\n"),
          ),
        ),
      )->rewriteDescendants(
        ($n, $_) ==> $n === $first_token
          ? $first_token->withLeading(
            C\lastx($first_token->getLeading()->getChildren())
          )
          : $n
      );
    }

    $list = $attrs->getAttributes()->toVec();
    $list[] = new HHAST\NameToken(
      HHAST\Missing(),
      HHAST\Missing(),
      '__Override',
    );

    return $node->withAttribute(
      $attrs->withAttributes(
        new HHAST\EditableList($list),
      )->rewrite(
        ($child, $parents) ==> {
          if (!$child instanceof HHAST\ListItem) {
            return $child;
          }
          if (!$child->getItem() instanceof HHAST\Attribute) {
            return $child;
          }
          if ($child->hasSeparator()) {
            return $child;
          }
          return $child->withSeparator(
            new HHAST\CommaToken(
              HHAST\Missing(),
              new HHAST\WhiteSpace(' '),
            ),
          );
        }
      )
    );
  }
}
