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
use function Facebook\HHAST\Missing;
use type Facebook\HHAST\{
  BackslashToken,
  CommaToken,
  DelimitedComment,
  EditableList,
  EditableNode,
  FunctionCallExpression,
  FunctionToken,
  LeftParenToken,
  ListItem,
  MemberSelectionExpression,
  NamespaceBody,
  NamespaceDeclaration,
  NamespaceEmptyBody,
  NamespaceUseDeclaration,
  NameToken,
  QualifiedName,
  RightParenToken,
  SemicolonToken,
  UseToken,
  WhiteSpace,
};
use namespace HH\Lib\{Str, Vec, C};

final class ExternalAssertToExpectMigration extends AssertToExpectMigration {

  private bool $expectPresent = false;
  private static ?NamespaceUseDeclaration $expectFunction = null;

  private static function getExpectFunction(): NamespaceUseDeclaration {
    if (self::$expectFunction !== null) {
      return self::$expectFunction;
    }
    $sep = new BackslashToken(Missing(), Missing());
    self::$expectFunction = new NamespaceUseDeclaration(
      new UseToken(Missing(), new WhiteSpace(' ')),
      new FunctionToken(Missing(), new WhiteSpace(' ')),
      new QualifiedName(
        new EditableList(
          vec[
            new ListItem(new NameToken(Missing(), Missing(), 'Facebook'), $sep),
            new ListItem(new NameToken(Missing(), Missing(), 'FBExpect'), $sep),
            new ListItem(
              new NameToken(Missing(), Missing(), 'expect'),
              Missing(),
            ),
          ],
        ),
      ),
      new SemicolonToken(Missing(), new WhiteSpace("\n")),
    );
    return self::$expectFunction;
  }

  private function checkExpectFunctionPresent(
    NamespaceUseDeclaration $node,
  ): NamespaceUseDeclaration {
    if ($this->expectPresent) {
      return $node;
    }
    $curr = Str\trim($node->getCode());
    $useExpectFunctionCode = Str\trim(self::getExpectFunction()->getCode());
    if (Str\contains($curr, $useExpectFunctionCode)) {
      $this->expectPresent = true;
    }

    return $node;
  }

  private function addExpectAfterUseFunction(
    NamespaceUseDeclaration $node,
  ): NamespaceUseDeclaration {
    if ($this->expectPresent) {
      return $node;
    }
    $useKind = $node->getKind();
    if ($useKind !== null && $useKind instanceof FunctionToken) {
      $node =
        $node->insertAfter($node->getLastTokenx(), self::getExpectFunction());
      $this->expectPresent = true;
    }
    return $node;
  }

  private function addExpectAfterUseDecl(
    NamespaceUseDeclaration $node,
  ): NamespaceUseDeclaration {
    if ($this->expectPresent) {
      return $node;
    }
    $this->expectPresent = true;
    return
      $node->insertAfter($node->getLastTokenx(), self::getExpectFunction());
  }

  private function addExpectAfterNamespaceDecl(
    NamespaceDeclaration $node,
  ): NamespaceDeclaration {
    if ($this->expectPresent) {
      return $node;
    }
    $this->expectPresent = true;
    $body = $node->getBodyx();
    $expectFunction = self::getExpectFunction();
    if ($body instanceof NamespaceEmptyBody) {
      return $node->insertAfter($node->getLastTokenx(), $expectFunction);
    }
    return $node->insertAfter(
      $body->getFirstTokenx(),
      $expectFunction->insertBefore(
        $expectFunction->getFirstTokenx(),
        new WhiteSpace("\t"),
      ),
    );
  }

  private function addExpectAfterComment(DelimitedComment $node): EditableNode {
    if ($this->expectPresent) {
      return $node;
    }
    $expectFunction = self::getExpectFunction();
    $this->expectPresent = true;
    if (!Str\contains($node->getText(), "/**")) {
      return EditableList::concat(
        $node,
        $expectFunction->insertBefore(
          $expectFunction->getFirstTokenx(),
          new WhiteSpace("\n\n"),
        )
          ->replace(
            $expectFunction->getLastTokenx()->getTrailing(),
            new WhiteSpace(''),
          ),
      );
    }
    return $node;
  }

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    $this->expectPresent = false;
    $make_step_add = ($name, $impl) ==> new TypedMigrationStep(
      $name,
      NamespaceUseDeclaration::class,
      NamespaceUseDeclaration::class,
      $impl,
    );
    $make_step_add_namespace = ($name, $impl) ==> new TypedMigrationStep(
      $name,
      NamespaceDeclaration::class,
      NamespaceDeclaration::class,
      $impl,
    );
    $make_step_add_comment = ($name, $impl) ==> new TypedMigrationStep(
      $name,
      DelimitedComment::class,
      EditableNode::class,
      $impl,
    );
    $make_step_expect = ($name, $impl) ==> new TypedMigrationStep(
      $name,
      FunctionCallExpression::class,
      FunctionCallExpression::class,
      $impl,
    );
    return vec[
      $make_step_add(
        'check if expect function is present',
        $node ==> $this->checkExpectFunctionPresent($node),
      ),
      $make_step_add(
        'add expect after use function (if present)',
        $node ==> $this->addExpectAfterUseFunction($node),
      ),
      $make_step_add(
        'add expect after use declaration (if present)',
        $node ==> $this->addExpectAfterUseDecl($node),
      ),
      $make_step_add_namespace(
        'add expect after namespace declaration (if present)',
        $node ==> $this->addExpectAfterNamespaceDecl($node),
      ),
      $make_step_add_comment(
        'add expect at top of file after first non-docblock comment',
        $node ==> $this->addExpectAfterComment($node),
      ),
      $make_step_expect(
        'change single arg assert calls to expect',
        $node ==> $this->assertSingleArgToExpect($node),
      ),
      $make_step_expect(
        'change multi arg assert calls to expect',
        $node ==> $this->assertMultiArgToExpect($node),
      ),
    ];
  }

  <<__Override>>
  public function getNewNode(
    FunctionCallExpression $node,
    EditableNode $actual,
    EditableList $args,
    string $funcName,
  ): FunctionCallExpression {
    $rec = $node->getReceiver();
    invariant(
      $rec instanceof MemberSelectionExpression,
      'receiver should be a member selection expression',
    );
    $new_node = $node
      ->withReceiver(
        $rec->withObject(
          new FunctionCallExpression(
            new NameToken(
              $rec->getObject()->getFirstTokenx()->getLeading(),
              Missing(),
              'expect',
            ),
            new LeftParenToken(Missing(), Missing()),
            new EditableList(vec[$actual]),
            new RightParenToken(Missing(), Missing()),
          ),
        )
          ->withName(new NameToken(Missing(), Missing(), $funcName)),
      )
      ->withArgumentList($args);

    return $new_node;
  }

  <<__Override>>
  public function isAssert(FunctionCallExpression $node): string {
    $rec = $node->getReceiver();
    if (!$rec instanceof MemberSelectionExpression) {
      return '';
    }
    $method = $rec->getName()->getCode();
    if (!Str\starts_with($method, 'assert')) {
      return '';
    }
    return $method;
  }
}
