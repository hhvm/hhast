/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

function type_alias_structure<T>(typename<T> $type): TypeStructure<T> {
  return /* HH_IGNORE_ERROR[4104] */ type_structure($type);
}
