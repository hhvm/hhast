<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use namespace Facebook\HHAST\Linters;
use namespace Facebook\HHAST\__Private\LSPLib;
use type Facebook\HHAST\__Private\LintRunConfig;

final class ServerState extends LSPLib\ServerState {
  public ?LintRunConfig $config = null;
  public LintMode $lintMode = LintMode::WHOLE_PROJECT;
  public keyset<string> $openFiles = keyset[];
  public dict<string, vec<Linters\LintError>> $lintErrors = dict[];
}
