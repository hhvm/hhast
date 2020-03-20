/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Keyset, Math, Str, Vec};


use function Facebook\HHAST\__Private\find_type_for_node_async;

enum HslNamespace: string {
  C = 'C';
  DICT = 'Dict';
  KEYSET = 'Keyset';
  MATH = 'Math';
  STR = 'Str';
  VEC = 'Vec';
}

type HslReplacementConfig = shape(
  /**
   * \HH\Lib\* namespace the replacement function lives in
   */
  'ns' => HslNamespace,
  /**
   * the name of the replacement function
   */
  'name' => string,
  /**
   * a vector indicating the order of the arguments in the new function from the old one.
   * vec[2, 0, 1] means take the 3rd, then 1st, then 2nd argument from the PHP function in the HSL replacement
   * if specified, only callsites with exactly this number of arguments will be migrated
   * use has_overrides if additional logic applies
   */
  ?'argument_order' => vec<int>,
  /**
   * does this function have special argument parsing in maybeMutateArguments
   */
  ?'has_overrides' => bool,
  /**
   * look for nearby boolean operations comparing the result of the HSL function
   * with (bool)false, and change false to null
   */
  ?'replace_false_with_null' => bool,
);

final class HSLMigration extends BaseMigration {

  // key is PHPstdlib function name, value is a shape configuring how the migration should work
  const dict<string, HslReplacementConfig> PHP_HSL_REPLACEMENTS = dict[
    // String functions
    'ucwords' => shape('ns' => HslNamespace::STR, 'name' => 'capitalize_words'),
    'ucfirst' => shape('ns' => HslNamespace::STR, 'name' => 'capitalize'),
    'strtolower' => shape('ns' => HslNamespace::STR, 'name' => 'lowercase'),
    'strtoupper' => shape('ns' => HslNamespace::STR, 'name' => 'uppercase'),
    'str_replace' => shape(
      'ns' => HslNamespace::STR,
      'name' => 'replace',
      'argument_order' => vec[2, 0, 1],
    ),
    'str_ireplace' => shape(
      'ns' => HslNamespace::STR,
      'name' => 'replace_ci',
      'argument_order' => vec[2, 0, 1],
    ),
    'strpos' => shape(
      'ns' => HslNamespace::STR,
      'name' => 'search',
      'replace_false_with_null' => true,
    ),
    'stripos' => shape(
      'ns' => HslNamespace::STR,
      'name' => 'search_ci',
      'replace_false_with_null' => true,
    ),
    'strrpos' => shape(
      'ns' => HslNamespace::STR,
      'name' => 'search_last',
      'replace_false_with_null' => true,
    ),
    'implode' => shape(
      'ns' => HslNamespace::STR,
      'name' => 'join',
      'argument_order' => vec[1, 0],
    ),
    'join' => shape(
      'ns' => HslNamespace::STR,
      'name' => 'join',
      'argument_order' => vec[1, 0],
    ),
    'substr_replace' => shape(
      'ns' => HslNamespace::STR,
      'name' => 'splice',
      'has_overrides' => true,
    ),
    'substr' => shape(
      'ns' => HslNamespace::STR,
      'name' => 'slice',
      'has_overrides' => true,
    ),
    'str_repeat' => shape('ns' => HslNamespace::STR, 'name' => 'repeat'),
    'trim' => shape('ns' => HslNamespace::STR, 'name' => 'trim'),
    'ltrim' => shape('ns' => HslNamespace::STR, 'name' => 'trim_left'),
    'rtrim' => shape('ns' => HslNamespace::STR, 'name' => 'trim_right'),
    'strlen' => shape('ns' => HslNamespace::STR, 'name' => 'length'),
    'sprintf' => shape('ns' => HslNamespace::STR, 'name' => 'format'),
    'str_split' => shape('ns' => HslNamespace::STR, 'name' => 'chunk'),
    'strcmp' => shape('ns' => HslNamespace::STR, 'name' => 'compare'),
    'strcasecmp' => shape('ns' => HslNamespace::STR, 'name' => 'compare_ci'),
    'number_format' =>
      shape('ns' => HslNamespace::STR, 'name' => 'format_number'),

    // Math functions
    'round' => shape(
      'ns' => HslNamespace::MATH,
      'name' => 'round',
      'has_overrides' => true,
    ),
    'ceil' => shape('ns' => HslNamespace::MATH, 'name' => 'ceil'),
    'floor' => shape('ns' => HslNamespace::MATH, 'name' => 'floor'),
    'array_sum' => shape('ns' => HslNamespace::MATH, 'name' => 'sum'),
    'intdiv' => shape('ns' => HslNamespace::MATH, 'name' => 'int_div'),
    'exp' => shape('ns' => HslNamespace::MATH, 'name' => 'exp'),
    'abs' => shape('ns' => HslNamespace::MATH, 'name' => 'abs'),
    'base_convert' =>
      shape('ns' => HslNamespace::MATH, 'name' => 'base_convert'),
    'cos' => shape('ns' => HslNamespace::MATH, 'name' => 'cos'),
    'sin' => shape('ns' => HslNamespace::MATH, 'name' => 'sin'),
    'tan' => shape('ns' => HslNamespace::MATH, 'name' => 'tan'),
    'sqrt' => shape('ns' => HslNamespace::MATH, 'name' => 'sqrt'),
    'log' => shape('ns' => HslNamespace::MATH, 'name' => 'log'),
    'min' => shape(
      'ns' => HslNamespace::MATH,
      'name' => 'min',
      'has_overrides' => true,
    ),
    'max' => shape(
      'ns' => HslNamespace::MATH,
      'name' => 'max',
      'has_overrides' => true,
    ),

    // Container functions
    'count' => shape(
      'ns' => HslNamespace::C,
      'name' => 'count',
      'argument_order' => vec[0],
    ),
  ];


