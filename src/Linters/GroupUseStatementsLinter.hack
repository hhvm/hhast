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

final class GroupUseStatementsLinter extends AutoFixingASTLinter {
  const type TNode = Script;
  const type TContext = Script;

  <<__Override>>
  public function getLintErrorForNode(
    Script $_context,
    Script $script,
  ): ?ASTLintError {
    $error = false;

    $uses = dict[
      'function' => vec[],
      'namespace' => vec[],
      'type' => vec[],
    ];

    $result = dict[
      'function' => dict[],
      'namespace' => dict[],
      'type' => dict[],
    ];

    $use_kind = (INamespaceUseDeclaration $node): ?string ==> {
      foreach ($node->getChildren() as $child) {
        if ($child is FunctionToken) {
          return 'function';
        }

        if ($child is NamespaceToken) {
          return 'namespace';
        }

        if ($child is TypeToken) {
          return 'type';
        }
      }

      return null;
    };

    foreach (
      $script->getDescendantsOfType(INamespaceUseDeclaration::class) as
        $use_decl
    ) {
      if ($use_decl is NamespaceUseDeclaration) {
        foreach (
          $use_decl->getDescendantsOfType(NamespaceUseClause::class) as
            $use_clause
        ) {
          $parts = vec[];

          $name_leading = vec[];
          $name_trailing = vec[];

          $name = $use_clause->getName();
          if ($name is NameToken) {
            if ($name->getLeading()->isList()) {
              foreach ($name->getLeading()->getChildren() as $leading) {
                $name_leading[] = $leading;
              }
            }

            if ($name->getTrailing()->isList()) {
              foreach ($name->getTrailing()->getChildren() as $trailing) {
                $name_trailing[] = $trailing;
              }
            }

            $parts[] = $name->getText();
          } else if ($name is QualifiedName) {
            foreach (
              $name->getDescendantsOfType(NameToken::class) as $name_token
            ) {
              if ($name_token->getLeading()->isList()) {
                foreach ($name_token->getLeading()->getChildren() as $leading) {
                  $name_leading[] = $leading;
                }
              }

              if ($name_token->getTrailing()->isList()) {
                foreach (
                  $name_token->getTrailing()->getChildren() as $trailing
                ) {
                  $name_trailing[] = $trailing;
                }
              }

              $parts[] = $name_token->getText();
            }
          }

          if (C\count($parts) > 1) {
            $alias = $use_clause->getAlias();

            $alias_trailing = vec[];
            if ($alias is nonnull) {
              if ($alias->getTrailing()->isList()) {
                foreach ($alias->getTrailing()->getChildren() as $trailing) {
                  $alias_trailing[] = $trailing;
                }
              }
            }

            $kind = $use_kind($use_decl);
            if ($kind is nonnull) {
              $uses[$kind][] = tuple(
                $use_decl,
                $parts,
                $alias?->getText(),
                $name_leading,
                $name_trailing,
                $alias_trailing,
                vec[],
              );
            }
          }
        }
      }

      if ($use_decl is NamespaceGroupUseDeclaration) {
        $parts = vec[];

        foreach (
          $use_decl->getChildrenOfType(QualifiedName::class) as $qualified_name
        ) {
          foreach (
            $qualified_name->getDescendantsOfType(NameToken::class) as
              $name_token
          ) {
            $parts[] = $name_token->getText();
          }
        }

        foreach (
          $use_decl->getDescendantsOfType(NamespaceUseClause::class) as
            $use_clause
        ) {
          $parts_item = vec[];

          $name_leading = vec[];
          $name_trailing = vec[];
          $comma_trailing = vec[];

          foreach ($use_decl->getDescendantsOfType(ListItem::class) as $item) {
            if ($item->isAncestorOf($use_clause)) {
              $comma_tokens = vec($item->getChildrenOfType(CommaToken::class));
              if (C\count($comma_tokens) > 0) {
                if ($comma_tokens[0]->getTrailing()->isList()) {
                  foreach (
                    $comma_tokens[0]->getTrailing()->getChildren() as $trailing
                  ) {
                    $comma_trailing[] = $trailing;
                  }
                }
              }
              break;
            }
          }

          $name = $use_clause->getName();
          if ($name is NameToken) {
            if ($name->getLeading()->isList()) {
              foreach ($name->getLeading()->getChildren() as $leading) {
                $name_leading[] = $leading;
              }
            }

            if ($name->getTrailing()->isList()) {
              foreach ($name->getTrailing()->getChildren() as $trailing) {
                $name_trailing[] = $trailing;
              }
            }

            $parts_item[] = $name->getText();
          } else if ($name is QualifiedName) {
            foreach (
              $name->getDescendantsOfType(NameToken::class) as $name_token
            ) {
              if ($name_token->getLeading()->isList()) {
                foreach ($name_token->getLeading()->getChildren() as $leading) {
                  $name_leading[] = $leading;
                }
              }

              if ($name_token->getTrailing()->isList()) {
                foreach (
                  $name_token->getTrailing()->getChildren() as $trailing
                ) {
                  $name_trailing[] = $trailing;
                }
              }

              $parts_item[] = $name_token->getText();
            }
          }

          $parts_item = Vec\concat($parts, $parts_item);
          if (C\count($parts_item) > 1) {
            $alias = $use_clause->getAlias();

            $alias_trailing = vec[];
            if ($alias is nonnull) {
              if ($alias->getTrailing()->isList()) {
                foreach ($alias->getTrailing()->getChildren() as $trailing) {
                  $alias_trailing[] = $trailing;
                }
              }
            }

            $kind = $use_kind($use_decl);
            if ($kind is nonnull) {
              $uses[$kind][] = tuple(
                $use_decl,
                $parts_item,
                $alias?->getText(),
                $name_leading,
                $name_trailing,
                $alias_trailing,
                $comma_trailing,
              );
            }
          }
        }
      }
    }

    foreach ($uses as $kind => $use_kind) {
      foreach ($use_kind as $use) {
        list(
          $node,
          $parts,
          $alias,
          $name_leading,
          $name_trailing,
          $alias_trailing,
          $comma_trailing,
        ) = $use;

        $namespace = Str\join(Vec\take($parts, C\count($parts) - 1), '\\');
        $name = Str\join(Vec\drop($parts, C\count($parts) - 1), '\\');

        if (!C\contains_key($result[$kind], $namespace)) {
          $result[$kind][$namespace] = tuple(vec[], vec[]);
        } else {
          if (
            C\count($result[$kind][$namespace][0]) > 1 ||
            $result[$kind][$namespace][0][0] !== $node
          ) {
            $error = true;
          }
        }

        if (!C\contains($result[$kind][$namespace][0], $node)) {
          $result[$kind][$namespace][0][] = $node;
        }

        if (
          Dict\filter($result[$kind][$namespace][1], (
            (
              string,
              ?string,
              vec<Trivia>,
              vec<Trivia>,
              vec<Trivia>,
              vec<Trivia>,
            ) $n,
          ) ==> {
            return $n[0] === $name && $n[1] === $alias;
          })
          |> C\count($$) === 0
        ) {
          $drop = 0;
          foreach ($name_leading as $leading) {
            if (!$leading is WhiteSpace && !$leading is EndOfLine) {
              break;
            }

            $drop++;
          }
          $name_leading = Vec\drop($name_leading, $drop);

          $take_trailing = (vec<Trivia> $trailings) ==> {
            $take = C\count($trailings);
            foreach (Vec\reverse($trailings) as $trailing) {
              if (!$trailing is WhiteSpace && !$trailing is EndOfLine) {
                break;
              }

              $take--;
            }
            return Vec\take($trailings, $take);
          };

          $name_trailing = $take_trailing($name_trailing);
          $alias_trailing = $take_trailing($alias_trailing);
          $comma_trailing = $take_trailing($comma_trailing);

          $result[$kind][$namespace][1][] = tuple(
            $name,
            $alias,
            $name_leading,
            $name_trailing,
            $alias_trailing,
            $comma_trailing,
          );
        }
      }
    }

    if ($error) {
      return new ASTLintError(
        $this,
        'Use statements should be grouped',
        $script,
        () ==> $this->getFixedNode($script, Dict\map($result, (
          $result_kind,
        ) ==> {
          return Dict\filter($result_kind, ($value) ==> C\count($value[0]) > 1);
        })),
      );
    }

    return null;
  }

