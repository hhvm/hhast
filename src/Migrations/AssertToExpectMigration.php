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
  CommaToken,
  EditableList,
  EditableNode,
  FunctionCallExpression,
  WhiteSpace,
};
use namespace HH\Lib\{Str, Vec, C};

abstract class AssertToExpectMigration extends StepBasedMigration {

  final public function assertSingleArgToExpect(
    FunctionCallExpression $node,
  ): FunctionCallExpression {
    $method = $this->isAssert($node);
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

    $params = vec($node->getArgumentListx()->getChildren());
    $actual = C\firstx($params);
    $msg = Missing();
    if (C\count($params) === 2) {
      $msg = C\lastx($params);
      $actual = $actual->replace($actual->getLastTokenx(), Missing());
    }
    $func_name = $single_arg_names[$method];
    return $this->getNewNode(
      $node,
      $actual,
      new EditableList(vec[$msg]),
      $func_name,
    );
  }

  final public function assertMultiArgToExpect(
    FunctionCallExpression $node,
  ): FunctionCallExpression {
    $method = $this->isAssert($node);
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

    return $this->getNewNode($node, $actual, $args, $func_name);
  }

  abstract public function getNewNode(
    FunctionCallExpression $node,
    EditableNode $actual,
    EditableList $args,
    string $funcName,
  ): FunctionCallExpression;

  abstract public function isAssert(FunctionCallExpression $node): string;
}