  <<__Override>>
  public function migrateFile(string $path, Script $root): Script {
    // find all the function calls
    $nodes = $root->getDescendantsOfType(FunctionCallExpression::class);

    // keep track of any HSL namespaces we may have to add to the top of the file
    $found_namespaces = keyset[];

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

      // build the replacement AST node
      $new_node = $this->replaceFunctionName(
        $node,
        $namespace.'\\'.$replacement,
      );

      // possibly change argument order
      $argument_order = $replace_config['argument_order'] ?? null;
      if (
        $argument_order !== null || ($replace_config['has_overrides'] ?? false)
      ) {
        /*HHAST_FIXME[DontUseAsioJoin]*/
        list($new_node, $found_namespaces) = \HH\Asio\join(
          $this->maybeMutateArgumentsAsync(
            $root,
            $new_node,
            $argument_order,
            $path,
            $found_namespaces,
          ),
        );
      }

      // if we got null back here, it means the function call has unsupported arguments. forget it for now
      if ($new_node === null) {
        continue;
      }

      // we know we're rewriting the node, so now we know we need the namespace
      $found_namespaces[] = $namespace;

      // replace it in the ast
      $root = $root->replace($node, $new_node);

      // potentially change adjacent expressions to check for null instead of false
      if ($replace_config['replace_false_with_null'] ?? false) {
        $root = $this->maybeChangeFalseToNull($root, $new_node);
      }
    }

    if (C\count($found_namespaces) === 0) {
      return $root;
    }

    // add "use namespace" declarations at the top if they aren't already present
    $declarations = vec(
      $root->getDescendantsOfType(INamespaceUseDeclaration::class),
    );
    list($hsl_declarations, $suffixes) = $this->findUseDeclarations(
      $declarations,
    );

    $count_before = C\count($suffixes);

    // add new suffixes to the current list of suffixes
    $suffixes = Keyset\union($suffixes, $found_namespaces);

    // added any new suffixes?
    if (C\count($suffixes) === $count_before) {
      return $root;
    }

    // remove any current use statements for HH\Lib\* namespaces, we'll group them together
    $lists = $root->getDescendantsOfType(NodeList::class);
    foreach ($lists as $list) {
      $children = $list->toVec();
      $filtered = Vec\filter(
        $children,
        $c ==> !C\contains($hsl_declarations, $c),
      );
      if ($children !== $filtered) {
        $root = $root->replace($list, new NodeList($filtered));
      }
    }

    // build a possibly grouped namespace use declaration
    $new_namespace_use_declaration = $this->buildUseDeclaration($suffixes);

