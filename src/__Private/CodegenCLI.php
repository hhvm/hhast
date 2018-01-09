<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Dict, Str, Vec};

final class CodegenCLI extends CLIBase {
  const type TSchema = Schema\TSchema;

  private ?string $hhvmPath = null;

  <<__Override>>
  protected function getSupportedOptions(): vec<CLIOptions\CLIOption> {
    return vec[
      CLIOptions\with_required_value(
        $path ==> { $this->hhvmPath = $path; },
        'Update inferred relationships based on the HHVM and Hack tests',
        '--hhvm-path',
      ),
    ];
  }

  <<__Override>>
  public async function mainAsync(): Awaitable<int> {
    $generators = keyset[
      CodegenEditableNodeFromJSON::class,
      CodegenEditableTokenFromData::class,
      CodegenEditableTriviaFromJSON::class,
      CodegenTokens::class,
      CodegenTrivia::class,
      CodegenSyntax::class,
    ];
    $schema = $this->getSchema();
    $hhvm = $this->hhvmPath;
    if ($hhvm !== null) {
      $relationships = dict[];
      foreach ($generators as $generator) {
        (new $generator($schema, $relationships))->generate();
      }
      (new CodegenRelations($hhvm, $schema))->generate();
    }

    $relationships = INFERRED_RELATIONSHIPS;
    foreach ($generators as $generator) {
      (new $generator($schema, $relationships))->generate();
    }

    return 0;
  }

  <<__Memoize>>
  private function getSchema(): self::TSchema {
    $json = file_get_contents(
      \Facebook\AutoloadMap\Generated\root().'/codegen/schema.json',
    );
    $array = json_decode($json, /* associative array = */ true);

    return TypeAssert\matches_type_structure(
      type_structure(self::class, 'TSchema'),
      $array,
    );
  }
}
