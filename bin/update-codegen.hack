#!/usr/bin/env hhvm
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

<<__EntryPoint>>
async function update_codegen_async(): Awaitable<noreturn> {
  (() ==> {
    // HHAST-generated to avoid pseudomain local leaks
    require_once(__DIR__.'/../vendor/autoload.hack');
  })();
  \Facebook\AutoloadMap\initialize();
  $status = await CodegenCLI::runAsync();
  exit($status);
}
