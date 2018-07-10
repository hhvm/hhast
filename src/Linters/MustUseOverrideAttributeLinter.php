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
  Attribute,
  AttributeSpecification,
  ClassishDeclaration,
  ClassToken,
  EditableNode,
  GenericTypeSpecifier,
  ListItem,
  MethodishDeclaration,
  PrivateToken,
  SimpleTypeSpecifier,
};
use namespace Facebook\TypeAssert;
use function Facebook\HHAST\resolve_type;
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};

final class MustUseOverrideAttributeLinter
  extends AutoFixingASTLinter<MethodishDeclaration> {
  <<__Override>>
  protected static function getTargetType(): classname<MethodishDeclaration> {
    return MethodishDeclaration::class;
  }

  <<__Override>>
  public function getTitleForFix(LintError $_): string {
    return 'Add __Override attribute';
  }

  <<__Override>>
  public function getLintErrorForNode(
    MethodishDeclaration $node,
    vec<EditableNode> $parents,
  ): ?FixableASTLintError<MethodishDeclaration> {
    $class = $parents
      |> Vec\filter($$, $x ==> $x instanceof ClassishDeclaration)
      |> C\lastx($$)
      |> TypeAssert\instance_of(ClassishDeclaration::class, $$);

    if ($this->canIgnoreMethod($class, $node)) {
      return null;
    }

    $super = self::findSuper($class, $parents);
    try {
      $method = $node->getFunctionDeclHeader()->getName()->getCode()
        |> Str\trim($$);

      $reflection_method = new \ReflectionMethod($super, $method);

      return new FixableASTLintError(
        $this,
        Str\format(
          '%s::%s() overrides %s::%s() without <<__Override>>',
          $class->getName()->getCode()
          |> Str\trim($$)
          |> resolve_type($$, $node, $parents)
          |> TypeAssert\not_null($$),
          $method,
          $reflection_method->getDeclaringClass()->getName(),
          $method,
        ),
        $node,
      );
    } catch (\ReflectionException $e) {
      $method = $node->getFunctionDeclHeader()->getName()->getCode()
        |> Str\trim($$);
      return null;
    }
  }

  private static function findSuper(
    ClassishDeclaration $class,
    vec<EditableNode> $parents,
  ): string {
    $super = C\onlyx($class->getExtendsListx()->getChildren());
    if ($super instanceof ListItem) {
      $super = $super->getItem();
    }
    if ($super instanceof GenericTypeSpecifier) {
      $super = $super->getClassType();
    }
    return $super->getCode()
      |> Str\trim($$)
      |> resolve_type($$, $class, $parents)
      |> TypeAssert\not_null($$);
  }

  private function canIgnoreMethod(
    ClassishDeclaration $class,
    MethodishDeclaration $method,
  ): bool {
    if (!$class->hasExtendsKeyword()) {
      return true;
    }

    $name = $method->getFunctionDeclHeader()->getName();
    if ($name instanceof HHAST\ConstructToken) {
      return true;
    }

    if ($name instanceof HHAST\DestructToken) {
      return true;
    }

    $private = $method->getFunctionDeclHeader()
      ->getModifiersx()
      ->getDescendantsOfType(PrivateToken::class)
      |> C\first($$);
    if ($private !== null) {
      return true;
    }

    if (!$class->getKeyword() instanceof ClassToken) {
      return true;
    }

    $attrs = $method->getAttribute();
    if ($attrs === null) {
      return false;
    }
    $attrs = $attrs->getAttributes()->getDescendantsOfType(Attribute::class)
      |> Vec\map($$, $attr ==> $attr->getName()->getText());
    return C\contains($attrs, '__Override');
  }

  <<__Override>>
  public function getPrettyTextForNode(
    MethodishDeclaration $node,
    ?EditableNode $_context,
  ): string {
    $body = $node->getFunctionBody();
    if ($body === null) {
      return $node->getCode();
    }

    return $node->withFunctionBody(
      $body
        ->withStatements(HHAST\Missing())
        ->withRightBrace(HHAST\Missing())
        ->withLeftBrace($body->getLeftBracex()->withTrailing(HHAST\Missing())),
    )
      ->getCode();
  }

  <<__Override>>
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
            )
              ? HHAST\Missing()
              : new HHAST\WhiteSpace("\n"),
          ),
        ),
      )
        ->rewriteDescendants(
          ($n, $_) ==> $n === $first_token
            ? $first_token->withLeading(
              C\lastx($first_token->getLeading()->getChildren()),
            )
            : $n,
        );
    }

    $list = $attrs->getAttributes()->toVec();
    $list[] =
      new HHAST\NameToken(HHAST\Missing(), HHAST\Missing(), '__Override');

    return $node->withAttribute(
      $attrs->withAttributes(new HHAST\EditableList($list))
        ->rewrite(
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
              new HHAST\CommaToken(HHAST\Missing(), new HHAST\WhiteSpace(' ')),
            );
          },
        ),
    );
  }
}
