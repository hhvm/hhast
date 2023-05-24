/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\C;
use type Facebook\HackTest\HackTest;

final class NodeListGetChildrenOfItemsOfTypeTest extends HackTest {
  public function testRefinesType(): void {
    $node_list = static::getNodeListOfItemsOfIExpression();
    $literal_expression =
      $node_list->getChildrenOfItemsOfType(LiteralExpression::class)
      |> C\firstx($$);
    static::takesT<LiteralExpression>($literal_expression);
  }

  public function testReplacementRefinesTypeToo(): void {
    $node_list = static::getNodeListOfItemsOfIExpression();
    $literal_expression =
      $node_list->getChildrenOfItemsByType<LiteralExpression>() |> C\firstx($$);
    static::takesT<LiteralExpression>($literal_expression);
  }

  private static function getNodeListOfItemsOfIExpression(
  ): NodeList<ListItem<IExpression>> {
    // NodeList(123,)
    return new NodeList(
      vec[new ListItem(
        new LiteralExpression(new DecimalLiteralToken(null, null, '123')),
        new CommaToken(null, null),
      )],
    );
  }

  private static function takesT<<<__Explicit>> T>(T $_): void {}
}
