/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  AsToken,
  BackslashToken,
  CommaToken,
  EndOfLine,
  FunctionToken,
  INamespaceUseDeclaration,
  LeftBraceToken,
  ListItem,
  NameToken,
  NamespaceGroupUseDeclaration,
  NamespaceToken,
  NamespaceUseClause,
  NamespaceUseDeclaration,
  Node,
  NodeList,
  QualifiedName,
  RightBraceToken,
  Script,
  SemicolonToken,
  TypeToken,
  UseToken,
  WhiteSpace,
};
use namespace HH\Lib\{C, Dict, Str, Vec};
use function Facebook\HHAST\Missing;

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
        if ($child instanceof FunctionToken) {
          return 'function';
        }

        if ($child instanceof NamespaceToken) {
          return 'namespace';
        }

        if ($child instanceof TypeToken) {
          return 'type';
        }
      }

      return null;
    };

    foreach (
      $script->getDescendantsOfType(INamespaceUseDeclaration::class) as
        $use_decl
    ) {
      if ($use_decl instanceof NamespaceUseDeclaration) {
        foreach (
          $use_decl->getDescendantsOfType(NamespaceUseClause::class) as
            $use_clause
        ) {
          $parts = vec[];

          $name_leading = vec[];
          $name_trailing = vec[];

          $name = $use_clause->getName();
          if ($name instanceof NameToken) {
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
          } else if ($name instanceof QualifiedName) {
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

      if ($use_decl instanceof NamespaceGroupUseDeclaration) {
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
          if ($name instanceof NameToken) {
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
          } else if ($name instanceof QualifiedName) {
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
          Dict\filter($result[$kind][$namespace][1], ($n) ==> {
            return $n[0] === $name && $n[1] === $alias;
          })
          |> C\count($$) === 0
        ) {
          $drop = 0;
          foreach ($name_leading as $leading) {
            if (
              !$leading instanceof WhiteSpace && !$leading instanceof EndOfLine
            ) {
              break;
            }

            $drop++;
          }
          $name_leading = Vec\drop($name_leading, $drop);

          $take_trailing = (vec<Node> $trailings) ==> {
            $take = C\count($trailings);
            foreach (Vec\reverse($trailings) as $trailing) {
              if (
                !$trailing instanceof WhiteSpace &&
                !$trailing instanceof EndOfLine
              ) {
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
        'Use statements should be groupped',
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
          vec<(string, ?string, vec<Node>, vec<Node>, vec<Node>, vec<Node>)>,
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
                $use_token is nonnull ? $use_token->getLeading() : Missing(),
                new WhiteSpace(' '),
              ),
              (
                (string $kind): Node ==> {
                  switch ($kind) {
                    case 'function':
                      return new FunctionToken(Missing(), new WhiteSpace(' '));
                    case 'namespace':
                      return new NamespaceToken(Missing(), new WhiteSpace(' '));
                    case 'type':
                      return new TypeToken(Missing(), new WhiteSpace(' '));
                  }
                  return Missing();
                }
              )($kind),
              new QualifiedName(
                new NodeList(
                  Str\split($namespace, '\\')
                    |> Vec\map($$, ($name) ==> {
                      return new ListItem(
                        new NameToken(Missing(), Missing(), $name),
                        new BackslashToken(Missing(), Missing()),
                      );
                    }),
                ),
              ),
              new LeftBraceToken(
                Missing(),
                $multiple ? new WhiteSpace("\n") : Missing(),
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
                    /*$clause_kind*/Missing(),
                    new QualifiedName(
                      new NodeList(vec[
                        new ListItem(
                          new NameToken(
                            C\count($name_leading) > 0
                              ? (
                                  $multiple
                                    ? new NodeList(Vec\concat(
                                      vec[new WhiteSpace('  ')],
                                      $name_leading,
                                    ))
                                    : new NodeList($name_leading)
                                )
                              : ($multiple ? new WhiteSpace('  ') : Missing()),
                            C\count($name_trailing) > 0
                              ? new NodeList($name_trailing)
                              : Missing(),
                            $name,
                          ),
                          /*$separator*/Missing(),
                        ),
                      ]),
                    ),
                    $alias is nonnull
                      ? new AsToken(new WhiteSpace(' '), new WhiteSpace(' '))
                      : Missing(),
                    $alias is nonnull
                      ? new NameToken(
                          Missing(),
                          C\count($alias_trailing) > 0
                            ? new NodeList($alias_trailing)
                            : Missing(),
                          $alias,
                        )
                      : Missing(),
                  ),
                  (!$multiple && $index === $names_count - 1)
                    ? Missing()
                    : new CommaToken(
                        Missing(),
                        C\count($comma_trailing) > 0
                          ? new NodeList(Vec\concat($comma_trailing, vec[
                            $multiple
                              ? new WhiteSpace("\n")
                              : new WhiteSpace(' '),
                          ]))
                          : (
                              $multiple
                                ? new WhiteSpace("\n")
                                : new WhiteSpace(' ')
                            ),
                      ),
                );
              })),
              new RightBraceToken(Missing(), Missing()),
              new SemicolonToken(
                Missing(),
                $semicolumn_token is nonnull
                  ? $semicolumn_token->getTrailing()
                  : Missing(),
              ),
            ));
          } else {
            $script = $script->replace($node, Missing());
          }
          $i++;
        }
      }
    }

    return $script;
  }
}
