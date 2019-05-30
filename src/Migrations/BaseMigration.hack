/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Migrations;

use type Facebook\HHAST\Script;

<<__ConsistentConstruct>>
abstract class BaseMigration {
  public function __construct(private string $root) {
  }

  final protected function getRoot(): string {
    return $this->root;
  }

  abstract public function migrateFile(string $path, Script $ast): Script;
}
