/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HackCodegen\HackBuilderValues;

final class CodegenVersion extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $cg
      ->codegenFile($this->getOutputDirectory().'/version.php')
      ->setNamespace('Facebook\\HHAST')
      ->addConstant(
        $cg->codegenConstant('SCHEMA_VERSION')
          ->setType('string')
          ->setValue(
            $this->getSchema()['version'],
            HackBuilderValues::export(),
          ),
      )
      ->addConstant(
        $cg->codegenConstant('HHVM_VERSION_ID')
          ->setType('int')
          ->setValue(\HHVM_VERSION_ID, HackBuilderValues::export()),
      )
      ->save();
  }
}
