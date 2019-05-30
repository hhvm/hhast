/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HHAST\Node;

/* HH_IGNORE_ERROR[4047] not implementing abstract methods */
abstract final class NodeImplementationDetails extends Node {
  const string SYNTAX_KIND = 'hhast_nonimplementable';
  public static function getSourceRef(Node $node): ?SourceRef {
    return $node->sourceRef;
  }
}
