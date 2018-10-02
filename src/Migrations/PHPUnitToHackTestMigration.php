<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Migrations;

use namespace Facebook\HHAST;

use namespace HH\Lib\{C, Dict, Str, Vec};

final class PHPUnitToHackTestMigration extends StepBasedMigration {
  private function replaceTypeSpecifier(
    HHAST\SimpleTypeSpecifier $in,
  ): HHAST\SimpleTypeSpecifier {
    $name = $in->getDescendantsOfType(HHAST\EditableToken::class)
      |> Vec\map($$, $t ==> $t->getText())
      |> Str\join($$, '');
    if (
      $name !== "\\PHPUnit_Framework_TestCase" &&
      $name !== "\\PHPUnit\\Framework\\TestCase" &&
      $name !== "PHPUnit_Framework_TestCase" &&
      $name !== "PHPUnit\\Framework\\TestCase" &&
      $name !== "Facebook\\HackTest\\HackTestCase" &&
      $name !== "\\Facebook\\HackTest\\HackTestCase"
    ) {
      return $in;
    }

    $m = HHAST\Missing();
    $parts = Vec\concat(
      $name[0] === "\\" ? vec[new HHAST\BackslashToken($m, $m)] : vec[],
      vec[
        new HHAST\NameToken($m, $m, "Facebook"),
        new HHAST\BackslashToken($m, $m),
        new HHAST\NameToken($m, $m, "HackTest"),
        new HHAST\BackslashToken($m, $m),
        new HHAST\NameToken($m, $m, "HackTest"),
      ],
    );

    $parts[0] = $parts[0]->withLeading($in->getFirstTokenx()->getLeading());
    $last_idx = C\count($parts) - 1;
    $parts[$last_idx] =
      $parts[$last_idx]->withTrailing($in->getLastTokenx()->getTrailing());
    return $in->withSpecifier(
      new HHAST\QualifiedName(new HHAST\EditableList($parts)),
    );
  }

  final private function rewriteMarkTestCalls(
    HHAST\FunctionCallExpression $in,
  ): HHAST\FunctionCallExpression {
    $receiver = $in->getReceiver();
    if (!$receiver is HHAST\MemberSelectionExpression) {
      return $in;
    }

    $name = $receiver->getName();
    $name = ($name ?as HHAST\NameToken)?->getText();
    if ($name !== 'markTestIncomplete' && $name !== 'markTestSkipped') {
      return $in;
    }

    $obj = $receiver->getObject();
    if (!$obj is HHAST\VariableExpression) {
      return $in;
    }

    $var = $obj->getExpression() as HHAST\VariableToken;
    if ($var->getText() !== '$this') {
      return $in;
    }

    $m = HHAST\Missing();
    return $receiver->withObject(
      new HHAST\StaticToken($obj->getFirstTokenx()->getLeading(), $m),
    )
      ->withOperator(new HHAST\ColonColonToken($m, $m))
      |> $in->withReceiver($$);
  }

