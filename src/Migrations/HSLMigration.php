<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Migrations;
use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};

use type Facebook\HHAST\{
  EditableNode,
  FunctionCallExpression,
  NameToken,
  EditableList,
  BinaryExpression,
  LiteralExpression,
  BooleanLiteralToken,
  NullLiteralToken,
  NamespaceGroupUseDeclaration,
  NamespaceUseDeclaration,
  QualifiedName,
  Script,
};

enum HSL_NAMESPACE: string as string {
  C = 'C';
  Dict = 'Dict';
  Keyset = 'Keyset';
  Math = 'Math';
  Str = 'Str';
  Vec = 'Vec';
}

type hsl_replacement_config = shape(
  // \HH\Lib\* namespace the replacement function lives in
  'ns' => HSL_NAMESPACE,
  // the name of the replacement function
  'name' => string,
  // a vector indicating the order of the arguments in the new function from the old one.
  // vec[2, 0, 1] means take the 3rd, then 1st, then 2nd argument from the PHP function in the HSL replacement
  ?'argument_order' => vec<int>,
  // look for nearby boolean operations comparing the result of the HSL function with (bool)false, and change false to null
  ?'replace_false_with_null' => bool,
);

final class HSLMigration extends BaseMigration {

  // key is PHPstdlib function name, value is a shape configuring how the migration should work
  const dict<string, hsl_replacement_config>
    PHP_HSL_REPLACEMENTS = dict[
      // String functions
      'ucwords' =>
        shape('ns' => HSL_NAMESPACE::Str, 'name' => 'capitalize_words'),
      'ucfirst' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'capitalize'),
      'strtolower' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'lowercase'),
      'strtoupper' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'uppercase'),
      'str_replace' => shape(
        'ns' => HSL_NAMESPACE::Str,
        'name' => 'replace',
        'argument_order' => vec[2, 0, 1],
      ),
      'str_ireplace' => shape(
        'ns' => HSL_NAMESPACE::Str,
        'name' => 'replace_ci',
        'argument_order' => vec[2, 0, 1],
      ),
      'strpos' => shape(
        'ns' => HSL_NAMESPACE::Str,
        'name' => 'search',
        'replace_false_with_null' => true,
      ),
      'stripos' => shape(
        'ns' => HSL_NAMESPACE::Str,
        'name' => 'search_ci',
        'replace_false_with_null' => true,
      ),
      'strrpos' => shape(
        'ns' => HSL_NAMESPACE::Str,
        'name' => 'search_last',
        'replace_false_with_null' => true,
      ),
      'implode' => shape(
        'ns' => HSL_NAMESPACE::Str,
        'name' => 'join',
        'argument_order' => vec[1, 0],
      ),
      'join' => shape(
        'ns' => HSL_NAMESPACE::Str,
        'name' => 'join',
        'argument_order' => vec[1, 0],
      ),
      'substr_replace' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'splice'),
      'substr' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'slice'),
      'str_repeat' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'repeat'),
      'trim' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'trim'),
      'ltrim' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'trim_left'),
      'rtrim' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'trim_right'),
      'strlen' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'length'),
      'sprintf' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'format'),
      'str_split' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'chunk'),
      'strcmp' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'compare'),
      'strcasecmp' => shape('ns' => HSL_NAMESPACE::Str, 'name' => 'compare_ci'),
      'strncmp' => shape(
        'ns' => HSL_NAMESPACE::Str,
        'name' => 'starts_with',
        'argument_order' => vec[0, 1],
      ),
      'strncasecmp' => shape(
        'ns' => HSL_NAMESPACE::Str,
        'name' => 'starts_with_ci',
        'argument_order' => vec[0, 1],
      ),
      'number_format' =>
        shape('ns' => HSL_NAMESPACE::Str, 'name' => 'format_number'),

      // Math functions
      'round' => shape('ns' => HSL_NAMESPACE::Math, 'name' => 'round'),
      'ceil' => shape('ns' => HSL_NAMESPACE::Math, 'name' => 'ceil'),
      'floor' => shape('ns' => HSL_NAMESPACE::Math, 'name' => 'floor'),
      'array_sum' => shape('ns' => HSL_NAMESPACE::Math, 'name' => 'sum'),
      'intdiv' => shape('ns' => HSL_NAMESPACE::Math, 'name' => 'int_div'),
      'exp' => shape('ns' => HSL_NAMESPACE::Math, 'name' => 'exp'),
      'abs' => shape('ns' => HSL_NAMESPACE::Math, 'name' => 'abs'),
      'base_convert' =>
        shape('ns' => HSL_NAMESPACE::Math, 'name' => 'base_convert'),
    ];


  <<__Override>>
  public function migrateFile(string $_, EditableNode $root): EditableNode {
    // find all the function calls
    $nodes = $root->getDescendantsOfType(FunctionCallExpression::class);

    // keep track of any HSL namespaces we may have to add to the top of the file
    $found_namespaces = dict[];

    // check if any functions are in the replacement list
    foreach ($nodes as $node) {

      // bail if not in the config
      $fn_name = $this->getFunctionName($node);
      if (
        $fn_name === null ||
        !C\contains_key(self::PHP_HSL_REPLACEMENTS, $fn_name)
      ) {
        continue;
      }

      // found a function to replace!
      $replace_config = self::PHP_HSL_REPLACEMENTS[$fn_name];
      $namespace = $replace_config['ns'];
      $replacement = $replace_config['name'];
      $found_namespaces[$namespace] = true;

      // build the replacement AST node
      $receiver = $node->getReceiver();
      invariant($receiver instanceof NameToken, 'must be name token');
      $new_receiver = new NameToken(
        $receiver->getLeading(),
        $receiver->getTrailing(),
        $namespace.'\\'.$replacement,
      );
      $new_node = $node->replace($receiver, $new_receiver);

      // possibly change argument order
      $argument_order = $replace_config['argument_order'] ?? null;
      if ($argument_order !== null) {
        $new_node = $this->maybeReorderArguments($new_node, $argument_order);
      }

      // if we got null back here, it means the function call has unsupported arguments. forget it for now
      if ($new_node === null) {
        continue;
      }

      // replace it in the ast
      $root = $root->replace($node, $new_node);

      // potentially change adjacent expressions to check for null instead of false
      if ($replace_config['replace_false_with_null'] ?? false) {
        $root = $this->maybeChangeFalseToNull($root, $new_node);
      }
    }

    if (\count($found_namespaces) === 0) {
      return $root;
    }

    // add "use namespace" declarations at the top if they aren't already present
    $declarations = $root->getChildren()['declarations'];
    foreach ($found_namespaces as $ns => $_) {
      if (!$this->hasUseDeclaration($declarations, $ns)) {
        $children = vec($declarations->getChildren());
        $first = $children[0];
        $rest = Vec\drop($children, 1);
        $items = Vec\concat(vec[$first, $this->getUseDeclaration($ns)], $rest);
        $new_declarations = EditableList::fromItems($items);
        $root = $root->replace($declarations, $new_declarations);
      }
    }

    return $root;
  }

  // change argument order between PHP function and HSL function if necessary
  protected function maybeReorderArguments(
    FunctionCallExpression $node,
    vec<int> $argument_order,
  ): ?FunctionCallExpression {
    $argument_list = $node->getArgumentList();
    invariant($argument_list !== null, 'Function must have arguments');
    $arguments = $argument_list->getChildren();
    /* HH_FIXME[4053] why is this not defined */
    $items = Vec\map($arguments, ($argument) ==> $argument->getItem());

    // can't handle these ones with wrong number of args yet
    // return null, signaling to caller to skip rewriting this invocation
    if (\count($items) !== \count($argument_order)) {
      return null;
    }

    $new_items = vec[];
    foreach ($argument_order as $index) {
      $new_items[] = $items[$index];
    }

    $new_argument_list = vec[];

    foreach ($arguments as $i => $argument) {
      $new_argument_list[] = /* HH_FIXME[4053] why is this not defined */
      $argument->replace($argument->getItem(), $new_items[(int)$i]);
    }

    return $node->replace(
      $argument_list,
      EditableList::fromItems($new_argument_list),
    );
  }

  // many PHP functions can return false, and their HSL counterparts return null instead
  // this will replace false with null in binary expressions like === false and !=== false
  protected function maybeChangeFalseToNull(
    EditableNode $root,
    FunctionCallExpression $node,
  ): EditableNode {
    $parents = null;
    $found = false;
    $stack = $root->findWithParents($it ==> $it === $node);
    invariant(!C\is_empty($stack), 'did not find node in root');
    invariant(C\lastx($stack) === $node, 'expected node at top of stack');
    $stack_count = C\count($stack);
    $parent = $stack[$stack_count - 2];

    if ($parent instanceof BinaryExpression) {
      if ($parent->getLeftOperand() === $node) {
        $check = $parent->getRightOperand();
      } else {
        $check = $parent->getLeftOperand();
      }


      if ($check instanceof LiteralExpression) {
        $expression = $check->getExpression();
        if ($expression instanceof BooleanLiteralToken) {
          if (Str\lowercase($expression->getText()) === 'false') {
            $new = new NullLiteralToken(
              $expression->getLeading(),
              $expression->getTrailing(),
            );
            $root = $root->replace($expression, $new);
          }
        }
      }
    }

    return $root;
  }

  // does this file already use the namespace we need to add
  protected function hasUseDeclaration(
    EditableNode $declarations,
    string $check,
  ): bool {
    $namespace_use_declarations =
      $declarations->getDescendantsOfType(NamespaceUseDeclaration::class);
    $found = false;
    foreach ($namespace_use_declarations as $decl) {
      $clauses = $decl->getClauses();
      $children = $clauses->getChildren();
      foreach ($children as $clause) {
        /* HH_FIXME[4053] I know */
        $parts = $clause->getItem()->getName()->getParts()->getChildren();
        foreach ($parts as $part) {
          $item = $part->getItem();
          if ($item instanceof NameToken && $item->getText() === $check) {
            $found = true;
            break;
          }
        }
        if ($found) {
          break;
        }
      }
      if ($found) {
        break;
      }
    }

    $namespace_group_use_declarations =
      $declarations->getDescendantsOfType(NamespaceGroupUseDeclaration::class);
    foreach ($namespace_group_use_declarations as $decl) {
      $clauses = $decl->getClauses();
      $children = $clauses->getChildren();
      foreach ($children as $clause) {
        /* HH_FIXME[4053] I know */
        $item = $clause->getItem()->getName();
        if ($item instanceof NameToken && $item->getText() === $check) {
          $found = true;
          break;
        }
      }
      if ($found) {
        break;
      }
    }

    return $found;
  }

  // get a node for a use namespace declaration
  protected function getUseDeclaration(string $ns): NamespaceUseDeclaration {
    $node = HHAST\from_code('use namespace HH\\Lib\\'.$ns.';');
    invariant($node instanceof Script, 'always gets back a script tag');
    $children = vec(
      $node->getDeclarations()
        ->getChildrenOfType(NamespaceUseDeclaration::class),
    );
    $node = C\onlyx($children);
    return $node;
  }

  // extract the function name from an expression
  protected function getFunctionName(FunctionCallExpression $node): ?string {
    $receiver = $node->getReceiver();

    if ($receiver instanceof NameToken) {
      return $receiver->getText();
    }

    if ($receiver instanceof QualifiedName) {
      return $receiver->getFirstTokenx()->getText();
    }

    return null;
  }
}
