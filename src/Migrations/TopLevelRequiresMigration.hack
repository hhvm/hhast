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

/** Move requires to top-level `<<__EntryPoint>>` functions */
final class TopLevelRequiresMigration extends BaseMigration {
  <<__Override>>
  public function migrateFile(string $_path, Script $script): Script {
    /*HHAST_FIXME[DontUseAsioJoin]*/
    return \HH\Asio\join($this->migrateFileAsync($script));
  }

  private async function migrateFileAsync(Script $script): Awaitable<Script> {
    $decls = $script->getDeclarations();
    $includes = $decls->getChildrenOfType(InclusionDirective::class);
    if (C\is_empty($includes)) {
      return $script;
    }

    $entrypoint = $decls->getChildrenOfType(FunctionDeclaration::class)
      |> Vec\filter(
        $$,
        $f ==> C\any(
          $f->getAttributeSpec()?->getAttributes()?->getChildrenOfItems() ??
            vec[],
          $attr ==>
            ($attr->getType() as NameToken)->getText() === '__EntryPoint',
        ),
      )
      |> C\first($$);

    if (!$entrypoint) {
      return $script;
    }
    $classes = $script->getDescendantsOfType(ClassishDeclaration::class);
    if (
      C\any(
        $classes,
        $c ==> $c->hasExtendsKeyword() || $c->hasImplementsKeyword(),
      )
    ) {
      /* This kind of file needs to be manually refactored:
       *
       * require_once('Bar.php');
       * class Foo extends Bar {}
       */
      return $script;
    }

    // Figure out leading whitespace
    $body = $entrypoint->getBody();
    if (!$body is CompoundStatement) {
      // Invalid, but e.g. `<<__EntryPoint>> function foo(): void;`
      return $script;
    }

    $leading = $body->getStatements()?->toVec() ?? vec[]
      |> C\first($$)
      |> $$?->getFirstTokenx()?->getLeadingWhitespace()
      |> $$?->getText() ?? '  ';

    // Generate a lambda so that if the require()'d file sets variables in
    // the psuedomain, they don't affect the entrypoint
    $includes_text = Vec\map(
      $includes,
      $incl ==> {
        $t = $incl->getFirstTokenx();
        return $incl->replace(
          $t,
          $t->withLeading(new NodeList(vec[new WhiteSpace($leading.$leading)])),
        )
          ->getCode();
      },
    )
      |> Str\join($$, '');
    $lambda = await self::statementFromCodeAsync(
      $leading.
      "(() ==> {\n".
      $leading.
      $leading.
      "// HHAST-generated to avoid pseudomain local leaks\n".
      $includes_text.
      $leading.
      "})();\n\n",
    );


    $body = $body->withStatements(
      new NodeList(
        Vec\concat(
          vec[$lambda],
          $body->getStatements()?->getChildren() ?? varray[],
        ),
      ),
    );

    return $script->withDeclarations(
      $script->getDeclarations()
        ->filterChildren($decl ==> !C\contains($includes, $decl))
        ->replaceChild($entrypoint, $entrypoint->withBody($body)),
    );
  }

}