    // insert the new node: skip the <?hh sigil and namespace declaration if present,
    // then insert before the first declaration that remains
    foreach ($root->getChildren()['declarations']->getChildren() as $child) {
      if ($child is MarkupSection) {
        continue;
      }

      if ($child is NamespaceDeclaration) {
        $body = $child->getBody();
        // namespace Foo; style declaration, skip over it
        if ($body is NamespaceEmptyBody) {
          continue;
        }
        // namespace Foo { style declaration
        // insert the use statement inside the braces, before the first child
        invariant($body is NamespaceBody, 'expected NamespaceBody');
        $child = $body->getDeclarationsx()->getChildren() |> C\firstx($$);
      }

      if ($child is INamespaceUseDeclaration) {
        // next statement is another use declaration, remove the trailing newline
        $last_token = $new_namespace_use_declaration->getLastTokenx();
        $new_namespace_use_declaration = $new_namespace_use_declaration
          ->replace($last_token, $last_token->withTrailing(null));
      }
      $parent = $root->getParentOfDescendant($child) as NodeList<_>;
      return $root->replace(
        $parent,
        $parent->insertBefore($child, $new_namespace_use_declaration),
      );
    }

    invariant_violation('should not fail to insert new node');
  }

  protected function resolveIntegerArgument(Node $node): ?int {
    if ($node is LiteralExpression) {
      $expr = $node->getExpression();
      if ($expr is DecimalLiteralToken) {
        return (int)$expr->getText();
      }

      // a literal 0 shows as octal
      if ($expr is OctalLiteralToken) {
        return (int)$expr->getText();
      }

      return null;
    }

    if ($node is PrefixUnaryExpression && $node->getOperator() is MinusToken) {
      $val = $this->resolveIntegerArgument($node->getOperand());
      return ($val !== null) ? -1 * $val : null;
    }
    return null;
  }

  // change argument order or structure between PHP function and HSL function if necessary
  protected async function maybeMutateArgumentsAsync(
    Node $root,
    FunctionCallExpression $node,
    ?vec<int> $argument_order,
    string $path,
    keyset<HslNamespace> $found_namespaces,
  ): Awaitable<(?FunctionCallExpression, keyset<HslNamespace>)> {
    $argument_list = $node->getArgumentList();
    invariant($argument_list !== null, 'Function must have arguments');
    $arguments = $argument_list->getChildren();
    $new_argument_list = $argument_list;

    $items = Vec\map(
      $arguments,
      $argument ==> {
        invariant($argument is ListItem<_>, 'expected ListItem');
        return $argument->getItemx();
      },
    );

    // can't handle these ones with wrong number of args yet
    // return null, signaling to caller to skip rewriting this invocation
    if (
      $argument_order !== null && C\count($items) !== C\count($argument_order)
    ) {
      return tuple(null, $found_namespaces);
    }

    // implode argument order is ambiguous
    // when converting to join, check to make sure the second element is a string
    // if the arguments are in the wrong order, reverse them
    // if neither arg is a string, hh_client should complain so we just leave it as is
    $fn_name = $this->getFunctionName($node);
    if ($fn_name === 'Str\\join') {
      $type = await find_type_for_node_async($root, $items[1], $path);
      if ($type === 'string') {
        $argument_order = Vec\reverse($argument_order ?? vec[]);
      }
    } else if ($fn_name === 'Str\\replace' || $fn_name === 'Str\\replace_ci') {
      // str_replace and str_ireplace have two modes:
      // string for search/replace args means replacing a single pattern
      // arrays mean replacing a set of patterns, which we should rewrite as Str\replace_every
      $type = await find_type_for_node_async($root, $items[0], $path);
      if ($type !== 'string') {
        if ($fn_name === 'Str\\replace_ci') {
          // (note there is no Str\replace_every_ci at the moment, so this case is unhandled)
          // bail to skip rewriting this call
          return tuple(null, $found_namespaces);
        }

        // add Dict to set of required namespaces so we can call Dict\associate()
        $found_namespaces[] = HslNamespace::DICT;

        $node = $this->replaceFunctionName($node, 'Str\\replace_every');

        $search_arg = $items[0]->getCode();
        $replace_arg = $items[1]->getCode();
        // replacement dictionary uses keys from first arg, values from second arg
        $expr = 'Dict\\associate('.$search_arg.', '.$replace_arg.')';
        $replacement_patterns = $this->expressionFromCode($expr);

        $new_argument_list = new NodeList(vec[
          new ListItem(
            $items[2],
            new CommaToken(null, new NodeList(vec[new WhiteSpace(' ')])),
          ),
          new ListItem($replacement_patterns, null),
        ]);
        return tuple(
          $node->replace($argument_list, $new_argument_list),
          $found_namespaces,
        );
      }
    } else if ($fn_name === 'Str\\slice' && C\count($items) === 3) {
      // check for negative length arguments to Str\slice, which will throw a runtime exception
      $length = $this->resolveIntegerArgument($items[2]);
      if ($length !== null && $length < 0) {
        $offset = $this->resolveIntegerArgument($items[1]);
        if ($offset === null) {
          // skip this one if we don't have a sensible offset
          return tuple(null, $found_namespaces);
        }

        // if the offset is negative too, it's pretty simple
        // we can compute the correct length as abs(offset) + length and rewrite teh node
        if ($offset < 0) {
          $rewrite_length_value = Math\abs($offset) + $length;
          $new_length = new ListItem(
            new LiteralExpression(new DecimalLiteralToken(
              null,
              null,
              (string)$rewrite_length_value,
            )),
            null,
          );
        } else {
          // with a positive offset this is harder
          // we need to replace this arg with a more complex expression
          // based on the length of the string
          $haystack = $items[0]->getCode();
          $new_length = $this->expressionFromCode(
            'Str\\length('.$haystack.') - '.($offset + Math\abs($length)),
          );
        }

        // rewrite args list
        $new_argument_list = $argument_list->replace($items[2], $new_length);
      }
    } else if ($fn_name === 'Str\\splice' && C\count($items) === 4) {
      // check for negative length arguments to Str\splice, which will throw a runtime exception
      // this is currently unhandled, so we just bail by returning null if we find it
      $length = $this->resolveIntegerArgument($items[3]);
      if ($length !== null && $length < 0) {
        return tuple(null, $found_namespaces);
      }
    } else if (
      ($fn_name === 'Math\\max' || $fn_name === 'Math\\min') &&
      C\count($items) !== 1
    ) {
      // PHP max() and min() either take a list of variadic args, or an array of args
      // in HSL, max and min want a single Traversable arg, while maxva and minva are variadic
      return tuple(
        $this->replaceFunctionName($node, $fn_name.'va'),
        $found_namespaces,
      );
    } else if ($fn_name === 'Math\\round' && C\count($items) > 2) {
      // can't handle the optional third argument of round()
      return tuple(null, $found_namespaces);
    }

    if ($argument_order !== null) {
      $new_items = vec[];
      foreach ($argument_order as $index) {
        $new_items[] = $items[$index];
      }

      $new_argument_list = vec[];

      foreach ($arguments as $i => $argument) {
        invariant($argument is ListItem<_>, 'expected ListItem');
        $new_argument_list[] = $argument->replace(
          $argument->getItemx(),
          $new_items[(int)$i],
        );
      }

      $new_argument_list = new NodeList($new_argument_list);
    }

    return tuple(
      $node->replace($argument_list, $new_argument_list),
      $found_namespaces,
    );
  }

  // many PHP functions can return false, and their HSL counterparts return null instead
  // this will replace false with null in binary expressions like === false and !=== false
  protected function maybeChangeFalseToNull(
    Script $root,
    FunctionCallExpression $node,
  ): Script {
    $stack = $root->getAncestorsOfDescendant($node);
    invariant(!C\is_empty($stack), 'did not find node in root');
    invariant(C\lastx($stack) === $node, 'expected node at top of stack');
    $stack_count = C\count($stack);
    $parent = $stack[$stack_count - 2];

    if (!($parent is BinaryExpression)) {
      return $root;
    }

    if ($parent->getLeftOperand() === $node) {
      $check = $parent->getRightOperand();
    } else {
      $check = $parent->getLeftOperand();
    }

    if ($check is LiteralExpression) {
      $expression = $check->getExpression();
      if ($expression is BooleanLiteralToken) {
        if (Str\lowercase($expression->getText()) === 'false') {
          $new = new NullLiteralToken(
            $expression->getLeading(),
            $expression->getTrailing(),
          );
          $root = $root->replace($expression, $new);
        }
      }
    }

    return $root;
  }

  // find all HH\Lib\* namespace use declarations
  // returns a tuple containing the declaration nodes, the HSL namespace suffixes used
  protected function findUseDeclarations(
    vec<INamespaceUseDeclaration> $declarations,
  ): (vec<INamespaceUseDeclaration>, vec<HslNamespace>) {

    $search = vec['HH', 'Lib'];
    $nodes = vec[];
    $suffixes = vec[];
    foreach ($declarations as $decl) {
      // we only care about "use namespace" directives
      if (!($decl->getKind() is NamespaceToken)) {
        continue;
      }

      if ($decl is NamespaceGroupUseDeclaration) {
        // group declarations: does prefix match?
        $parts = $decl->getPrefix()
          ->getParts()
          ->getChildrenOfItemsOfType(NameToken::class);
        if (C\count($parts) !== 2) {
          continue;
        }
        $found_prefix = true;
        foreach ($parts as $i => $token) {
          if ($token?->getText() === $search[$i]) {
            continue;
          }
          $found_prefix = false;
          break;
        }

        // prefix didn't match? skip this declaration
        if (!$found_prefix) {
          continue;
        }

        // prefix matches: add node to list of nodes
        $nodes[] = $decl;

        $clauses = vec(
          $decl->getClauses()->getDescendantsOfType(NamespaceUseClause::class),
        );
        $suffixes = $clauses
          |> Vec\map(
            $$,
            $c ==> {
              $n = $c->getName();
              return $n is NameToken
                ? HslNamespace::coerce($n->getText())
                : null;
            },
          )
          |> Vec\filter_nulls($$)
          |> Vec\concat($suffixes, $$);
      } else {
        invariant(
          $decl is NamespaceUseDeclaration,
          'Unhandled declaration type',
        );

        $clauses = $decl->getClauses()->getChildrenOfItems();
        foreach ($clauses as $clause) {

          $name = $clause->getName();
          if ($name is QualifiedName) {
            $parts = $name->getParts()
              ->getChildrenOfItemsOfType(NameToken::class);
            if (C\count($parts) !== 3) {
              continue;
            }

            foreach ($parts as $i => $token) {
              if ($i < 2 && $token?->getText() !== $search[$i]) {
                break;
              }

              if ($i === 2) {
                // we found an HH\Lib\* use statement, add the node and suffix
                $nodes[] = $decl;
                $ns = HslNamespace::coerce($token?->getText());
                if ($ns !== null) {
                  $suffixes[] = $ns;
                }
              }
            }
          }
        }
      }
    }
    return tuple($nodes, $suffixes);
  }

  // get a node for a use namespace declaration
  protected function buildUseDeclaration(
    keyset<HslNamespace> $suffixes,
  ): INamespaceUseDeclaration {
    if (C\count($suffixes) > 1) {
      // make a grouped use declaration
      $ns = '{'.Str\join($suffixes, ', ').'}';
    } else {
      // single namespace use declaration
      $ns = C\firstx($suffixes);
    }
    return $this->nodeFromCode(
      "\nuse namespace HH\\Lib\\".$ns.";\n",
      INamespaceUseDeclaration::class,
    );
  }

  // extract the function name from an expression
  protected function getFunctionName(FunctionCallExpression $node): ?string {
    $receiver = $node->getReceiver();

    if ($receiver is NameToken) {
      return $receiver->getText();
    } else if ($receiver is QualifiedName) {
      foreach ($receiver->getParts()->getChildren() as $child) {
        $item = $child->getItemUNTYPED();
        if (!$child->hasItem() && $child->getSeparator() is BackslashToken) {
          // leading backslash such as \implode(), skip over this to get the name token
          continue;
        } else if ($item is NameToken) {
          return $item->getText();
        }
        return null;
      }
    }

    return null;
  }

  protected function replaceFunctionName(
    FunctionCallExpression $node,
    string $new_name,
  ): FunctionCallExpression {
    // build the replacement AST node
    $receiver = $node->getReceiver();
    if ($receiver is NameToken) {
      $new_receiver = new NameToken(
        $receiver->getLeading(),
        $receiver->getTrailing(),
        $new_name,
      );
    } else {
      invariant($receiver is QualifiedName, 'expected QualifiedName');
      $first_item = $receiver->getParts()->getChildren() |> C\firstx($$);
      invariant($first_item is ListItem<_>, 'expected ListItem');

      $new_receiver = new NameToken(
        $first_item->getSeparatorx()->getLeading(),
        null,
        $new_name,
      );
    }

    return $node->replace($receiver, $new_receiver);
  }

  protected function nodeFromCode<T as Node>(
    string $code,
    classname<T> $expected,
  ): T {
    /*HHAST_FIXME[DontUseAsioJoin]*/
    $script = \HH\Asio\join(
      from_file_async(File::fromPathAndContents('/dev/null', $code)),
    );
    $node = $script->getDeclarations()->getFirstDescendantOfType($expected);
    invariant(
      $node !== null,
      "Failed to find node of type '%s' in code '%s'",
      $expected,
      $code,
    );
    return $node;
  }

  protected function expressionFromCode(string $code): IExpression {
    /*HHAST_FIXME[DontUseAsioJoin]*/
    return \HH\Asio\join(self::expressionFromCodeAsync($code));
  }
}
