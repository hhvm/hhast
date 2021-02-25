/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

function control_flow_statement_get_body_like(Node $node): ?IStatement {
  if ($node is IfStatement || $node is ElseifClause || $node is ElseClause) {
    return $node->getStatement();
  }
  if (
    $node is ForeachStatement ||
    $node is ForStatement ||
    $node is DoStatement ||
    $node is WhileStatement
  ) {
    return $node->getBody();
  }
  if ($node is SwitchStatement) {
    return null;
  }
  invariant_violation(
    'Unhandled control flow block type %s',
    \get_class($node),
  );
}
