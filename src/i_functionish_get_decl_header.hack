/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

/**
 * Monomorphize a name for FunctionDeclaration and MethodishDeclaration getDeclarationHeader.
 * This is tech debt.
 * If there is a better way, I'd love to know.
 */
function i_functionish_get_decl_header(
  IFunctionishDeclaration $func,
): FunctionDeclarationHeader {
  if ($func is FunctionDeclaration) {
    return $func->getDeclarationHeader();
  } else if ($func is MethodishDeclaration) {
    return $func->getFunctionDeclHeader();
  }

  invariant_violation(
    'Unhandled IFunctionDeclaration type %s',
    \get_class($func),
  );
}
