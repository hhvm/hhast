/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use function Facebook\HHAST\resolve_type;
use namespace HH\Lib\{C, Str, Vec};

final class MustUseOverrideAttributeLinter extends AutoFixingASTLinter {
  const type TNode = MethodishDeclaration;

  <<__Override>>
  public function getTitleForFix(LintError $_): string {
    return 'Add __Override attribute';
  }

  const type TContext = ClassishDeclaration;

  <<__Override>>
  public function getLintErrorForNode(
    ClassishDeclaration $class,
    MethodishDeclaration $node,
  ): ?ASTLintError {
    if ($this->canIgnoreMethod($class, $node)) {
      return null;
    }

    $root = $this->getAST();
    $super = self::findSuper($root, $class);
    try {
      $method = $node->getFunctionDeclHeader()->getName()->getCode()
        |> Str\trim($$);

      $reflection_method = new \ReflectionMethod($super, $method);

      return new ASTLintError(
        $this,
        Str\format(
          '%s::%s() overrides %s::%s() without <<__Override>>',
          $class->getNamex()->getCode()
            |> Str\trim($$)
            |> resolve_type($$, $root, $node)['name'],
          $method,
          $reflection_method->getDeclaringClass()->getName(),
          $method,
        ),
        $node,
        () ==> $this->getFixedNode($node),
      );
    } catch (\ReflectionException $e) {
      $method = $node->getFunctionDeclHeader()->getName()->getCode()
        |> Str\trim($$);
      return null;
    }
  }

  private static function findSuper(
    Script $root,
    ClassishDeclaration $class,
  ): string {
    $super = C\onlyx($class->getExtendsListx()->getChildren());
    if ($super is ListItem<_>) {
      $super = $super->getItemx();
    }
    if ($super is GenericTypeSpecifier) {
      $super = $super->getClassType();
    }
    return $super->getCode()
      |> Str\trim($$)
      |> resolve_type($$, $root, $class)['name'];
  }

  private function canIgnoreMethod(
    ClassishDeclaration $class,
    MethodishDeclaration $method,
  ): bool {
    if (!$class->hasExtendsKeyword()) {
      return true;
    }

    $name = $method->getFunctionDeclHeader()->getName();
    if ($name is ConstructToken) {
      return true;
    }

    $private = $method->getFunctionDeclHeader()
      ->getModifiersx()
      ->getDescendantsOfType(PrivateToken::class)
      |> C\first($$);
    if ($private !== null) {
      return true;
    }

    if (!$class->getKeyword() is ClassToken) {
      return true;
    }

    $attrs = $method->getAttribute();
    if ($attrs === null) {
      return false;
    }
    $attrs = $attrs->getAttributes()->getChildrenOfItems()
      |> Vec\map($$, $attr ==> ($attr->getType() ?as NameToken)?->getText());
    return C\contains($attrs, '__Override');
  }

  <<__Override>>
  public function getPrettyTextForNode(MethodishDeclaration $node): string {
    $body = $node->getFunctionBody();
    if ($body === null) {
      return $node->getCode();
    }

    return $node->withFunctionBody(
      $body
        ->withStatements(null)
        ->withLeftBrace($body->getLeftBracex()->withTrailing(null)),
    )
      ->getCode()
      |> Str\trim_right($$, "} \n");
  }

  public function getFixedNode(
    MethodishDeclaration $node,
  ): MethodishDeclaration {
    $attrs = $node->getAttribute();
    if ($attrs === null) {
      $first_token = $node->getFirstTokenx();
      return $node->withAttribute(
        new OldAttributeSpecification(
          new LessThanLessThanToken($first_token->getLeading(), null),
          new ConstructorCall(
            new NameToken(null, null, '__Override'),
            null,
            null,
            null,
          )
            |> new NodeList(vec[new ListItem($$, null)]),
          new GreaterThanGreaterThanToken(
            null,
            Str\contains(
              C\lastx($first_token->getLeading()->getChildren())->getCode(),
              "\n",
            )
              ? null
              : new NodeList(vec[new WhiteSpace("\n")]),
          ),
        ),
      )
        ->replace(
          $first_token,
          $first_token->withLeading(
            new NodeList(
              vec[C\lastx($first_token->getLeading()->getChildren())],
            ),
          ),
        );
    }

    $list = $attrs->getAttributes()->toVec();
    $last_idx = C\count($list) - 1;
    $last = $list[$last_idx];
    if (!$last->hasSeparator()) {
      $list[$last_idx] = $last->withSeparator(
        new CommaToken(null, new NodeList(vec[new WhiteSpace(' ')])),
      );
    }
    $list[] = new ConstructorCall(
      new NameToken(null, null, '__Override'),
      null,
      null,
      null,
    )
      |> new ListItem($$, null);

    return $node->withAttribute($attrs->withAttributes(new NodeList($list)));
  }
}