  private function migrateDataProvider(
    HHAST\MethodishDeclaration $decl,
  ): HHAST\MethodishDeclaration {
    $leading = $decl->getFirstTokenx()->getLeading();
    if ($leading->isMissing()) {
      return $decl;
    }
    if ($leading is HHAST\EditableList<_>) {
      $leading = $leading->getItemsOfType(HHAST\DelimitedComment::class);
    } else if ($leading is HHAST\DelimitedComment) {
      $leading = vec[$leading];
    } else {
      return $decl;
    }

    $doc_comments =
      Vec\filter($leading, $c ==> Str\starts_with($c->getText(), '/**'));
    if (C\count($doc_comments) !== 1) {
      return $decl;
    }

    $comment = C\onlyx($doc_comments);
    $comment_text = $comment->getText();
    $matches = [];
    \preg_match(
      '/^[\/\s*]*@dataprovider (?<func>[a-zA-Z0-9]+)[ *\/]*$/mi',
      $comment_text,
      &$matches,
    );

    $provider = $matches['func'] ?? null;
    if ($provider === null) {
      return $decl;
    }

    $comment_text = $comment_text
      |> Str\split($$, "\n")
      |> Vec\filter($$, $line ==> !Str\contains_ci($line, '@dataprovider'))
      |> Str\join($$, "\n");
    if (\preg_match('/^[\/*\s]*$/', $comment_text) === 1) {
      $comment_text = null;
    }

    $attr = new HHAST\Attribute(
      new HHAST\NameToken(HHAST\Missing(), HHAST\Missing(), "DataProvider"),
      new HHAST\LeftParenToken(HHAST\Missing(), HHAST\Missing()),
      new HHAST\EditableList(vec[new HHAST\SingleQuotedStringLiteralToken(
        HHAST\Missing(),
        HHAST\Missing(),
        "'".$provider."'",
      )]),
      new HHAST\RightParenToken(HHAST\Missing(), HHAST\Missing()),
    );

    $attrs = $decl->getAttribute();
    if ($attrs === null) {
      if ($comment_text !== null) {
        $leading =
          ($decl->getFirstTokenx()->getLeading() as HHAST\EditableList<_>)
            ->replace($comment, $comment->withText($comment_text));
      } else {
        $leading = vec[];
        foreach (
          ($decl->getFirstTokenx()->getLeading() as HHAST\EditableList<_>)
            ->getItems() as $item
        ) {
          if ($item === $comment) {
            break;
          }
          $leading[] = $item as HHAST\EditableTrivia;
        }
        $leading =
          HHAST\EditableList::fromItems($this->trimWhitespace($leading));
      }
      $decl = $decl->replace($comment, HHAST\Missing());
      $attrs = new HHAST\AttributeSpecification(
        new HHAST\LessThanLessThanToken($leading, HHAST\Missing()),
        HHAST\EditableList::fromItems(vec[$attr]),
        new HHAST\GreaterThanGreaterThanToken(HHAST\Missing(), HHAST\Missing()),
      );
    } else {
      $decl->replace(
        $comment,
        $comment_text === null
          ? HHAST\Missing()
          : $comment->withText($comment_text),
      );
      $attrs = $attrs->withAttributes(
        new HHAST\EditableList(
          Vec\concat(
            $attrs->getAttributesx()->getChildren(),
            vec[new HHAST\ListItem(
              $attr,
              new HHAST\CommaToken(HHAST\Missing(), new HHAST\WhiteSpace(' ')),
            )],
          ),
        ),
      );
    }

    $decl = $decl->withAttribute($attrs);
    $first = $decl->getFunctionDeclHeader()->getFirstTokenx();
    $leading = ($first->getLeading() as HHAST\EditableList<_>)->getItems()
      |> Vec\map($$, $n ==> $n as HHAST\EditableNode);
    return $decl->replace(
      $first,
      $first->withLeading(
        HHAST\EditableList::fromItems($this->trimWhitespace($leading)),
      ),
    );
  }

  private function trimWhitespace(
    vec<HHAST\EditableNode> $leading,
  ): vec<HHAST\EditableNode> {
    $saved = vec[];
    $whitespace = vec[];
    foreach ($leading as $item) {
      if ($item is HHAST\EndOfLine) {
        $whitespace = vec[];
        if (
          C\every(
            $saved,
            $s ==> $s is HHAST\WhiteSpace || $s is HHAST\EndOfLine,
          )
        ) {
          $saved = vec[$item];
        } else {
          $saved[] = $item;
        }
        continue;
      } else if ($item is HHAST\WhiteSpace) {
        $whitespace[] = $item;
        continue;
      }
      $saved = Vec\concat($saved, $whitespace);
      $whitespace = vec[];
      $saved[] = $item;
    }
    return Vec\concat($saved, $whitespace);
  }

