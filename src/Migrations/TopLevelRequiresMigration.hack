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

/** Move requires to top-level `<<__EntryPoint>>` functions, or FIXME them. */
final class TopLevelRequiresMigration extends BaseMigration {
  <<__Override>>
  public function migrateFile(string $_path, Script $script): Script {
    return \HH\Asio\join($this->migrateFileAsync($script));
  }

  private async function migrateFileAsync(Script $script): Awaitable<Script> {
    $decls = $script->getDeclarations();
    $includes = $decls->getChildrenOfType(InclusionDirective::class);
    if (C\is_empty($includes)) {
      return $script;
    }
    if (
      C\every(
        $includes,
        $incl ==> Str\contains(
          $incl->getFirstTokenx()->getLeading()->getCode(),
          '/* HH_FIXME[1002]',
        ),
      )
    ) {
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

    if ($entrypoint) {
      return await $this->moveToEntryPointAsync(
        $script,
        $includes,
        $entrypoint,
      );
    }
    return $this->addFixmes($script, $includes);
  }

  private function addFixmes(
    Script $script,
    Container<InclusionDirective> $includes,
  ): Script {
    foreach ($includes as $include) {
      $t = $include->getFirstTokenx();
      $script = $script->replace(
        $t,
        $t->withLeading(new NodeList(
          Vec\concat(
            $t->getLeading()->toVec(),
            vec[
              new FixMe(
                '/* HH_FIXME[1002] HHAST: move to <<__EntryPoint>> function */',
              ),
              new WhiteSpace(' '),
            ],
          ),
        )),
      );
    }
    return $script;
  }

  private async function moveToEntryPointAsync(
    Script $script,
    Container<InclusionDirective> $includes,
    FunctionDeclaration $entrypoint,
  ): Awaitable<Script> {
    // Figure out leading whitespace
    $body = $entrypoint->getBody();
    if (!$body is CompoundStatement) {
      // Invalid, but e.g. `<<__EntryPoint>> function foo(): void;`
      return $this->addFixmes($script, $includes);
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
          $body->getStatements()?->getChildren() ?? [],
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
