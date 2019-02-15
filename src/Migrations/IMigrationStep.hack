/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Migrations;

use type Facebook\HHAST\EditableNode;

interface IMigrationStep {
  public function getName(): string;
  public function rewrite(EditableNode $in): EditableNode;
}
