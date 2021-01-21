/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

trait TypeSpecifierOrContextsTrait implements ITypeSpecifierOrContexts {
  final public function asTypeSpecifier(): ITypeSpecifier {
    return $this as ITypeSpecifier;
  }

  final public function asContexts(): Contexts {
    return $this as Contexts;
  }
}
