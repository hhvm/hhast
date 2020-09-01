/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Dict, Str, Vec};

final class XHPLibV3ToV4Migration extends BaseMigration {

  const dict<string, string> DEFAULT_NS_ALIASES = dict[
    'Facebook\\XHP\\ChildValidation' => 'XHPChild',
    'Facebook\\XHP\\Core' => 'x',
  ];

  const dict<string, string> RENAMED_TYPES = dict[
    'XHPRoot' => 'Facebook\\XHP\\Core\\node',
    ':x:element' => 'Facebook\\XHP\\Core\\element',
    ':x:primitive' => 'Facebook\\XHP\\Core\\primitive',
    'XHPUnsafeRenderable' => 'Facebook\\XHP\\UnsafeRenderable',
    'XHPAlwaysValidChild' => 'Facebook\\XHP\\AlwaysValidChild',
    'XHPChildValidation' => 'Facebook\\XHP\\ChildValidation\\Validation',
    'XHPUnsafeAttributeValue' =>
      'Facebook\\XHP\\UnsafeAttributeValue_DEPRECATED',
  ];

  const dict<string, string> RENAMED_FUNCTIONS = dict[
    'Facebook\\XHP\\ChildValidation\\anyNumberOf' =>
      'Facebook\\XHP\\ChildValidation\\any_number_of',
    'Facebook\\XHP\\ChildValidation\\anyOf' =>
      'Facebook\\XHP\\ChildValidation\\any_of',
    'Facebook\\XHP\\ChildValidation\\atLeastOneOf' =>
      'Facebook\\XHP\\ChildValidation\\at_least_one_of',
    'Facebook\\XHP\\ChildValidation\\ofType' =>
      'Facebook\\XHP\\ChildValidation\\of_type',
  ];

  const dict<string, string> ASYNCIFY_METHODS = dict[
    // base class => method name
    'Facebook\\XHP\\Core\\element' => 'render',
    'Facebook\\XHP\\Core\\primitive' => 'stringify',
    'Facebook\\XHP\\UnsafeRenderable' => 'toHTMLString',
  ];
  const ASYNC_METHOD_SUFFIX = 'Async';

  // grep -Phor "(?<=xhp class )[a-zA-Z0-9_]+" xhp-lib/src/html/tags \
  //   | sort | tr "\n" , | sed "s/,/', '/g" | fold -w 76 -s
  // @hackfmt-ignore
  const keyset<string> HTML_TAGS = keyset[
    'a', 'abbr', 'address', 'area', 'article', 'aside', 'audio', 'b', 'base',
    'bdi', 'bdo', 'blockquote', 'body', 'br', 'button', 'canvas', 'caption',
    'cite', 'code', 'col', 'colgroup', 'conditional_comment', 'data',
    'datalist', 'dd', 'del', 'details', 'dfn', 'dialog', 'div', 'dl',
    'doctype', 'dt', 'em', 'embed', 'fieldset', 'figcaption', 'figure',
    'footer', 'form', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'head', 'header',
    'hgroup', 'hr', 'html', 'i', 'iframe', 'img', 'input', 'ins', 'kbd',
    'keygen', 'label', 'legend', 'li', 'link', 'main', 'map', 'mark', 'menu',
    'menuitem', 'meta', 'meter', 'nav', 'noscript', 'object', 'ol', 'optgroup',
    'option', 'output', 'p', 'param', 'picture', 'pre', 'progress', 'q', 'rb',
    'rp', 'rt', 'rtc', 'ruby', 's', 'samp', 'script', 'section', 'select',
    'slot', 'small', 'source', 'span', 'strong', 'style', 'sub', 'summary',
    'sup', 'table', 'tbody', 'td', 'template', 'textarea', 'tfoot', 'th',
    'thead', 'time', 'title', 'tr', 'track', 'tt', 'u', 'ul', 'var', 'video',
    'wbr',
  ];
  const HTML_NS = 'Facebook\\XHP\\HTML';

  // Keep track of `use` clauses to be added to this file. If there are multiple
  // namespaces in the file (this should be rare), we add the `use`s globally.
  private dict<string, string> $newNamespaces = dict[];
  private dict<string, string> $newTypes = dict[];

  <<__Override>>
  public function migrateFile(string $_path, Script $ast): Script {
    $this->newNamespaces = dict[];
    $this->newTypes = dict[];

    foreach ($ast->getNamespaces() as $ns) {
      foreach ($ns['children']->getChildren() as $child) {
        $ast = $ast->replace(
          $child,
          $child->rewrite(
            ($node, $_) ==> $this->migrateNode($ast, $ns, $node),
            vec[],
          ),
        );
      }
    }

    return $this->addUseDeclarations($ast);
  }

