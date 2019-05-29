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
    $name = $in->getDescendantsOfType(HHAST\Token::class)
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
      new HHAST\QualifiedName(HHAST\NodeList::createNonEmptyListOrMissing($parts)),
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

  private function getAndRemoveDocTag<T as HHAST\Node>(
    T $in,
    string $doc_tag,
  ): ?(HHAST\DelimitedComment, ?string, string) {
    $leading = $in->getFirstTokenx()->getLeading();
    if ($leading->isMissing()) {
      return null;
    }
    if ($leading is HHAST\NodeList<_>) {
      $leading = $leading->getChildrenOfType(HHAST\DelimitedComment::class);
    } else if ($leading is HHAST\DelimitedComment) {
      $leading = vec[$leading];
    } else {
      return null;
    }

    $doc_comments =
      Vec\filter($leading, $c ==> Str\starts_with($c->getText(), '/**'));
    if (C\count($doc_comments) !== 1) {
      return null;
    }

    $comment = C\onlyx($doc_comments);
    $comment_text = $comment->getText();
    $matches = [];
    \preg_match(
      '/^[\/\s*]*'.\preg_quote($doc_tag, '/').' (?<value>[^\\s]+)[ *\/]*$/mi',
      $comment_text,
      &$matches,
    );

    $result = $matches['value'] ?? null;
    if ($result === null) {
      return null;
    }


    $comment_text = $comment_text
      |> Str\split($$, "\n")
      |> Vec\filter($$, $line ==> !Str\contains_ci($line, $doc_tag))
      |> Str\join($$, "\n");
    if (\preg_match('/^[\/*\s]*$/', $comment_text) === 1) {
      return tuple($comment, null, $result);
    }
    return tuple($comment, $comment_text, $result);
  }

  private function migrateDataProvider(
    HHAST\MethodishDeclaration $decl,
  ): HHAST\MethodishDeclaration {
    $new = $this->getAndRemoveDocTag($decl, '@dataProvider');
    if ($new === null) {
      return $decl;
    }
    list($comment, $comment_text, $provider) = $new;

    $attr = new HHAST\ConstructorCall(
      new HHAST\NameToken(HHAST\Missing(), HHAST\Missing(), "DataProvider"),
      new HHAST\LeftParenToken(HHAST\Missing(), HHAST\Missing()),
      HHAST\NodeList::createNonEmptyListOrMissing(vec[new HHAST\SingleQuotedStringLiteralToken(
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
          ($decl->getFirstTokenx()->getLeading() as HHAST\NodeList<_>)
            ->replace($comment, $comment->withText($comment_text));
      } else {
        $leading = vec[];
        foreach (
          ($decl->getFirstTokenx()->getLeading() as HHAST\NodeList<_>)
            ->getChildren() as $item
        ) {
          if ($item === $comment) {
            break;
          }
          $leading[] = $item as HHAST\Trivia;
        }
        $leading =
          HHAST\NodeList::createNonEmptyListOrMissing($this->trimWhitespace($leading));
      }
      $decl = $decl->replace($comment, HHAST\Missing());
      $attrs = new HHAST\AttributeSpecification(
        new HHAST\LessThanLessThanToken($leading, HHAST\Missing()),
        HHAST\NodeList::createNonEmptyListOrMissing(vec[$attr]),
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
        HHAST\NodeList::createNonEmptyListOrMissing(
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
    $leading = ($first->getLeading() as HHAST\NodeList<_>)->getChildren()
      |> Vec\map($$, $n ==> $n as HHAST\Node);
    return $decl->replace(
      $first,
      $first->withLeading(
        HHAST\NodeList::createNonEmptyListOrMissing($this->trimWhitespace($leading)),
      ),
    );
  }

  private function trimWhitespace(
    vec<HHAST\Node> $leading,
  ): vec<HHAST\Node> {
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
      HHAST\NodeList::createNonEmptyListOrMissing(
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

    $text = $what->getDescendantsOfType(HHAST\Token::class)
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
      $node->getModifiers()?->getChildren() ?? vec[],
      $m ==> {
        if ($m is HHAST\PrivateToken || $m is HHAST\ProtectedToken) {
          return
            new HHAST\PublicToken(HHAST\Missing(), new HHAST\WhiteSpace(' '));
        }
        return ($m as HHAST\Token)->withLeading(HHAST\Missing())
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
              HHAST\NodeList::createNonEmptyListOrMissing(vec[
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
            HHAST\NodeList::createNonEmptyListOrMissing(vec[
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
      ->withModifiers(HHAST\NodeList::createNonEmptyListOrMissing($new_modifiers));
  }

  final private function migrateExpectedExceptionAttribute(
    HHAST\MethodishDeclaration $node,
  ): HHAST\MethodishDeclaration {
    $match = $this->getAndRemoveDocTag($node, '@expectedException');
    if ($match === null) {
      return $node;
    }
    list($comment, $comment_text, $exception) = $match;
    $body = $node->getFunctionBody()?->getStatements()?->getChildren();
    if ($body === null) {
      return $node;
    }
    if (C\is_empty($body)) {
      return $node;
    }

    $m = HHAST\Missing();
    $body = Vec\concat(
      vec[
        new HHAST\ExpressionStatement(
          new HHAST\FunctionCallExpression(
            new HHAST\MemberSelectionExpression(
              new HHAST\VariableExpression(
                new HHAST\VariableToken(
                  C\firstx($body)->getFirstTokenx()->getLeadingWhitespace(),
                  $m,
                  '$this',
                ),
              ),
              new HHAST\MinusGreaterThanToken($m, $m),
              new HHAST\NameToken($m, $m, 'expectException'),
            ),
            HHAST\Missing(),
            new HHAST\LeftParenToken($m, $m),
            HHAST\NodeList::createNonEmptyListOrMissing(vec[
              new HHAST\NameToken(
                $m,
                $m,
                Str\ends_with($exception, '::class')
                  ? $exception
                  : ($exception.'::class'),
              ),
            ]),
            new HHAST\RightParenToken($m, $m),
          ),
          new HHAST\SemicolonToken($m, new HHAST\EndOfLine("\n")),
        ),
      ],
      $body,
    );

    $node = $node->withFunctionBody(
      $node->getFunctionBodyx()
        ->withStatements(HHAST\NodeList::createNonEmptyListOrMissing($body)),
    );

    if ($comment_text !== null) {
      return $node->replace($comment, $comment->withText($comment_text));
    }

    $first = $node->getFirstTokenx();
    $leading = $first->getLeading();
    $items = ($leading is HHAST\NodeList<_>)
      ? Vec\map($leading->getChildren(), $it ==> $it as HHAST\Node)
      : vec[$leading];
    $idx = C\find_key($items, $it ==> $it === $comment) as nonnull;
    return $node->replace(
      $first,
      $first->withLeading(
        HHAST\NodeList::createNonEmptyListOrMissing(Vec\take($items, $idx)),
      ),
    );
  }

  final private function migrateExpectException(
    HHAST\MethodishDeclaration $node,
  ): HHAST\MethodishDeclaration {
    $body = $node->getFunctionBody()?->getStatements()?->getChildren();
    if ($body === null) {
      return $node;
    }
    if (C\is_empty($body)) {
      return $node;
    }

    $indent = $node->getFunctionDeclHeader()
      ->getFirstTokenx()
      ->getLeadingWhitespace()->getCode();

    $new = $this->migrateExpectExceptionInStatements($body, $indent);
    if ($new === $body) {
      return $node;
    }

    $ret = $node->withFunctionBody(
      $node->getFunctionBodyx()
        ->withStatements(HHAST\NodeList::createNonEmptyListOrMissing($new)),
    );
    return $ret;
  }

  final private function migrateExpectExceptionInStatements(
    vec<HHAST\Node> $statements,
    string $indent,
  ): vec<HHAST\Node> {
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

    $expect_exception =
      ($statements[$idx] as HHAST\ExpressionStatement)->getExpressionx() as
        HHAST\FunctionCallExpression;

    $pre = Vec\take($statements, $idx);
    $post = Vec\drop($statements, $idx + 1);
    if (C\is_empty($post)) {
      return $pre;
    }
    $expectation = $this->wrapStatementsInExpectException(
      $post,
      $expect_exception->getArgumentList() ?? HHAST\Missing(),
      $indent,
    );

    $new = $pre;
    $new[] = new HHAST\ExpressionStatement(
      $expectation,
      new HHAST\SemicolonToken(HHAST\Missing(), new HHAST\EndOfLine("\n")),
    );

    // In theory, there should be a 'return' at the end of the statement - but
    // given we've wrapped up the entire remainder of the body into the lambda,
    // it does no difference
    return $new;

  }

  private function wrapStatementsInExpectException(
    vec<HHAST\Node> $statements,
    HHAST\Node $exception,
    string $indent,
  ): HHAST\FunctionCallExpression {
    $inner = $statements
      |> Vec\map(
        $$,
        $statement ==> {
          $t = $statement->getFirstTokenx();
          return $statement->replace(
            $t,
            $t->withLeading(
              new HHAST\WhiteSpace($t->getLeadingWhitespace()->getCode().$indent),
            ),
          );
        },
      )
      |> $this->migrateExpectExceptionInStatements($$, $indent);

    $new_line_leading = HHAST\NodeList::createNonEmptyListOrMissing(vec[
      C\first($statements)?->getFirstToken()?->getLeadingWhitespace() ??
        new HHAST\WhiteSpace($indent.$indent),
    ]);

    $a = HHAST\NodeList::createNonEmptyListOrMissing($statements);
    $b = HHAST\NodeList::createNonEmptyListOrMissing($inner);
    invariant($a->getCode() !== $b->getCode(), 'idempotency problem');

    $m = HHAST\Missing();
    $expect_call = new HHAST\FunctionCallExpression(
      new HHAST\NameToken($new_line_leading, $m, 'expect'),
      HHAST\Missing(),
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
          HHAST\NodeList::createNonEmptyListOrMissing($inner),
          new HHAST\RightBraceToken($new_line_leading, $m),
        ),
      ),
      new HHAST\RightParenToken($m, $m),
    );

    return new HHAST\FunctionCallExpression(
      new HHAST\MemberSelectionExpression(
        $expect_call,
        new HHAST\MinusGreaterThanToken($m, $m),
        new HHAST\NameToken($m, $m, 'toThrow'),
      ),
       HHAST\Missing(),
      new HHAST\LeftParenToken($m, $m),
      $exception,
      new HHAST\RightParenToken($m, $m),
    );
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
        '@expectException to $this->expectException()',
        HHAST\MethodishDeclaration::class,
        HHAST\MethodishDeclaration::class,
        $node ==> $this->migrateExpectedExceptionAttribute($node),
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
