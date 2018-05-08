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
use namespace HH\Lib\C;

abstract class CLIWithRequiredArguments extends CLIWithArguments {
  abstract public static function getHelpTextForRequiredArguments(
  ): vec<string>;

  <<__Override>>
  public static function getHelpTextForOptionalArguments(): string {
    return C\firstx(static::getHelpTextForRequiredArguments());
  }
}