  /**
   * - migrate type specifiers according to RENAMED_TYPES + HTML_TAGS
   * - migrate function calls according to RENAMED_FUNCTIONS
   * - add `use type` for any XHP open/close tags that are HTML_TAGS
   * - asyncify methods if extending a base class from ASYNCIFY_METHODS
   */
  private function migrateNode(
    Script $ast,
    Script::TNamespace $ns,
    Node $node,
  ): Node {
    if ($node is SimpleTypeSpecifier && $node->getSpecifier() is INameishNode) {
      return $node->withSpecifier(
        $this->migrateName(
          $ns,
          $node->getSpecifier() as INameishNode,
          self::allRenamedTypes(),
          ($name, $node) ==> resolve_type($name, $ast, $node)['name'],
        ),
      );
    } else if (
      $node is ScopeResolutionExpression &&
      $node->getQualifier() is INameishNode
    ) {
      return $node->withQualifier(
        $this->migrateName(
          $ns,
          $node->getQualifier() as INameishNode,
          self::allRenamedTypes(),
          ($name, $node) ==> resolve_type($name, $ast, $node)['name'],
        ),
      );
    } else if (
      $node is FunctionCallExpression && $node->getReceiver() is INameishNode
    ) {
      return $node->withReceiver(
        $this->migrateName(
          $ns,
          $node->getReceiver() as INameishNode,
          self::RENAMED_FUNCTIONS,
          ($name, $node) ==> resolve_function($name, $ast, $node),
        ),
      );
    } else if ($node is XHPOpen || $node is XHPClose) {
      $this->useHTMLTag($ns, $node->getName());
      return $node;
    } else if ($node is ClassishDeclaration) {
      return $this->migrateClass(
        $node,
        ($name, $node) ==> __Private\Resolution\resolve_name(
          $name,
          $ast,
          $node,
          Dict\merge(
            $ns['uses']['namespaces'],
            Dict\flip($this->newNamespaces),
          ),
        ),
      );
    } else {
      return $node;
    }
  }

  <<__Memoize>>
  private static function allRenamedTypes(): dict<string, string> {
    return Dict\merge(
      self::RENAMED_TYPES,
      Dict\pull(
        self::HTML_TAGS,
        $tag ==> self::HTML_NS.'\\'.$tag,
        $tag ==> ':'.$tag,
      ),
    );
  }

  /**
   * If the new name's namespace is already `use`d, respect its current alias.
   * Otherwise, add a `use` clause according to self::DEFAULT_NS_ALIASES.
   */
  private function migrateName(
    Script::TNamespace $ns,
    INameishNode $old_name_node,
    dict<string, string> $old_to_new,
    (function(string, Node): string) $resolver,
  ): INameishNode {
    $old_name = $resolver(self::withoutTrivia($old_name_node), $old_name_node);
    $new_name = idx($old_to_new, $old_name);
    if ($new_name is null) {
      return $old_name_node;
    }

    list($new_ns, $new_name) = self::split($new_name);
    $new_ns as nonnull;

    $alias = C\find_key($ns['uses']['namespaces'], $val ==> $val === $new_ns);
    if ($alias is null) {
      $alias = idx(self::DEFAULT_NS_ALIASES, $new_ns) ??
        self::split($new_ns)[1];
      $this->newNamespaces[$new_ns] = $alias;
    }

    return self::getNameNode($alias.'\\'.$new_name, $old_name_node);
  }

  /**
   * HTML tags don't need to be migrated, just add the necessary `use type`
   * clauses.
   */
  private function useHTMLTag(
    Script::TNamespace $ns,
    XHPElementNameToken $name_node,
  ): void {
    $name = self::withoutTrivia($name_node);
    if (!C\contains_key(self::HTML_TAGS, $name)) {
      return;
    }

    $qualified = self::HTML_NS.'\\'.$name;
    if (C\contains($ns['uses']['types'], $qualified)) {
      // Nothing to do if the type is already `use`d. We ignore the case when
      // it's `use`d with an alias, since something unexpected is happening that
      // likely needs manual migration.
      return;
    }

    $this->newTypes[$qualified] = $name;
  }

