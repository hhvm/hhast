/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\Script;

abstract class StepBasedMigration extends BaseMigration {
  abstract public function getSteps(): Traversable<IMigrationStep>;

  <<__Override>>
  final public function migrateFile(string $_path, Script $ast): Script {
    foreach ($this->getSteps() as $step) {
      $ast = $ast->rewrite(($node, $_) ==> $step->rewrite($node)) as Script;
    }
    return $ast;
  }
}
