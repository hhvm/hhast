<?php
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

echo <<<WHAT
In this file cannot be parsed in hhvm, because we don't understand `__halt_compiler()`.
The gunk after `__halt_compiler()` will throw off the parser and throw an exception.
This file has no purpose, other than to explode when you lint or --migrate it.
WHAT;
__halt_compiler();
;-34wmit0;cme04imgw-e;migwe-rm0gi'we[0imgwe;mrig0w-ergim;perigsm['0dimg=ei-[']]