  final private function replaceUsedTypes(HHAST\Script $script): HHAST\Script {
    $uses = HHAST\__Private\Resolution\get_uses_directly_in_scope(
      $script->getDeclarations(),
    )['types']
      |> Dict\filter(
        $$,
        $resolved ==> $resolved === 'PHPUnit_Framework_TestCase' ||
          $resolved === 'PHPUnit\\Framework\\TestCase' ||
          $resolved === 'Facebook\\HackTest\\HackTestCase',
      );
    if (C\is_empty($uses)) {
      return $script;
    }

    return $script->rewriteDescendants(
      ($node, $_p) ==> {
        if (!$node is HHAST\ClassishDeclaration) {
          return $node;
        }
        $extends = $node->getExtendsList()?->getItems();
        if ($extends === null) {
          return $node;
        }

        if (C\count($extends) !== 1) {
          // interface
          return $node;
        }
        $extends = C\onlyx($extends);
        if (!$extends is HHAST\SimpleTypeSpecifier) {
          return $node;
        }
        $extends = $extends->getSpecifierx();
        if (!$extends is HHAST\NameToken) {
          return $node;
        }

        if (!C\contains_key($uses, $extends->getText())) {
          return $node;
        }

        return $node->replace($extends, $extends->withText('HackTest'));
      },
    );
  }

  private function getQualifiedNameForHackTest(): HHAST\QualifiedName {
    $m = HHAST\Missing();
    return new HHAST\QualifiedName(
      new HHAST\EditableList(
        vec[
          new HHAST\NameToken($m, $m, "Facebook"),
          new HHAST\BackslashToken($m, $m),
          new HHAST\NameToken($m, $m, "HackTest"),
          new HHAST\BackslashToken($m, $m),
          new HHAST\NameToken($m, $m, "HackTest"),
        ],
      ),
    );

  }

  private function replaceUseClause(
    HHAST\NamespaceUseClause $node,
  ): HHAST\NamespaceUseClause {
    $what = $node->getName();
    if ($what is HHAST\NameToken) {
      if ($what->getText() !== "PHPUnit_Framework_TestCase") {
        return $node;
      }
      return $node->withName($this->getQualifiedNameForHackTest());
    }

    if (!$what is HHAST\QualifiedName) {
      return $node;
    }

    $text = $what->getDescendantsOfType(HHAST\EditableToken::class)
      |> Vec\map($$, $t ==> $t->getText())
      |> Str\join($$, '')
      |> Str\strip_prefix($$, '\\');
    if (
      $text !== 'PHPUnit_Framework_TestCase' &&
      $text !== 'PHPUnit\\Framework\\TestCase' &&
      $text !== 'Facebook\\HackTest\\HackTestCase'
    ) {
      return $node;
    }
    return $node->withName($this->getQualifiedNameForHackTest());
  }

