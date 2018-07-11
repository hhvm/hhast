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
  EditableList,
  EditableNode,
  FunctionCallExpression,
  LeftParenToken,
  MemberSelectionExpression,
  MinusGreaterThanToken,
  NameToken,
  RightParenToken,
  ScopeResolutionExpression,
};
use namespace HH\Lib\{Str, Vec, C};

final class InternalAssertToExpectMigration extends AssertToExpectMigration {

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
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
    $new_node = $node
      ->withReceiver(
        $exp->withObject(
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

  <<__Override>>
  public function isAssert(FunctionCallExpression $node): string {
    $rec = $node->getReceiver();
    $method = '';
    if ($rec instanceof ScopeResolutionExpression) {
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
