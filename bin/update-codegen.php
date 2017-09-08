#!/usr/bin/env hhvm -d hhvm.hack.lang.look_for_typechecker=0
<?hh
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\TypeAssert\TypeAssert;
use type Facebook\HackCodegen\{
  HackBuilderKeys,
  HackBuilderValues,
  HackCodegenConfig,
  HackCodegenFactory
};

use namespace HH\Lib\{C, Dict, Str, Vec};
use type Facebook\HHAST\__Private\Schema\TSchema as TSchema;

require_once(__DIR__.'/../vendor/hh_autoload.php');

final class UpdateCodegen {
  const type TSchema = Schema\TSchema;
  
  public function __construct(private self::TSchema $schema) {
  }

  <<__Memoize>>


  public function generateAll(): void {
    $generators = keyset[
      CodegenEditableSyntaxFromJSON::class,
      CodegenEditableTokenFromData::class,
      CodegenEditableTriviaFromJSON::class,
      CodegenSyntax::class,
      CodegenTokens::class,
      CodegenTrivia::class,
    ];
    foreach ($generators as $generator) {
      (new $generator($this->schema))->generate();
    }
  }

  public static function fromFile(string $path): this {
    $json = file_get_contents($path);
    $array = json_decode($json, /* associative array = */ true);

    return new self(
      TypeAssert::matchesTypeStructure(
        type_structure(self::class, 'TSchema'),
        $array,
      ),
    );
  }
}

UpdateCodegen::fromFile(__DIR__.'/../codegen/schema.json')->generateAll();