  public function getFixedNode(
    Script $script,
    dict<
      string,
      dict<
        string,
        (
          vec<INamespaceUseDeclaration>,
          vec<(
            string,
            ?string,
            vec<Trivia>,
            vec<Trivia>,
            vec<Trivia>,
            vec<Trivia>,
          )>,
        ),
      >,
    > $result,
  ): Script {
    foreach ($result as $kind => $result_kind) {
      foreach ($result_kind as $namespace => list($nodes, $names)) {
        $names = Vec\sort_by($names, ($name) ==> $name[0].'-'.$name[1] ?? '');
        $names_count = C\count($names);

        $length = 8 +
          Str\length($kind) +
          Str\length($namespace) +
          (
            C\reduce(
              $names,
              ($l, $name) ==> {
                list(
                  $name,
                  $alias,
                  $name_leading,
                  $name_trailing,
                  $alias_trailing,
                  $comma_trailing,
                ) = $name;

                return $l +
                  Str\length($name) +
                  ($alias is nonnull ? 4 + Str\length($alias) : 0) +
                  C\reduce(
                    Vec\concat(
                      $name_leading,
                      $name_trailing,
                      $alias_trailing,
                      $comma_trailing,
                    ),
                    ($lt, $trivia) ==> Str\length($trivia->getCode()),
                    0,
                  );
              },
              0,
            )
          );

        $multiple = false;
        if ($length > 80) {
          $multiple = true;
        }

        $i = 0;
        foreach ($nodes as $node) {
          if ($i === 0) {
            $use_token = $node->getDescendantsOfType(UseToken::class)[0] ??
              null;
            $semicolumn_token =
              $node->getDescendantsOfType(SemicolonToken::class)[0] ?? null;

            $script = $script->replace($node, new NamespaceGroupUseDeclaration(
              new UseToken(
                $use_token is nonnull ? $use_token->getLeading() : null,
                new NodeList(vec[new WhiteSpace(' ')]),
              ),
              (
                (string $kind): ?Token ==> {
                  switch ($kind) {
                    case 'function':
                      return new FunctionToken(
                        null,
                        new NodeList(vec[new WhiteSpace(' ')]),
                      );
                    case 'namespace':
                      return new NamespaceToken(
                        null,
                        new NodeList(vec[new WhiteSpace(' ')]),
                      );
                    case 'type':
                      return new TypeToken(
                        null,
                        new NodeList(vec[new WhiteSpace(' ')]),
                      );
                  }
                  return null;
                }
              )($kind),
              new QualifiedName(
                new NodeList(
                  Str\split($namespace, '\\')
                    |> Vec\map($$, ($name) ==> {
                      return new ListItem(
                        new NameToken(null, null, $name),
                        new BackslashToken(null, null),
                      );
                    }),
                ),
              ),
              new LeftBraceToken(
                null,
                $multiple ? new NodeList(vec[new WhiteSpace("\n")]) : null,
              ),
              new NodeList(Vec\map_with_key($names, ($index, $name) ==> {
                list(
                  $name,
                  $alias,
                  $name_leading,
                  $name_trailing,
                  $alias_trailing,
                  $comma_trailing,
                ) = $name;
                return new ListItem(
                  new NamespaceUseClause(
                    /*$clause_kind*/ null,
                    new QualifiedName(
                      new NodeList(vec[
                        new ListItem(
                          new NameToken(
                            new NodeList(
                              $multiple
                                ? Vec\concat(
                                    vec[new WhiteSpace('  ')],
                                    $name_leading,
                                  )
                                : $name_leading,
                            ),
                            new NodeList($name_trailing),
                            $name,
                          ),
                          /*$separator*/ null,
                        ),
                      ]),
                    ),
                    $alias is nonnull
                      ? new AsToken(
                          new NodeList(vec[new WhiteSpace(' ')]),
                          new NodeList(vec[new WhiteSpace(' ')]),
                        )
                      : null,
                    $alias is nonnull
                      ? new NameToken(
                          null,
                          new NodeList($alias_trailing),
                          $alias,
                        )
                      : null,
                  ),
                  (!$multiple && $index === $names_count - 1)
                    ? null
                    : new CommaToken(
                        null,
                        new NodeList(Vec\concat($comma_trailing, vec[
                          $multiple
                            ? new WhiteSpace("\n")
                            : new WhiteSpace(' '),
                        ])),
                      ),
                );
              })),
              new RightBraceToken(null, null),
              new SemicolonToken(null, $semicolumn_token?->getTrailing()),
            ));
          } else {
            $descendants = $script->getAncestorsOfDescendant($node);
            invariant(C\lastx($descendants) === $node, 'failed to find node');
            $parent = $descendants[C\count($descendants) - 2] as NodeList<_>;
            $script = $script->replace($parent, $parent->withoutChild($node));
          }
          $i++;
        }
      }
    }

    return $script;
  }
}
