/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Regex, Str, Vec};

/**
 * RISKY MIGRATION. Requires manual review and testing.
 * Probably breaks code like: require_once('Bar.php'); class Foo extends Bar {}
 *
 * Moves all top-level statements to an <<__EntryPoint>> function (existing
 * or a new one). New <<__EntryPoint>> functions are named filename_main() and
 * created at the position of the last affected statement.
 *
 * Exceptions: Classish, functions, type aliases, constants, namespace/use.
 * Doesn't work with `namespace Foo { ... }`, only `namespace Foo;`.
 */
final class TopLevelCodeMigration extends BaseMigration {

  private static function getEntryPoint(Script $script): ?FunctionDeclaration {
    return $script->getDeclarations()
      ->getChildrenOfType(FunctionDeclaration::class)
      |> Vec\filter(
        $$,
        $f ==> C\any(
          $f->getAttributeSpec()?->getAttributes()?->getChildrenOfItems() ??
            vec[],
          $attr ==>
            $attr->getType() is NameToken &&
            $attr->getType() as NameToken->getText() === '__EntryPoint',
        ),
      )
      |> C\first($$);
  }

  <<__Override>>
  public function migrateFile(string $path, Script $script): Script {
    $old_entrypoint = self::getEntryPoint($script);

    $last = null; // last top-level statement Node
    $to_move = vec[]; // all top-level statement Nodes
    $before = null; // number of $to_move Nodes before $old_entrypoint (if any)

    foreach ($script->getDeclarations()->getChildren() as $decl) {
      if ($decl === $old_entrypoint) {
        $before = C\count($to_move);
      } else if ($decl is IStatement) {
        $last = $decl;
        $to_move[] = $decl;
      }
    }

    if ($last is null) {
      // no top-level statements
      return $script;
    }

    if ($old_entrypoint is nonnull) {
      // update existing EntryPoint function
      $before as nonnull;
      $new_entrypoint = $old_entrypoint->withBody(
        $old_entrypoint->getBody() as CompoundStatement->withStatements(
          NodeList::createMaybeEmptyList(Vec\concat(
            Vec\take($to_move, $before),
            $old_entrypoint->getBody() as CompoundStatement->getStatements()
              ?->getChildren() ??
              vec[],
            Vec\drop($to_move, $before),
          )),
        ),
      );
    } else {
      // create new EntryPoint function
      // path/to/123-some-file.hack --> some_file_main
      $m = Regex\first_match(\basename($path), re"/[a-zA-Z].*/");
      $fn_name = $m is null
        ? 'main'
        : $m[0]
          |> Str\strip_suffix($$, '.php')
          |> Str\strip_suffix($$, '.hack')
          |> Regex\replace($$, re"/[^a-zA-Z0-9_]+/", '_').'_main';

      $space = NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]);
      $endl = NodeList::createMaybeEmptyList(vec[new EndOfLine("\n")]);

