<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str, Vec};

/** Given a tree, provide a list of names that are referenced by the code.
 *
 * These are not resolved to fully-qualified names; for example, `use`
 * and `namespace` statements to not affect the return value.
 */
function get_unresolved_referenced_names(
  EditableNode $root,
): shape(
  'namespaces' => keyset<string>,
  'types' => keyset<string>,
  'functions' => keyset<string>,
  'constants' => keyset<string>,
) {
  $ret = shape(
    'namespaces' => keyset[],
    'types' => keyset[],
    'functions' => keyset[],
    'constants' => keyset[],
  );

  foreach ($root->traverse() as $node) {
    if ($node instanceof QualifiedName) {
      $name = C\firstx($node->getParts()->getItems());
      if (!$name instanceof NameToken) {
        continue;
      }
      $ret['namespaces'][] = $name->getText();
      continue;
    }

    if ($node instanceof SimpleTypeSpecifier) {
      $name = $node->getSpecifierx();
      if (!$name instanceof NameToken) {
        continue;
      }
      $ret['types'][] = $name->getText();
      continue;
    }
  }

  return $ret;
}
