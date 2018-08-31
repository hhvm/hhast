<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

final class CodegenVersion extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $cg
      ->codegenFile($this->getOutputDirectory().'/version.php')
      ->setNamespace('Facebook\\HHAST')
      ->addConst('string SCHEMA_VERSION', $this->getSchema()['version'])
      ->addConst('int HHVM_VERSION_ID', \HHVM_VERSION_ID)
      ->save();
  }
}