  private function renameSetUpTearDownFunctions(
    HHAST\FunctionDeclarationHeader $node,
  ): HHAST\FunctionDeclarationHeader {
    $name = ($node->getNamex() ?as HHAST\NameToken)?->getText();
    if ($name === null) {
      return $node;
    }

    $names = dict[
      'setup' => 'beforeEachTestAsync',
      'teardown' => 'afterEachTestAsync',
      'setupbeforeclass' => 'beforeFirstTestAsync',
      'teardownafterclass' => 'afterLastTestAsync',
    ];
    $new_name = $names[Str\lowercase($name)] ?? null;
    if ($new_name === null) {
      return $node;
    }
    $leading = $node->getFirstTokenx()->getLeading();
    $new_modifiers = Vec\map(
      $node->getModifiers()?->getItems() ?? vec[],
      $m ==> {
        if ($m is HHAST\PrivateToken || $m is HHAST\ProtectedToken) {
          return
            new HHAST\PublicToken(HHAST\Missing(), new HHAST\WhiteSpace(' '));
        }
        return ($m as HHAST\EditableToken)->withLeading(HHAST\Missing())
          ->withTrailing(new HHAST\WhiteSpace(' '));
      },
    );
    $new_modifiers[] =
      new HHAST\AsyncToken(HHAST\Missing(), new HHAST\WhiteSpace(' '));
    $new_modifiers[0] = $new_modifiers[0]->withLeading($leading);

    $type = $node->getType();
    if ($type === null) {
      $node = $node
        ->withRightParen($node->getRightParenx()->withTrailing(HHAST\Missing()))
        ->withColon(
          new HHAST\ColonToken(HHAST\Missing(), new HHAST\WhiteSpace(' ')),
        )
        ->withType(
          new HHAST\GenericTypeSpecifier(
            new HHAST\NameToken(HHAST\Missing(), HHAST\Missing(), 'Awaitable'),
            new HHAST\TypeArguments(
              new HHAST\LessThanToken(HHAST\Missing(), HHAST\Missing()),
              HHAST\EditableList::fromItems(vec[
                new HHAST\VoidToken(HHAST\Missing(), HHAST\Missing()),
              ]),
              new HHAST\GreaterThanToken(
                HHAST\Missing(),
                $node->getRightParenx()->getTrailing(),
              ),
            ),
          ),
        );
    } else {
      $node = $node->withType(
        new HHAST\GenericTypeSpecifier(
          new HHAST\NameToken(
            $type->getFirstTokenx()->getLeading(),
            HHAST\Missing(),
            'Awaitable',
          ),
          new HHAST\TypeArguments(
            new HHAST\LessThanToken(HHAST\Missing(), HHAST\Missing()),
            HHAST\EditableList::fromItems(vec[
              $type
                ->replace(
                  $type->getFirstTokenx(),
                  $type->getFirstTokenx()->withLeading(HHAST\Missing()),
                )
                ->replace(
                  $type->getLastTokenx(),
                  $type->getLastTokenx()->withTrailing(HHAST\Missing()),
                ),
            ]),
            new HHAST\GreaterThanToken(
              HHAST\Missing(),
              $type->getLastTokenx()->getTrailing(),
            ),
          ),
        ),
      );
    }

    return $node->withName(
      new HHAST\NameToken(
        $node->getNamex()->getLeading(),
        $node->getNamex()->getTrailing(),
        $new_name,
      ),
    )
      ->withModifiers(new HHAST\EditableList($new_modifiers));
  }

  final private function migrateExpectException(
    HHAST\MethodishDeclaration $node,
  ): HHAST\MethodishDeclaration {
    $body = $node->getFunctionBody()?->getStatements()?->getItems();
    if ($body === null) {
      return $node;
    }

    $indent = (
      C\lastx(
        (
          $node->getFunctionDeclHeader()
            ->getFirstTokenx()
            ->getLeading() as HHAST\EditableList<_>
        )->getItems(),
      ) as HHAST\EditableTrivia
    )->getText();
    $new = $this->migrateExpectExceptionInStatements($body, $indent);
    if ($new === $body) {
      return $node;
    }

    return $node->withFunctionBody(
      $node->getFunctionBodyx()
        ->withStatements(new HHAST\EditableList($new)),
    );
  }

