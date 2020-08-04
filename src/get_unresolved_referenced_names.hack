/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Str};

/** Given a tree, provide a list of names that are referenced by the code.
 *
 * These are not resolved to fully-qualified names; for example, `use`
 * and `namespace` statements to not affect the return value.
 */
function get_unresolved_referenced_names(
  Node $root,
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
    if ($node is QualifiedName) {
      $name = C\firstx($node->getParts()->getChildrenOfItems());
      if ($name is NameToken) {
        $ret['namespaces'][] = $name->getText();
      }
      continue;
    }

    if ($node is SimpleTypeSpecifier) {
      $name = $node->getSpecifierx();
      if ($name is NameToken) {
        $ret['types'][] = $name->getText();
      }
      continue;
    }

    if ($node is GenericTypeSpecifier) {
      $name = $node->getClassType();
      if ($name is NameToken) {
        $ret['types'][] = $name->getText();
      }
    }

    if ($node is ScopeResolutionExpression) {
      $name = $node->getQualifier();
      if ($name is NameToken) {
        $ret['types'][] = $name->getText();
      }
      continue;
    }

    if ($node is FunctionCallExpression) {
      $name = $node->getReceiver();
      if ($name is NameToken) {
        $ret['functions'][] = $name->getText();
      }
      continue;
    }

    // `new Foo()` gets us a SimpleTypeSpecifier, but
    // <<Foo>> gets us a NameToken directly
    if ($node is ConstructorCall) {
      $name = $node->getType() ?as NameToken;
      if ($name !== null) {
        $ret['types'][] = $name->getText();
      }
    }

    if (
      $node is XHPElementNameToken &&
      \ini_get('hhvm.hack.lang.disable_xhp_element_mangling')
    ) {
      $parts = Str\split($node->getText(), ':');
      if (C\count($parts) === 1) {
        $ret['types'][] = C\onlyx($parts);
      } else {
        $ret['namespaces'][] = C\firstx($parts);
      }
    }
  }

  return $ret;
}
