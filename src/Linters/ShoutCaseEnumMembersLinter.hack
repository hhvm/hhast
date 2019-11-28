/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Keyset, Regex, Str};

final class ShoutCaseEnumMembersLinter extends AutoFixingASTLinter {
  const type TContext = EnumDeclaration;
  const type TNode = Enumerator;

  <<__Override>>
  public function getLintErrorForNode(
    self::TContext $enum,
    self::TNode $member,
  ): ?ASTLintError {
    $name = $member->getName()->getLastTokenx()->getText();
    if (self::isShoutCase($name)) {
      return null;
    }
    $fixer = self::isFixableWithoutCollisions($name, $enum)
      ? () ==> $this->getFixedNode($member)
      : null;
    return new ASTLintError(
      $this,
      Str\format('Member {%s} is not in SHOUT_CASE', $name),
      $member,
      $fixer,
    );
  }

  private static function isShoutCase(string $member_name): bool {
    return Regex\matches($member_name, re"/^[A-Z0-9_]+$/");
  }

  private static function isFixableWithoutCollisions(
    string $name,
    EnumDeclaration $enum,
  ): bool {
    $members = $enum->getChildren()['enumerators'] as NodeList<_>;
    $upper_names = Keyset\map(
      $members->toVec(),
      $m ==> $m as Enumerator->getName()->getLastTokenx()->getText()
        |> Str\uppercase($$),
    );
    unset($upper_names[Str\uppercase($name)]);
    $shout_name = self::transformToShoutCase($name);

    return !C\contains_key($upper_names, $shout_name);
  }

  private static function transformToShoutCase(string $name): string {
    invariant(!Str\is_empty($name), 'Name must be at least one character');
    if (Str\contains($name, '_')) {
      // snake_case
      return Str\uppercase($name);
    } else {
      // camelCase
      return Regex\replace_with(
        $name,
        re"/([a-z])([A-Z])/",
        $shape ==> $shape[1].'_'.Str\uppercase($shape[2]),
      )
        |> Str\uppercase($$);
    }
  }

  public function getFixedNode(self::TNode $node): ?Node {
    return $node->withName(
      $node->getName()
        ->withText(self::transformToShoutCase($node->getName()->getText())),
    );
  }

  <<__Override>>
  protected function getTitleForFix(LintError $_): string {
    return 'Use shout case for enum members';
  }
}