  final private function migrateExpectExceptionInStatements(
    vec<HHAST\EditableNode> $statements,
    string $indent,
  ): vec<HHAST\EditableNode> {
    $idx = C\find_key(
      $statements,
      $n ==> {
        if (!$n is HHAST\ExpressionStatement) {
          return false;
        }
        $n = $n->getExpression();

        if (!$n is HHAST\FunctionCallExpression) {
          return false;
        }

        $r = $n->getReceiver();
        if (!$r is HHAST\MemberSelectionExpression) {
          return false;
        }

        $var = ($r->getObject() ?as HHAST\VariableExpression)
          ?->getExpression() ?as HHAST\VariableToken;
        if ($var?->getText() !== '$this') {
          return false;
        }

        $n = $r->getNamex() ?as HHAST\NameToken;
        if ($n?->getText() !== 'expectException') {
          return false;
        }

        return true;
      },
    );

    if ($idx === null) {
      return $statements;
    }

    $pre = Vec\take($statements, $idx);
    $expect_exception =
      ($statements[$idx] as HHAST\ExpressionStatement)->getExpressionx() as
        HHAST\FunctionCallExpression;
    $inner = Vec\drop($statements, $idx + 1)
      |> Vec\map(
        $$,
        $statement ==> {
          $t = $statement->getFirstTokenx();
          return $statement->replace(
            $t,
            $t->withLeading(
              new HHAST\EditableList(vec[
                $t->getLeading(),
                new HHAST\WhiteSpace($indent),
              ]),
            ),
          );
        },
      )
      |> $this->migrateExpectExceptionInStatements($$, $indent);

    $m = HHAST\Missing();
    $expect_call = new HHAST\FunctionCallExpression(
      new HHAST\NameToken(
        $expect_exception->getFirstTokenx()->getLeading(),
        $m,
        'expect',
      ),
      new HHAST\LeftParenToken($m, $m),
      new HHAST\LambdaExpression(
        /* attrs = */ $m,
        /* async = */ $m,
        /* coroutine = */ $m,
        new HHAST\LambdaSignature(
          new HHAST\LeftParenToken($m, $m),
          /* parameters = */ $m,
          new HHAST\RightParenToken($m, new HHAST\WhiteSpace(' ')),
          /* colon = */ $m,
          /* type = */ $m,
        ),
        new HHAST\EqualEqualGreaterThanToken($m, new HHAST\WhiteSpace(' ')),
        new HHAST\CompoundStatement(
          new HHAST\LeftBraceToken($m, new HHAST\EndOfLine("\n")),
          new HHAST\EditableList($inner),
          new HHAST\RightBraceToken(
            $expect_exception->getFirstTokenx()->getLeading(),
            $m,
          ),
        ),
      ),
      new HHAST\RightParenToken($m, $m),
    );

    $expectation = new HHAST\FunctionCallExpression(
      new HHAST\MemberSelectionExpression(
        $expect_call,
        new HHAST\MinusGreaterThanToken($m, $m),
        new HHAST\NameToken($m, $m, 'toThrow'),
      ),
      new HHAST\LeftParenToken($m, $m),
      $expect_exception->getArgumentList() ?? $m,
      new HHAST\RightParenToken($m, $m),
    );

    $new = $pre;
    $new[] = new HHAST\ExpressionStatement(
      $expectation,
      new HHAST\SemicolonToken($m, new HHAST\EndOfLine("\n")),
    );

    // In theory, there should be a 'return' at the end of the statement - but
    // given we've wrapped up the entire remainder of the body into the lambda,
    // it does no difference
    return $new;
  }

  <<__Override>>
  final public function getSteps(): Traversable<IMigrationStep> {
    return Vec\concat(
      (new HHAST\Migrations\AssertToExpectMigration($this->getRoot()))
        ->getSteps(),
      $this->getUniqueSteps(),
    );
  }

  private function getUniqueSteps(): vec<IMigrationStep> {
    return vec[
      new TypedMigrationStep(
        'replace base class references via use statements',
        HHAST\Script::class,
        HHAST\Script::class,
        $node ==> $this->replaceUsedTypes($node),
      ),
      new TypedMigrationStep(
        'replace use clauses',
        HHAST\NamespaceUseClause::class,
        HHAST\NamespaceUseClause::class,
        $node ==> $this->replaceUseClause($node),
      ),
      new TypedMigrationStep(
        'replace direct base class references to new name',
        HHAST\SimpleTypeSpecifier::class,
        HHAST\SimpleTypeSpecifier::class,
        $node ==> $this->replaceTypeSpecifier($node),
      ),
      new TypedMigrationStep(
        'rename setup/teardown functions',
        HHAST\FunctionDeclarationHeader::class,
        HHAST\FunctionDeclarationHeader::class,
        $node ==> $this->renameSetUpTearDownFunctions($node),
      ),
      new TypedMigrationStep(
        'replace `$this->markTestFoo` with static calls',
        HHAST\FunctionCallExpression::class,
        HHAST\FunctionCallExpression::class,
        $node ==> $this->rewriteMarkTestCalls($node),
      ),
      new TypedMigrationStep(
        '@dataProvider to attribute',
        HHAST\MethodishDeclaration::class,
        HHAST\MethodishDeclaration::class,
        $node ==> $this->migrateDataProvider($node),
      ),
      new TypedMigrationStep(
        '$this->expectException() to expect()->toThrow()',
        HHAST\MethodishDeclaration::class,
        HHAST\MethodishDeclaration::class,
        $node ==> $this->migrateExpectException($node),
      ),
    ];
  }
}
