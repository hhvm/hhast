/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HackCodegen\{CodegenFileType, HackBuilderValues};

final class CodegenLastestBreakingVersion extends CodegenBase {

  <<__Override>>
  protected function getOutputDirectory(): string {
    return __DIR__.'/../../../codegen-no-rebuild';
  }

  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $cg
      ->codegenFile($this->getOutputDirectory().'/latest_breaking_version.hack')
      ->setFileType(CodegenFileType::DOT_HACK)
      ->setNamespace('Facebook\\HHAST')
      ->addConstant(
        $cg->codegenConstant('LATEST_BREAKING_SCHEMA_VERSION')
          ->setType('string')
          ->setValue(
            $this->getSchema()['version'],
            HackBuilderValues::export(),
          ),
      )
      ->addConstant(
        $cg->codegenConstant('LATEST_BREAKING_HHVM_VERSION_ID')
          ->setType('int')
          ->setValue(\HHVM_VERSION_ID, HackBuilderValues::export()),
      )
      ->addConstant(
        $cg->codegenConstant('LATEST_BREAKING_HHVM_VERSION')
          ->setType('string')
          ->setValue(\HHVM_VERSION, HackBuilderValues::export()),
      )
      ->save();
  }
}
