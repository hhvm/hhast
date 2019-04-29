/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HHAST\EditableNode;

/* HH_IGNORE_ERROR[4047] not implementing abstract methods */
abstract final class NodeImplementationDetails extends EditableNode {
  public static function getSourceRef(
    EditableNode $node,
  ): ?SourceRef {
    return $node->sourceRef;
  }
}