  /**
   * If the class extends one of the core XHP base classes, asyncify the
   * relevant method. We don't handle classes that don't extend the base class
   * directly or other special cases -- those are better migrated manually.
   */
  private function migrateClass(
    ClassishDeclaration $class,
    (function(string, Node): string) $type_resolver,
  ): ClassishDeclaration {
    if (
      !$class->getKeyword() is ClassToken ||
      $class->getExtendsList() is null ||
      $class->getBody()->getElements() is null
    ) {
      return $class;
    }

    $method_name = idx(
      self::ASYNCIFY_METHODS,
      $type_resolver(
        self::withoutTrivia($class->getExtendsListx()),
        $class->getExtendsListx(),
      ),
    );
    if ($method_name is null) {
      return $class;
    }

    foreach ($class->getBody()->getElementsx()->getChildren() as $decl) {
      if (!$decl is MethodishDeclaration) {
        continue;
      }
      $new_header = $decl->getFunctionDeclHeader();
      if (self::withoutTrivia($new_header->getName()) !== $method_name) {
        continue;
      }
      // asyncify return type
      if ($new_header->hasType()) {
        $new_header = $new_header->withType(
          self::asyncifyType($new_header->getTypex()),
        );
      }
      // add `async` keyword
      if (
        $new_header->hasModifiers() && !$new_header->getModifiersx()->isEmpty()
      ) {
        $new_header = $new_header->withModifiers(NodeList::createMaybeEmptyList(
          Vec\concat(
            $new_header->getModifiersx()->getChildren(),
            vec[new AsyncToken(null, self::space())],
          ),
        ));
      } else {
        // If there are no existing modifiers, also move leading Trivia from
        // the `function` token to the new `async` token.
        $new_header = $new_header
          ->withModifiers(NodeList::createMaybeEmptyList(vec[
            new AsyncToken(
              $new_header->getKeyword()->getLeading(),
              self::space(),
            ),
          ]))
          ->withKeyword($new_header->getKeyword()->withLeading(null));
      }
      return $class->replaceDescendant(
        $decl->getFunctionDeclHeader(),
        // append `Async` to method name
        $new_header->withName(
          new NameToken(
            $new_header->getName()->getFirstTokenx()->getLeading(),
            $new_header->getName()->getLastTokenx()->getTrailing(),
            $method_name.self::ASYNC_METHOD_SUFFIX,
          ),
        ),
      );
    }

    return $class;
  }

  private static function asyncifyType(ITypeSpecifier $type): ITypeSpecifier {
    if ($type is AttributizedSpecifier) {
      // Try saying 10 times very quickly:
      return $type->withType(self::asyncifyType($type->getType()));
    }
    return new GenericTypeSpecifier(
      new NameToken($type->getFirstTokenx()->getLeading(), null, 'Awaitable'),
      new TypeArguments(
        new LessThanToken(null, null),
        NodeList::createMaybeEmptyList(vec[
          new ListItem(
            $type->withFirstTokenLeading(null)->withLastTokenTrailing(null),
            null,
          ),
        ]),
        new GreaterThanToken(null, $type->getLastTokenx()->getTrailing()),
      ),
    );
  }

  /**
   * Add all `use` declarations that have been aggregated in $this->newTypes and
   * $this->newNamespaces to the correct place in $ast.
   */
  private function addUseDeclarations(Script $ast): Script {
    if (C\is_empty($this->newNamespaces) && C\is_empty($this->newTypes)) {
      return $ast;
    }

    // Figure out where to put the new `use` declarations.
    $insert_into = $ast->getDeclarations();
    $insert_at = 0;

    // If there is exactly one namespace in the file (common case), we want to
    // put the `use`s inside it. Otherwise (should be rare), they'll be global.
    if (C\count($ast->getNamespaces()) === 1) {
      foreach ($insert_into->getChildren() as $idx => $decl) {
        if ($decl is NamespaceDeclaration) {
          $body = $decl->getBody();
          if ($body is NamespaceBody) {
            // Put the `use`s inside the `namespace Foo { ... }` body.
            $insert_into = $body->getDeclarations() as nonnull;
            break;
          } else {
            $body as NamespaceEmptyBody;
            // Put the `use`s after the `namespace Foo;` line.
            $insert_at = $idx + 1;
            break;
          }
        }
      }
    }

    // If there are any existing `use` declarations in the scope we've chosen
    // above, put the new ones after the last existing one.
    for ($idx = $insert_at; $idx < $insert_into->getCount(); ++$idx) {
      $decl = $insert_into->getChildren()[$idx];
      if ($decl is NamespaceDeclaration) {
        // We've reached the next (possibly first) namespace.
        break;
      } else if ($decl is NamespaceUseDeclaration) {
        $insert_at = $idx + 1;
      }
    }

    return $ast->replace(
      $insert_into,
      NodeList::createMaybeEmptyList(Vec\concat(
        Vec\take($insert_into->getChildren(), $insert_at),
        self::getUseDeclarations(
          new NamespaceToken(null, null),
          $this->newNamespaces,
        ),
        self::getUseDeclarations(new TypeToken(null, null), $this->newTypes),
        Vec\drop($insert_into->getChildren(), $insert_at),
      )),
    );
  }

