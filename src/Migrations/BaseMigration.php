<?hh // strict
/**
 * Copyright (c) 2016, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\Migrations;

use namespace Facebook\HHAST;

<<__ConsistentConstruct>>
abstract class BaseMigration {
  abstract public function migrateAst(
    HHAST\EditableSyntax $ast,
  ): HHAST\EditableSyntax;
}
