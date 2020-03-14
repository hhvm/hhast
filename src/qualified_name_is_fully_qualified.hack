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
 * @reviewer I'd like to put this function on QualifiedName.
 *           Something like QualifiedName->isFullyQualified().
 *           The file is a SignedSource file.
 *           How would I do this?
 */
function qualified_name_is_fully_qualified(QualifiedName $name): bool {
  return $name->getFirstTokenx()->getText() === '\\';
}
