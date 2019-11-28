/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

// before

enum FooBarBasHHAST: string {
  ThisIsPascalCase = 'bad'; // ThisIsPascalCase
  thisIsCamelCase = 'bad'; // thisIsCamelCase
  this_is_snake_case = 'bad'; // this_is_snake_case
  THIS_IS_SHOUT_CASE = 'good'; // THIS_IS_SHOUT_CASE
  HHVMVersion_Id = 'weird'; // HHVMVersion_Id
}

//after

enum FooBarBasHHAST2: string {
  THIS_IS_PASCAL_CASE = 'bad'; // ThisIsPascalCase
  THIS_IS_CAMEL_CASE = 'bad'; // thisIsCamelCase
  THIS_IS_SNAKE_CASE = 'bad'; // this_is_snake_case
  THIS_IS_SHOUT_CASE = 'good'; // THIS_IS_SHOUT_CASE
  HHVMVERSION_ID = 'weird'; // HHVMVersion_Id
}
