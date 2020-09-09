/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str, Vec};

final class AddXHPChildrenDeclarationMethodMigration
  extends StepBasedMigration {
  private static function scopeNeedsUseNamespace(NodeList<Node> $in): bool {
    if (
      Str\contains(
        $in->getCode(),
        'use namespace Facebook\\XHP\\ChildValidation as XHPChild;',
      )
    ) {
      return false;
    }
    $classes = $in->getChildrenOfType(ClassishDeclaration::class);
    return C\any(
      $classes,
      $class ==> !C\is_empty(
        $class->getBody()
          ->getElements()
          ?->getChildrenOfType(XHPChildrenDeclaration::class) ??
          vec[],
      ),
    );
  }

  private static function addUseNamespaceToScript(Script $in): Script {
    $decls = $in->getDeclarations();
    if (!self::scopeNeedsUseNamespace($decls)) {
      return $in;
    }

    $before = C\firstx($decls->getChildrenOfType(IDeclaration::class));
    $t = $before->getFirstTokenx();
    $use = self::getUseNamespace();
    if ($t->getLeading() !== $t->getLeadingWhitespace()) {
      $ut = $use->getFirstTokenx();
      return $in->withDeclarations(
        $in->getDeclarations()->insertBefore(
          $before,
          $use->replace($ut, $ut->withLeading($t->getLeading())),
        ),
      )
        ->replace($t, $t->withLeading(null));
    }
    return $in->withDeclarations(
      $decls->insertBefore($before, self::getUseNamespace()),
    );
  }

  private static function addUseNamespaceToNamespaceBlock(
    NamespaceDeclaration $in,
  ): NamespaceDeclaration {
    // Can't use XHP in namespaces, so if we're not in the root namespace,
    // we have nothing to do.
    if ($in->hasName()) {
      return $in;
    }

    // Don't have to worry about empty bodies as `namespace;` is invalid,
    // and `namespace foo;` is caught above.

    $body = $in->getBody() as NamespaceBody;
    $decls = $body->getDeclarationsx();
    if (!self::scopeNeedsUseNamespace($decls)) {
      return $in;
    }

    $use = self::getUseNamespace();
    $ws = $decls->getFirstTokenx()->getLeadingWhitespace();
    if ($ws !== null) {
      $t = $use->getFirstTokenx();
      $use = $use->replace($t, $t->withLeading(new NodeList(vec[$ws])));
    }

    return $in->withBody(
      $body->withDeclarations(
        $decls->insertBefore(
          C\firstx($decls->getChildrenOfType(IDeclaration::class)),
          $use,
        ),
      ),
    );
  }

  <<__Memoize>>
  private static function getUseNamespace(): NamespaceUseDeclaration {
    $s = new NodeList(vec[new WhiteSpace(' ')]);
    return new NamespaceUseDeclaration(
      new UseToken(null, $s),
      new NamespaceToken(null, $s),
      new NodeList(vec[new ListItem(
        new NamespaceUseClause(
          null,
          new QualifiedName(
            new NodeList(vec[
              new ListItem(
                new NameToken(null, null, 'Facebook'),
                new BackslashToken(null, null),
              ),
              new ListItem(
                new NameToken(null, null, 'XHP'),
                new BackslashToken(null, null),
              ),
              new ListItem(new NameToken(null, $s, 'ChildValidation'), null),
            ]),
          ),
          new AsToken(null, $s, 'as'),
          new NameToken(null, null, 'XHPChild'),
        ),
        null,
      )]),
      new SemicolonToken(
        null,
        new NodeList(vec[new EndOfLine("\n"), new EndOfLine("\n")]),
      ),
    );
  }

  private static function alreadyUsesTrait(ClassishBody $in): bool {
    $uses = $in->getElementsx()->getChildrenOfType(TraitUse::class)
      |> Vec\map($$, $use ==> $use->getNames()->getChildrenOfItems())
      |> Vec\flatten($$);
    foreach ($uses as $use) {
      $name = $use ?as SimpleTypeSpecifier
        |> $$?->getSpecifier() ?as NameToken
        |> $$?->getText();
      if (
        $name === 'XHPChildValidation' ||
        $name === 'XHPChildDeclarationConsistencyValidation'
      ) {
        return true;
      }
    }
    return false;
  }

  private static function addTrait(ClassishBody $in): ClassishBody {
    $decl = $in->getElements()
      ?->getChildrenOfType(XHPChildrenDeclaration::class) ??
      vec[];
    if (C\is_empty($decl)) {
      return $in;
    }
    if (self::alreadyUsesTrait($in)) {
      return $in;
    }

    $decl = C\firstx($decl);

    $indent = $decl->getFirstTokenx()->getLeadingWhitespace()?->getText() ?? '';
    $use = new TraitUse(
      new UseToken(
        new NodeList(vec[new WhiteSpace($indent)]),
        new NodeList(vec[new WhiteSpace(' ')]),
      ),
      new NodeList(vec[
        new ListItem(
          new SimpleTypeSpecifier(
            new NameToken(
              null,
              null,
              'XHPChildDeclarationConsistencyValidation',
            ),
          ),
          null,
        ),
      ]),
      new SemicolonToken(null, new NodeList(vec[new EndOfLine("\n")])),
    );

    return $in->withElements(
      $in->getElementsx()
        ->insertBefore(C\firstx($in->getElementsx()->toVec()), $use),
    );
  }

  private static function addChildrenDeclarationMethod(
    ClassishBody $in,
  ): ClassishBody {
    $decl = $in->getElements()
      ?->getChildrenOfType(XHPChildrenDeclaration::class) ??
      vec[];
    if (C\is_empty($decl)) {
      return $in;
    }
    foreach (
      $in->getElementsx()->getChildrenOfType(MethodishDeclaration::class) as
        $method
    ) {
      if (
        $method->getFunctionDeclHeader()->getName()->getText() ===
          'getChildrenDeclaration'
      ) {
        return $in;
      }
    }
    $decl = C\firstx($decl);

    $indent = $decl->getFirstTokenx()->getLeadingWhitespace()?->getText() ?? '';
    $s = new NodeList(vec[new WhiteSpace(' ')]);
    $meth = new MethodishDeclaration(
      null,
      self::getFunctionDeclarationHeader($indent),
      new CompoundStatement(
        new LeftBraceToken(null, new NodeList(vec[new EndOfLine("\n")])),
        new NodeList(vec[
          new ReturnStatement(
            new ReturnToken(
              new NodeList(vec[new WhiteSpace($indent.$indent)]),
              $s,
            ),
            self::convertChildrenExpression($decl->getExpression()),
            new SemicolonToken(null, new NodeList(vec[new EndOfLine("\n")])),
          ),
        ]),
        new RightBraceToken(
          new NodeList(vec[new WhiteSpace($indent)]),
          new NodeList(vec[
            new EndOfLine("\n"),
            new EndOfLine("\n"),
          ]),
        ),
      ),
      /* semicolon = */ null,
    );
    return $in->withElements($in->getElementsx()->insertAfter($decl, $meth));
  }

  <<__Memoize>>
  private static function getFunctionDeclarationHeader(
    string $leading_whitespace,
  ): FunctionDeclarationHeader {
    $s = new NodeList(vec[new WhiteSpace(' ')]);
    return new FunctionDeclarationHeader(
      new NodeList(vec[
        new ProtectedToken(
          new NodeList(
            vec[new EndOfLine("\n"), new WhiteSpace($leading_whitespace)],
          ),
          $s,
        ),
        new StaticToken(null, $s),
      ]),
      new FunctionToken(null, $s),
      new NameToken(null, null, 'getChildrenDeclaration'),
      null,
      new LeftParenToken(null, null),
      null,
      new RightParenToken(null, null),
      new ColonToken(null, $s),
      null,
      new SimpleTypeSpecifier(
        new QualifiedName(
          new NodeList(vec[
            new ListItem(
              new NameToken(null, null, 'XHPChild'),
              new BackslashToken(null, null),
            ),
            new ListItem(new NameToken(null, $s, 'Constraint'), null),
          ]),
        ),
      ),
      null,
    );
  }

  private static function convertChildrenExpression(
    Node $in,
  ): FunctionCallExpression {
    if ($in is XHPChildrenParenthesizedList) {
      $count = $in->getXhpChildren()->getCount();
      invariant($count >= 1, 'Got empty XHP children parenthesized list');
      if ($count === 1) {
        return self::convertChildrenExpression(
          C\onlyx($in->getXhpChildren()->getChildrenOfItems()),
        );
      }
      $children = Vec\map(
        $in->getXhpChildren()->getChildrenOfItems(),
        $node ==> self::convertChildrenExpression($node),
      );
      return self::makeCall('sequence', null, $children);
    }

    if ($in is PostfixUnaryExpression) {
      $op = $in->getOperator();
      if ($op is PlusToken) {
        $fun = 'atLeastOneOf';
      } else if ($op is QuestionToken) {
        $fun = 'optional';
      } else if ($op is StarToken) {
        $fun = 'anyNumberOf';
      } else {
        invariant_violation(
          "Got an XHP postfix unary expression with unexpected operator '%s'",
          $in->getOperator()->getText(),
        );
      }
      return self::makeCall(
        $fun,
        null,
        vec[self::convertChildrenExpression($in->getOperand())],
      );
    }

    if ($in is BinaryExpression) {
      // foo | bar | baz
      invariant(
        $in->getOperator() is BarToken,
        "Got an XHP child binary expression with unexpected operator '%s'",
        $in->getOperator()->getText(),
      );
      // `foo | bar | baz` is `((foo | bar) | baz)` in the AST; flatten them out
      // for readability
      $next = $in;
      $parts = vec[];
      while ($next is BinaryExpression && $next->getOperator() is BarToken) {
        $parts[] = $next->getRightOperand();
        $next = $next->getLeftOperand();
      }
      $parts[] = $next;
      $parts = Vec\reverse($parts)
        |> Vec\map($$, $part ==> self::convertChildrenExpression($part));
      return self::makeCall('anyOf', null, $parts);
    }

    if ($in is NameExpression || $in is EmptyToken || $in is NameToken) {
      $name = $in is NameExpression ? $in->getWrappedNode() : $in;
      if (
        $name is NameToken || $name is EmptyToken || $name is XHPClassNameToken
      ) {
        $name = $name->getText();
        if ($name === 'pcdata' || $name === 'empty' || $name === 'any') {
          return self::makeCall($name);
        }

        // Class name
        return self::makeCall(
          'ofType',
          new TypeArguments(
            new LessThanToken(null, null),
            new NodeList(vec[
              new ListItem(
                new SimpleTypeSpecifier(new NameToken(null, null, $name)),
                null,
              ),
            ]),
            new GreaterThanToken(null, null),
          ),
        );
      }

      if ($name is XHPCategoryNameToken) {
        return self::makeCall('category', null, vec[new LiteralExpression(
          new SingleQuotedStringLiteralToken(
            null,
            null,
            "'".$name->getText()."'",
          ),
        )]);
      }

      invariant_violation(
        'Unhandled XHP child name type: %s',
        \get_class($name),
      );
    }

    invariant_violation(
      'Unhandled XHP children expression: %s (%s)',
      \get_class($in),
      $in->getCode(),
    );
  }

  private static function makeCall(
    string $name,
    ?TypeArguments $generics = null,
    vec<IExpression> $arguments = vec[],
  ): FunctionCallExpression {
    $sep = C\count($arguments) > 1
      ? new CommaToken(null, new NodeList(vec[new WhiteSpace(' ')]))
      : null;
    return new FunctionCallExpression(
      new QualifiedName(
        new NodeList(vec[
          new ListItem(
            new NameToken(null, null, 'XHPChild'),
            new BackslashToken(null, null),
          ),
          new ListItem(new NameToken(null, null, $name), null),
        ]),
      ),
      $generics,
      new LeftParenToken(null, null),
      C\is_empty($arguments)
        ? null
        : new NodeList(Vec\map($arguments, $arg ==> new ListItem($arg, $sep))),
      new RightParenToken(null, null),
    );
  }

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new TypedMigrationStep(
        'Add `use` statement to top level of file if needed',
        Script::class,
        Script::class,
        $node ==> self::addUseNamespaceToScript($node),
      ),
      new TypedMigrationStep(
        'Add `use` statement to namespace blocks as needed',
        NamespaceDeclaration::class,
        NamespaceDeclaration::class,
        $node ==> self::addUseNamespaceToNamespaceBlock($node),
      ),
      new TypedMigrationStep(
        'Add `getChildrenDeclaration()` method',
        ClassishBody::class,
        ClassishBody::class,
        $node ==> self::addChildrenDeclarationMethod($node),
      ),
      new TypedMigrationStep(
        'Add `XHPChildDeclarationConsistencyValidation` trait',
        ClassishBody::class,
        ClassishBody::class,
        $node ==> self::addTrait($node),
      ),
    ];
  }
}