  /**
   * All `use` declarations of one kind (namespace/type).
   */
  private static function getUseDeclarations(
    Token $kind,
    dict<string, string> $names,
  ): vec<INamespaceUseDeclaration> {
    // Group together names that only differ in their last part.
    $grouped = dict[];
    foreach ($names as $name => $alias) {
      list($ns, $name) = self::split($name);
      $ns as nonnull;
      $grouped[$ns] ??= dict[];
      $grouped[$ns][$name] = $alias;
    }

    return Dict\map($grouped, $names ==> Dict\sort_by_key($names))
      |> Dict\sort_by_key($$)
      |> Vec\map_with_key(
        $$,
        ($ns, $names) ==> C\count($names) === 1
          ? self::getUseDeclaration(
              $kind,
              $ns.'\\'.C\first_keyx($names),
              C\onlyx($names),
            )
          : self::getGroupUseDeclaration($kind, $ns, $names),
      );
  }

  /**
   * e.g. `use Foo\Bar;` or `use Foo\Bar as Baz;`
   */
  private static function getUseDeclaration(
    Token $kind,
    string $name,
    string $alias,
  ): NamespaceUseDeclaration {
    return new NamespaceUseDeclaration(
      new UseToken(null, self::space()),
      $kind->withTrailing(self::space()),
      NodeList::createMaybeEmptyList(vec[
        new ListItem(self::getUseClause($name, $alias), null),
      ]),
      new SemicolonToken(null, self::endl()),
    );
  }

  /**
   * e.g. `use Foo\Bar\{Baz, Herp as Derp};`
   */
  private static function getGroupUseDeclaration(
    Token $kind,
    string $prefix,
    dict<string, string> $names,
  ): NamespaceGroupUseDeclaration {
    return new NamespaceGroupUseDeclaration(
      new UseToken(null, self::space()),
      $kind->withTrailing(self::space()),
      Str\split($prefix, '\\')
        |> Vec\map(
          $$,
          $part ==> new ListItem(
            new NameToken(null, null, $part),
            new BackslashToken(null, null),
          ),
        )
        |> NodeList::createMaybeEmptyList($$)
        |> new QualifiedName($$),
      new LeftBraceToken(null, null),
      Vec\map_with_key(
        $names,
        ($name, $alias) ==> new ListItem(
          self::getUseClause($name, $alias),
          $name === C\last_keyx($names)
            ? null
            : new CommaToken(null, self::space()),
        ),
      )
        |> NodeList::createMaybeEmptyList($$),
      new RightBraceToken(null, null),
      new SemicolonToken(null, self::endl()),
    );
  }

  /**
   * e.g. `Foo\Bar` or `Foo\Bar as Baz`
   */
  private static function getUseClause(
    string $name,
    string $alias,
  ): NamespaceUseClause {
    list($_, $last_part) = self::split($name);
    return new NamespaceUseClause(
      null,
      self::getNameNode($name),
      $last_part === $alias ? null : new AsToken(self::space(), null),
      $last_part === $alias ? null : new NameToken(self::space(), null, $alias),
    );
  }

  /**
   * Create a NameToken or QualifiedName based on whether $name contains any
   * backslashes. Optionally copy over whitespace/comments from $old_name_node.
   */
  private static function getNameNode(
    string $name,
    ?INameishNode $old_name_node = null,
  ): INameishNode {
    $parts = Str\split($name, '\\');

    if (C\count($parts) === 1) {
      $ret = new NameToken(null, null, $name);
    } else {
      $ret = Vec\map_with_key(
        $parts,
        ($idx, $part) ==> new ListItem(
          new NameToken(null, null, $part),
          $idx === C\last_keyx($parts) ? null : new BackslashToken(null, null),
        ),
      )
        |> NodeList::createMaybeEmptyList($$)
        |> new QualifiedName($$);
    }

    // Copy over Trivia from $old_name_node.
    if ($old_name_node is null) {
      return $ret;
    }

    return $ret
      ->withFirstTokenLeading($old_name_node->getFirstTokenx()->getLeading())
      ->withLastTokenTrailing($old_name_node->getLastTokenx()->getTrailing());
  }

  /**
   * 'Foo\Bar\Baz' -> tuple('Foo\Bar', 'Baz')
   */
  private static function split(string $qualified_name): (?string, string) {
    $pos = Str\search_last($qualified_name, '\\');
    return $pos is null
      ? tuple(null, $qualified_name)
      : tuple(
          Str\slice($qualified_name, 0, $pos),
          Str\slice($qualified_name, $pos + 1),
        );
  }

  /**
   * `Foo \ Bar \ Baz // comment` -> `Foo\Bar\Baz`
   */
  private static function withoutTrivia(Node $node): string {
    return $node->getDescendantsOfType(Token::class)
      |> Vec\map($$, $token ==> $token->getText())
      |> Str\join($$, '');
  }

  private static function space(): NodeList<WhiteSpace> {
    return NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]);
  }

  private static function endl(): NodeList<EndOfLine> {
    return NodeList::createMaybeEmptyList(vec[new EndOfLine("\n")]);
  }
}