      $new_entrypoint = new FunctionDeclaration(
        new OldAttributeSpecification(
          new LessThanLessThanToken(null, null),
          NodeList::createMaybeEmptyList(vec[
            new ListItem(
              new ConstructorCall(
                new NameToken(null, null, '__EntryPoint'),
                null,
                null,
                null,
              ),
              null,
            ),
          ]),
          new GreaterThanGreaterThanToken(null, $endl),
        ),
        new FunctionDeclarationHeader(
          null,
          new FunctionToken(null, $space),
          new NameToken(null, null, $fn_name),
          null,
          new LeftParenToken(null, null),
          null,
          new RightParenToken(null, null),
          new ColonToken(null, $space),
          new SimpleTypeSpecifier(new VoidToken(null, $space)),
          null,
        ),
        new CompoundStatement(
          new LeftBraceToken(null, $endl),
          NodeList::createMaybeEmptyList($to_move),
          new RightBraceToken(null, $endl),
        ),
      );
    }

    // indent 2 spaces
    foreach ($to_move as $statement) {
      $new_entrypoint = $new_entrypoint->replaceDescendant(
        $statement,
        $statement->getCode()
          |> Str\split($$, "\n")
          |> Vec\map($$, $line ==> Str\trim_right('  '.$line))
          |> Str\join($$, "\n")
          |> \HH\Asio\join(self::statementFromCodeAsync($$)),
      );
    }

    $script =
      $script->replaceDescendant($old_entrypoint ?? $last, $new_entrypoint);

    $script = $script->withDeclarations(
      $script->getDeclarations()->filterChildren(
        $decl ==> !C\contains($to_move, $decl),
      ),
    );

    // at least 1 empty line (\n\n) before <<__EntryPoint>>
    $ft = $new_entrypoint->getFirstTokenx();
    $prev = $script->getPreviousToken($ft);
    if ($prev is nonnull) {
      $trivia = Vec\concat(
        $prev->getTrailing()->getChildren(),
        $ft->getLeading()->getChildren(),
      );
      while (
        C\count($trivia) < 2 ||
        $trivia[C\count($trivia) - 1]->getText() !== "\n" ||
        $trivia[C\count($trivia) - 2]->getText() !== "\n"
      ) {
        $trivia[] = new EndOfLine("\n");
      }
      $script = $script
        ->replaceDescendant($prev, $prev->withTrailing(null))
        ->replaceDescendant(
          $ft,
          $ft->withLeading(NodeList::createMaybeEmptyList($trivia)),
        );
      $new_entrypoint = self::getEntryPoint($script) as nonnull;
    }

    // at least 1 empty line (\n\n) after }
    $lt = $new_entrypoint->getLastTokenx();
    $next = $script->getNextToken($lt);
    if ($next is nonnull && !$next is EndOfFileToken) {
      $trivia = Vec\concat(
        $lt->getTrailing()->getChildren(),
        $next->getLeading()->getChildren(),
      );
      while (
        C\count($trivia) < 2 ||
        $trivia[0]->getText() !== "\n" ||
        $trivia[1]->getText() !== "\n"
      ) {
        $trivia = Vec\concat(vec[new EndOfLine("\n")], $trivia);
      }
      $script = $script
        ->replaceDescendant($lt, $lt->withTrailing(null))
        ->replaceDescendant(
          $next,
          $next->withLeading(NodeList::createMaybeEmptyList($trivia)),
        );
      $new_entrypoint = self::getEntryPoint($script) as nonnull;
    }

    // no empty lines after {
    $lt = $new_entrypoint->getBody() as CompoundStatement->getLeftBrace();
    $next = $script->getNextToken($lt);
    if ($next is nonnull) {
      $trivia = Vec\concat(
        $lt->getTrailing()->getChildren(),
        $next->getLeading()->getChildren(),
      );
      while (
        C\count($trivia) >= 2 &&
        $trivia[0]->getText() === "\n" &&
        $trivia[1]->getText() === "\n"
      ) {
        $trivia = Vec\drop($trivia, 1);
      }
      if (C\is_empty($trivia) || $trivia[0]->getText() !== "\n") {
        $trivia = Vec\concat(vec[new EndOfLine("\n")], $trivia);
      }
      $script = $script
        ->replaceDescendant($lt, $lt->withTrailing(null))
        ->replaceDescendant(
          $next,
          $next->withLeading(NodeList::createMaybeEmptyList($trivia)),
        );
      $new_entrypoint = self::getEntryPoint($script) as nonnull;
    }

    // no empty lines before }
    $ft = $new_entrypoint->getBody() as CompoundStatement->getRightBrace();
    $prev = $script->getPreviousToken($ft);
    if ($prev is nonnull) {
      $trivia = Vec\concat(
        $prev->getTrailing()->getChildren(),
        $ft->getLeading()->getChildren(),
      );
      while (
        C\count($trivia) >= 2 &&
        $trivia[C\count($trivia) - 1]->getText() === "\n" &&
        $trivia[C\count($trivia) - 2]->getText() === "\n"
      ) {
        $trivia = Vec\take($trivia, C\count($trivia) - 1);
      }
      if (
        C\is_empty($trivia) || $trivia[C\count($trivia) - 1]->getText() !== "\n"
      ) {
        $trivia[] = new EndOfLine("\n");
      }
      $script = $script
        ->replaceDescendant($prev, $prev->withTrailing(null))
        ->replaceDescendant(
          $ft,
          $ft->withLeading(NodeList::createMaybeEmptyList($trivia)),
        );
    }

    // Unrelated but apparently common issue, due to top-level code not being
    // typechecked: If script is namespaced, some_builtin() --> \some_builtin().
    if (
      C\any(
        $script->getDeclarations()->getChildren(),
        $decl ==> $decl is NamespaceDeclaration,
      )
    ) {
      $script = $script->rewriteDescendants(
        ($node, $_) ==> {
          if (!$node is FunctionCallExpression) {
            return $node;
          }
          $name = $node->getReceiver();
          if (!$name is NameToken || !\function_exists('\\'.$name->getText())) {
            return $node;
          }
          return $node->withReceiver(
            new QualifiedName(
              NodeList::createMaybeEmptyList(vec[
                new ListItem(
                  new BackslashToken($name->getLeading(), null),
                  null,
                ),
                new ListItem($name->withLeading(null), null),
              ]),
            ),
          );
        },
        vec[],
      );
    }

    return $script;
  }
}
