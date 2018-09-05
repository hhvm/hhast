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

use namespace HH\Lib\{C, Str, Vec};

final class PHPUnitToHackTestMigration extends StepBasedMigration {
  private function replaceQualifiedName(
    HHAST\QualifiedName $in,
  ): HHAST\QualifiedName {
    $name = $in->getDescendantsOfType(HHAST\EditableToken::class)
      |> Vec\map($$, $t ==> $t->getText())
      |> Str\join($$, '');
    if (
      $name !== "\\PHPUnit_Framework_TestCase" &&
      $name !== "\\PHPUnit\\Framework\\TestCase" &&
      $name !== "PHPUnit_Framework_TestCase" &&
      $name !== "PHPUnit\\Framework\\TestCase"
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
        new HHAST\NameToken($m, $m, "HackTestCase"),
      ],
    );

    $parts[0] = $parts[0]->withLeading($in->getFirstTokenx()->getLeading());
    $last_idx = C\count($parts) - 1;
    $parts[$last_idx] =
      $parts[$last_idx]->withTrailing($in->getLastTokenx()->getTrailing());
    return new HHAST\QualifiedName(new HHAST\EditableList($parts));
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

  private function migrateDocCommentsToAttributes(
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
      '/@dataprovider (?<func>[a-zA-Z]+)$/mi',
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
        $leading = $decl->getFirstTokenx()->getLeadingWhitespace();
      } else {
        $leading = vec[];
        foreach (
          ($decl->getFirstTokenx()->getLeading() as HHAST\EditableList<_>)->getItems()
          as $item
        ) {
          if ($item === $comment) {
            break;
          }
          $leading[] = $item as HHAST\EditableTrivia;
        }
        $saved = vec[];
        $whitespace = vec[];
        foreach ($leading as $item) {
          if ($leading is HHAST\EndOfLine) {
            $whitespace = vec[];
            $saved[] = $item;
            continue;
          } else if ($item is HHAST\WhiteSpace) {
            $whitespace[] = $item;
            continue;
          }
          $saved = Vec\concat($saved, $whitespace);
          $whitespace = vec[];
          $saved[] = $item;
        }
        $leading =
          HHAST\EditableList::fromItems(Vec\concat($saved, $whitespace));
      }
      $attrs = new HHAST\AttributeSpecification(
        new HHAST\LessThanLessThanToken($leading, HHAST\Missing()),
        HHAST\EditableList::fromItems(vec[$attr]),
        new HHAST\GreaterThanGreaterThanToken(HHAST\Missing(), HHAST\Missing()),
      );
    } else {
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

    $decl = $decl
      ->withAttribute($attrs)
      ->replace(
        $comment,
        $comment_text === null
          ? HHAST\Missing()
          : $comment->withText($comment_text),
      );
    $first = $decl->getFunctionDeclHeader()->getFirstTokenx();
    $leading = $first->getLeading() as HHAST\EditableList<_>;
    $new_leading = vec[];
    foreach ($leading->getItems() as $node) {
      if ($node is HHAST\EndOfLine) {
        $new_leading = vec[];
      }
      $new_leading[] = $node as HHAST\EditableTrivia;
    }
    return $decl->replace(
      $first,
      $first->withLeading(HHAST\EditableList::fromItems($new_leading)),
    );
  }

  <<__Override>>
  final public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new TypedMigrationStep(
        'replace direct base class reference',
        HHAST\QualifiedName::class,
        HHAST\QualifiedName::class,
        $node ==> $this->replaceQualifiedName($node),
      ),
      new TypedMigrationStep( // TODO: PLACEHOLDER
        'replace base class references via use statements',
        HHAST\EditableNode::class,
        HHAST\EditableNode::class,
        $node ==> $node,
      ),
      new TypedMigrationStep(
        'replace `$this->markTestFoo` with static calls',
        HHAST\FunctionCallExpression::class,
        HHAST\FunctionCallExpression::class,
        $node ==> $this->rewriteMarkTestCalls($node),
      ),
      new TypedMigrationStep(
        'DataProvider docblock tags to attributes',
        HHAST\MethodishDeclaration::class,
        HHAST\MethodishDeclaration::class,
        $node ==> $this->migrateDocCommentsToAttributes($node),
      ),
    ];
  }
}
