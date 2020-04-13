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

final class PHPArrayLiteralsMigration extends StepBasedMigration {
  private function convertUnkeyedArrayToVarray(
    ArrayIntrinsicExpression $in,
  ): IContainer {
    $members = $in->getMembers();
    if ($members === null || $members->isEmpty()) {
      return $in;
    }

    if (
      C\any(
        $members->getChildrenOfItems() as nonnull,
        $item ==> $item is ElementInitializer /* `key => value` */,
      )
    ) {
      return $in;
    }

    $kw = $in->getKeyword();
    $lp = $in->getLeftParenx();
    $rp = $in->getRightParenx();

    return new VarrayIntrinsicExpression(
      new VarrayToken($kw->getLeading(), $kw->getTrailing()),
      null,
      new LeftBracketToken($lp->getLeading(), $lp->getTrailing()),
      /* HH_IGNORE_ERROR[4110] array members are not IExpression because of
        ElementInitializers, but we know we don't have any here */
      $members,
      new RightBracketToken($rp->getLeading(), $rp->getTrailing()),
    );
  }

  private function convertArrayToDarray(
    ArrayIntrinsicExpression $in,
  ): DarrayIntrinsicExpression {
    $highest_int_key = new \HH\Lib\Ref(-1);

    $members = Vec\map(
      $in->getMembers()?->getChildren() ?? vec[],
      $list_item ==> {
        $item = $list_item->getItem();
        if ($item is ElementInitializer) {
          $key = $item->getKey() ?as LiteralExpression
            |> $$?->getExpression() ?as DecimalLiteralToken
            |> $$?->getText()
            |> Str\to_int($$ ?? '');
          if ($key is int) {
            if ($key > $highest_int_key->value) {
              $highest_int_key->value = $key;
            }
          }
          return new ListItem($item, $list_item->getSeparator());
        }
        $key = $highest_int_key->value + 1;
        $highest_int_key->value = $key;
        return new ElementInitializer(
          new LiteralExpression(
            new DecimalLiteralToken(
              $item->getFirstTokenx()->getLeading(),
              null,
              (string)$key,
            ),
          ),
          new EqualGreaterThanToken(
            new NodeList(vec[new WhiteSpace(' ')]),
            null,
          ),
          ($item as IExpression)->replaceDescendant(
            $item->getFirstTokenx(),
            $item->getFirstTokenx()
              ->withLeading(new NodeList(vec[new WhiteSpace(' ')])),
          ),
        )
          |> new ListItem($$, $list_item->getSeparator());
      },
    );

    $kw = $in->getKeyword();
    $lp = $in->getLeftParenx();
    $rp = $in->getRightParenx();
    return new DarrayIntrinsicExpression(
      new DarrayToken($kw->getLeading(), $kw->getTrailing()),
      null,
      new LeftBracketToken($lp->getLeading(), $lp->getTrailing()),
      NodeList::createNonEmptyListOrNull($members),
      new RightBracketToken($rp->getLeading(), $rp->getTrailing()),
    );
  }

  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new TypedMigrationStep(
        'convert non-empty unkeyed arrays to varrays',
        ArrayIntrinsicExpression::class,
        IContainer::class,
        $node ==> $this->convertUnkeyedArrayToVarray($node),
      ),
      new TypedMigrationStep(
        'convert any remaining arrays to darrays',
        ArrayIntrinsicExpression::class,
        DarrayIntrinsicExpression::class,
        $node ==> $this->convertArrayToDarray($node),
      ),
    ];
  }
}
