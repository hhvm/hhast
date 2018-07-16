<?hh // strict
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
  DelimitedComment,
  EditableList,
  EditableNode,
  EndOfFile,
  EndOfLine,
  Script,
};
use function Facebook\HHAST\Missing;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\{C, Str, Vec};

final class LicenseHeaderLinter extends AutoFixingASTLinter<Script> {
  <<__Override>>
  protected static function getTargetType(): classname<Script> {
    return Script::class;
  }

  <<__Override>>
  public function getLintErrorForNode(
    Script $script,
    vec<EditableNode> $_parents,
  ): ?FixableASTLintError<Script> {
    $first = $script->getDeclarations()->getItems()[1] ?? null;
    if ($first === null) {
      return null;
    }
    if ($first instanceof EndOfFile) {
      return null;
    }
    $leading = $first->getFirstToken()?->getLeading();
    if ($leading instanceof EditableList) {
      $leading = $leading->getItems()[0];
    }

    if ($leading instanceof DelimitedComment) {
      if (
        $leading->getText() ===
          self::getLicenseHeaderForPath(\dirname($this->getFile()))
      ) {
        return null;
      }
    }
    return new FixableASTLintError(
      $this,
      'Incorrect or missing license header',
      $script,
    );
  }

  <<__Override>>
  public function getPrettyTextForNode(
    Script $node,
    ?EditableNode $_context,
  ): string {
    return $node->getDeclarations()->getItems()
      |> Vec\take($$, 2)
      |> EditableList::fromItems($$)
      |> $$->getCode();
  }

  <<__Override>>
  protected function getTitleForFix(FixableASTLintError<Script> $e): string {
    if (Str\contains_ci($e->getBlameCode(), 'copyright')) {
      return 'Replace license header';
    }
    return 'Add license header';
  }

  <<__Override>>
  public function getFixedNode(Script $node): Script {
    $first = $node->getDeclarations()->getItems()[1]->getFirstTokenx();
    $leading = $first->getLeading();
    if ($leading instanceof EditableList) {
      $leading = $leading->getItems();
    } else if ($leading === null) {
      $leading = vec[];
    } else {
      $leading = vec[$leading];
    }

    $key = C\find_key(
      $leading,
      $item ==> ($item instanceof DelimitedComment) &&
        Str\contains_ci($item->getText(), 'copyright'),
    );

    if ($key !== null) {
      $existing = $leading[$key];
      $next = $leading[$key + 1] ?? null;
      $next_next = $leading[$key + 2] ?? null;

      $new = vec[new DelimitedComment(
        TypeAssert\not_null(
          self::getLicenseHeaderForPath(\dirname($this->getFile())),
        ),
      )];
      if (!($next instanceof EndOfLine && $next_next instanceof EndOfLine)) {
        $new[] = new EndOfLine("\n");
      }

      return $node->replace($existing, EditableList::fromItems($new));
    }


    $leading = Vec\concat(
      vec[
        new DelimitedComment(
          TypeAssert\not_null(
            self::getLicenseHeaderForPath(\dirname($this->getFile())),
          ),
        ),
        new EndOfLine("\n"),
        new EndOfLine("\n"),
      ],
      $leading,
    );
    return $node->replace(
      $first,
      $first->withLeading(EditableList::fromItems($leading)),
    );
  }

  <<__Override>>
  public static function shouldLintFile(string $path): bool {
    return self::getLicenseHeaderForPath($path) !== null;
  }

  <<__Memoize>>
  private static function getLicenseHeaderForPath(string $path): ?string {
    if (\file_exists($path.'/.LICENSE_HEADER.hh.txt')) {
      $header = \file_get_contents($path.'/.LICENSE_HEADER.hh.txt');
      return ($header === '' || $header === "\n") ? null : Str\trim($header);
    }

    $path = \dirname(\realpath($path));
    if (
      Str\starts_with($path, \realpath(\Facebook\AutoloadMap\Generated\root()))
    ) {
      return self::getLicenseHeaderForPath($path);
    }
    return null;
  }
}
