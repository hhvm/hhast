/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

// The old parser mode would think this is top level code.
// It "looks" like a function call with an error suppression `@`
// and a missing semicolon.
@__Memoize()
function new_attribute_on_function(): void {}