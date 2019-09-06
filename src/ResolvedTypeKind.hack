/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

enum ResolvedTypeKind: string {
  GENERIC_PARAMETER = 'generic_parameter';
  QUALIFIED_TYPE = 'qualified_type';
  QUALIFIED_AUTOIMPORTED_TYPE = 'qualified_autoimported_type';
  CALLABLE = 'callable';
}
