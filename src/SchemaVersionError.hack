/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Str;

final class SchemaVersionError extends ParseError {
  public function __construct(string $targetFile, private string $version) {
    parent::__construct(
      $targetFile,
      null,
      Str\format(
        "AST version mismatch: expected '%s' (%s), but got '%s'",
        SCHEMA_VERSION,
        HHVM_VERSION,
        $version,
      ),
    );
  }
}
