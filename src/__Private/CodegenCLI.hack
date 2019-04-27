/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace Facebook\TypeAssert;
use type Facebook\CLILib\CLIBase;
use namespace Facebook\CLILib\CLIOptions;

final class CodegenCLI extends CLIBase {
  const type TSchema = Schema\TSchema;

  private ?string $hhvmPath = null;
  private bool $rebuildRelationships = false;

  <<__Override>>
  protected function getSupportedOptions(): vec<CLIOptions\CLIOption> {
    return vec[
      CLIOptions\with_required_string(
        $path ==> {
          $this->hhvmPath = $path;
        },
        'Path to HHVM source tree',
        '--hhvm-path',
      ),
      CLIOptions\flag(
        () ==> {
          $this->rebuildRelationships = true;
        },
        'Update inferred relationships based on the HHVM and Hack tests; requires --hhvm-path',
        '--rebuild-relationships',
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
      CodegenVersion::class,
    ];
    $schema = $this->getSchema();
    $rebuild_relationships = $this->rebuildRelationships;
    if ($rebuild_relationships) {
      $hhvm = $this->hhvmPath;
      if ($hhvm === null) {
        await $this->getStderr()->writeAsync(
          "--hhvm-path is required when rebuilding relationships.\n",
        );
        return 1;
      }
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
    $json = \file_get_contents(
      \Facebook\AutoloadMap\Generated\root().'/codegen/schema.json',
    );
    $array = \json_decode(
      $json, /* associative array = */
      true, /* depth = */
      512,
      \JSON_FB_HACK_ARRAYS,
    );

    return TypeAssert\matches_type_structure(
      type_structure(self::class, 'TSchema'),
      $array,
    );
  }
}
