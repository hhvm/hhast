/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

final class Fixme4110Migration extends FixmeCodeMigration {

  const keyset<int> OLD_CODES = keyset[4110];

  const keyset<int> NEW_CODES = keyset[
    /* 432x */ 4323, 4324, 4325, 4326, 4327, 4328, 4329,
    /* 433x */ 4330, 4331, 4332, 4333, 4334, 4335, 4336, 4337, 4338, 4339,
    /* 434x */ 4340, 4341, 4342, 4343,
  ];

  <<__Override>>
  public static function getMinimumHHVMVersion(): ?string {
    return '4.17';
  }

  <<__Override>>
  public static function getRequiredHHConfigOptions(): dict<string, string> {
    return dict['use_new_type_errors' => 'true'];
  }
}
