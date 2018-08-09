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
  MinusGreaterThanToken,
  NamespaceBody,
  NamespaceDeclaration,
  NamespaceEmptyBody,
  NamespaceUseDeclaration,
  NameToken,
  QualifiedName,
  RightParenToken,
  ScopeResolutionExpression,
  SemicolonToken,
  UseToken,
  WhiteSpace,
};
use namespace HH\Lib\{Str, Vec, C};

final class AssertToExpectMigration extends StepBasedMigration {

  private bool $useExpectFunctionPresent = false;
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
    if (!$this->expectPresent) {
      $this->useExpectFunctionPresent = true;
    }
    if ($this->useExpectFunctionPresent) {
      return $node;
    }
    if (\preg_match('/^use function .*\\\\expect;$/', Str\trim($node->getCode()))) {
      $this->useExpectFunctionPresent = true;
    }

    return $node;
  }

  private function addExpectAfterUseFunction(
    NamespaceUseDeclaration $node,
  ): NamespaceUseDeclaration {
    if ($this->useExpectFunctionPresent) {
      return $node;
    }
    $useKind = $node->getKind();
    if ($useKind !== null && $useKind instanceof FunctionToken) {
      $node =
        $node->insertAfter($node->getLastTokenx(), self::getExpectFunction());
      $this->useExpectFunctionPresent = true;
    }
    return $node;
  }

  private function addExpectAfterUseDecl(
    NamespaceUseDeclaration $node,
  ): NamespaceUseDeclaration {
    if ($this->useExpectFunctionPresent) {
      return $node;
    }
    $this->useExpectFunctionPresent = true;
    return
      $node->insertAfter($node->getLastTokenx(), self::getExpectFunction());
  }

  private function addExpectAfterNamespaceDecl(
    NamespaceDeclaration $node,
  ): NamespaceDeclaration {
    if ($this->useExpectFunctionPresent) {
      return $node;
    }
    $this->useExpectFunctionPresent = true;
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
    if ($this->useExpectFunctionPresent) {
      return $node;
    }
    $expectFunction = self::getExpectFunction();
    $this->useExpectFunctionPresent = true;
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

  private function assertSingleArgToExpect(
    FunctionCallExpression $node,
  ): FunctionCallExpression {
    $method = self::isAssert($node);
    $single_arg_names = dict[
      'assertTrue' => 'toBeTrue',
      'assertFalse' => 'toBeFalse',
      'assertNull' => 'toBeNull',
      'assertEmpty' => 'toBeEmpty',
      'assertNotNull' => 'toNotBeNull',
      'assertNotEmpty' => 'toNotBeEmpty',
    ];
    if (Str\is_empty($method) || !C\contains_key($single_arg_names, $method)) {
      return $node;
    }
    $this->expectPresent = true;
    $params = vec($node->getArgumentListx()->getChildren());
    $actual = C\firstx($params);
    $msg = Missing();
    if (C\count($params) === 2) {
      $msg = C\lastx($params);
      $actual = $actual->replace($actual->getLastTokenx(), Missing());
    }
    $func_name = $single_arg_names[$method];
    return self::getNewNode(
      $node,
      $actual,
      new EditableList(vec[$msg]),
      $func_name,
    );
  }

  private function assertMultiArgToExpect(
    FunctionCallExpression $node,
  ): FunctionCallExpression {
    $method = self::isAssert($node);
    $two_arg_names = dict[
      'assertSame' => 'toBeSame',
      'assertEquals' => 'toBePHPEqual',
      'assertGreaterThan' => 'toBeGreaterThan',
      'assertGreaterThanOrEqualTo' => 'toBeGreaterThanOrEqualTo',
      'assertLessThan' => 'toBeLessThan',
      'assertLessThanOrEqualTo' => 'toBeLessThanOrEqualTo',
      'assertRegExp' => 'toMatchRegExp',
      'assertType' => 'toBeType',
      'assertContains' => 'toContain',
      'assertSubset' => 'toInclude',
      'assertInstanceOf' => 'toBeInstanceOf',
      // 'Not' Assertions
      'assertNotSame' => 'toNotBeSame',
      'assertNotEquals' => 'toNotBePHPEqual',
      'assertNotRegExp' => 'toNotMatchRegExp',
      'assertNotType' => 'toNotBeType',
      'assertNotContains' => 'toNotContain',
      'assertNotInstanceOf' => 'toNotBeInstanceOf',
    ];
    if (Str\is_empty($method) || !C\contains_key($two_arg_names, $method)) {
      return $node;
    }
    $this->expectPresent = true;
    $params = vec($node->getArgumentListx()->getChildren());
    $args = Missing();
    $expected = $params[0];
    $actual = $params[1];
    $func_name = $two_arg_names[$method];
    $rest = Vec\drop($params, 2);
    if (C\count($rest) === 2) {
      $rest[0] = $rest[0]->replace($rest[0]->getLastTokenx(), Missing());
      $rest[1] = $rest[1]->insertAfter(
        $rest[1]->getLastTokenx(),
        new CommaToken(Missing(), new WhiteSpace(' ')),
      );
      $rest = Vec\reverse($rest);
      $func_name = 'toEqualWithDelta';
      $actual = $actual->replace($actual->getLastTokenx(), Missing());
    } else if (C\is_empty($rest)) {
      $expected = $expected->replace($expected->getLastTokenx(), Missing());
    } else {
      $actual = $actual->replace($actual->getLastTokenx(), Missing());
    }
    $args = new EditableList(Vec\concat(vec[$expected], $rest));

    return self::getNewNode($node, $actual, $args, $func_name);
  }

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    $this->useExpectFunctionPresent = false;
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
      $make_step_expect(
        'change single arg assert calls to expect',
        $node ==> $this->assertSingleArgToExpect($node),
      ),
      $make_step_expect(
        'change multi arg assert calls to expect',
        $node ==> $this->assertMultiArgToExpect($node),
      ),
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
    ];
  }

  private static function getNewNode(
    FunctionCallExpression $node,
    EditableNode $actual,
    EditableList $args,
    string $funcName,
  ): FunctionCallExpression {
    $rec = $node->getReceiver();
    $leading = Missing();
    if ($rec instanceof ScopeResolutionExpression) {
      $leading = $rec->getQualifier()->getFirstTokenx()->getLeading();
    } else if ($rec instanceof NameToken) {
      $leading = $rec->getLeading();
    }
    $exp = new MemberSelectionExpression(
      Missing(),
      new MinusGreaterThanToken(Missing(), Missing()),
      Missing(),
    );
    if (!$rec instanceof MemberSelectionExpression) {
      $rec = $exp;
    } else {
      $leading = $rec->getObject()->getFirstTokenx()->getLeading();
    }
    $new_node = $node
      ->withReceiver(
        $rec->withObject(
          new FunctionCallExpression(
            new NameToken($leading, Missing(), 'expect'),
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

  private static function isAssert(FunctionCallExpression $node): string {
    $rec = $node->getReceiver();
    $method = '';
    if ($rec instanceof MemberSelectionExpression) {
      $method = $rec->getName()->getCode();
    } else if ($rec instanceof ScopeResolutionExpression) {
      $method = $rec->getName()->getCode();
    } else if ($rec instanceof NameToken) {
      $method = $rec->getText();
    }
    if (!Str\starts_with($method, 'assert')) {
      return '';
    }
    return $method;
  }
}
