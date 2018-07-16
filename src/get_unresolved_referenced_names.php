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

use namespace HH\Lib\C;

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
) {
  $ret = shape(
    'namespaces' => keyset[],
    'types' => keyset[],
    'functions' => keyset[],
  );

  foreach ($root->traverse() as $node) {
    if ($node instanceof QualifiedName) {
      $name = C\firstx($node->getParts()->getItems());
      if ($name instanceof NameToken) {
        $ret['namespaces'][] = $name->getText();
      }
      continue;
    }

    if ($node instanceof SimpleTypeSpecifier) {
      $name = $node->getSpecifierx();
      if ($name instanceof NameToken) {
        $ret['types'][] = $name->getText();
      }
      continue;
    }

    if ($node instanceof ScopeResolutionExpression) {
      $name = $node->getQualifier();
      if ($name instanceof NameToken) {
        $ret['types'][] = $name->getText();
      }
      continue;
    }

    if ($node instanceof InstanceofExpression) {
      $name = $node->getRightOperand();
      if ($name instanceof NameToken) {
        $ret['types'][] = $name->getText();
      }
      continue;
    }

    if ($node instanceof FunctionCallExpression) {
      $name = $node->getReceiver();
      if ($name instanceof NameToken) {
        $ret['functions'][] = $name->getText();
      }
      continue;
    }
  }

  return $ret;
}
