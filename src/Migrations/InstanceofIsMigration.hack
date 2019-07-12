/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Migrations;

use type Facebook\HHAST\{
  ClassishDeclaration,
  CommaToken,
  File,
  GenericTypeSpecifier,
  GreaterThanToken,
  INameishNode,
  InstanceofExpression,
  IsExpression,
  IsToken,
  LessThanToken,
  ListItem,
  NameToken,
  NodeList,
  Script,
  SimpleTypeSpecifier,
  Token,
  TypeArguments,
  WhiteSpace,
};
use function Facebook\HHAST\{from_file_async, resolve_type, Missing};
use namespace HH\Lib\{C, Str, Vec};

final class InstanceofIsMigration extends BaseMigration {
  <<__Override>>
  public function migrateFile(string $path, Script $script): Script {
    return \HH\Asio\join($this->migrateFileAsync($path, $script));
  }

  private async function migrateFileAsync(
    string $_path,
    Script $script,
  ): Awaitable<Script> {
    $targets = $script->getDescendantsOfType(InstanceofExpression::class);
    $replacements = await Vec\map_async($targets, async $target ==> {
      $type = $target->getRightOperand();
      if (!$type is INameishNode) {
        // e.g. `$x instanceof 'foo'` or `$x instanceof $classname_t`
        return null;
      }
      $name = $type->getDescendantsOfType(Token::class)
        |> Vec\map($$, $t ==> $t->getText())
        |> Str\join($$, '');

      $resolved = resolve_type($name, $script, $type);
      $generics = await self::getGenericsCountAsync($resolved);

      $instanceof_token = $target->getOperator();

      $replacement = new IsExpression(
        $target->getLeftOperand(),
        new IsToken(
          $instanceof_token->getLeading(),
          $instanceof_token->getTrailing(),
        ),
        $generics === 0
          ? new SimpleTypeSpecifier($type)
          : new GenericTypeSpecifier(
              $type === $type->getLastTokenx()
                ? ($type as Token)->withTrailing(Missing())
                : $type->replace(
                  $type->getLastTokenx(),
                  $type->getLastTokenx()->withTrailing(Missing()),
                ),
              new TypeArguments(
                new LessThanToken(Missing(), Missing()),
                new NodeList(
                  Vec\range(1, $generics)
                    |> Vec\map(
                      $$,
                      $i ==> new ListItem(
                        new SimpleTypeSpecifier(
                          new NameToken(Missing(), Missing(), '_'),
                        ),
                        $i === $generics
                          ? Missing()
                          : new CommaToken(
                              Missing(),
                              new NodeList(vec[new WhiteSpace(' ')]),
                            ),
                      ),
                    ),
                ),
                new GreaterThanToken(
                  Missing(),
                  $type->getLastTokenx()->getTrailing(),
                ),
              ),
            ),
      );
      return tuple($target, $replacement);
    });
    $replacements = Vec\filter_nulls($replacements);
    foreach ($replacements as list($old, $new)) {
      $script = $script->replace($old, $new);
    }
    return $script;
  }

  const dict<string, int> BUILTINS_WITH_GENERICS = dict[
    'HH\\Awaitable' => 1,
    'HH\\ConstMap' => 2,
    'HH\\ConstSet' => 1,
    'HH\\ConstVector' => 1,
    'HH\\Container' => 1,
    'HH\\ImmMap' => 2,
    'HH\\ImmSet' => 1,
    'HH\\ImmVector' => 1,
    'HH\\KeyedContainer' => 2,
    'HH\\KeyedTraversable' => 2,
    'HH\\Map' => 2,
    'HH\\Set' => 1,
    'HH\\Traversable' => 1,
    'HH\\Vector' => 1,
    'ConstMap' => 2,
    'ConstSet' => 1,
    'ConstVector' => 1,
    'SplObjectStorage' => 2,
  ];

  <<__Memoize>>
  private static async function getGenericsCountAsync(
    string $type,
  ): Awaitable<int> {
    if (C\contains_key(self::BUILTINS_WITH_GENERICS, $type)) {
      return self::BUILTINS_WITH_GENERICS[$type];
    }
    try {
      $rc = new \ReflectionClass($type);
      $file = $rc->getFileName();
      if (!$file is string) {
        return 0;
      }
      $in_file = await self::getClassGenericCountsInFileAsync($file);
      return $in_file[$type] ?? 0;
    } catch (\ReflectionException $_) {
    }
    return 0;
  }

  <<__Memoize>>
  private static async function getClassGenericCountsInFileAsync(
    string $file,
  ): Awaitable<dict<string, int>> {
    // Not using facebook/definition-finder, to avoid a circular dependency
    $script = await from_file_async(File::fromPath($file));
    $classes = $script->getDescendantsOfType(ClassishDeclaration::class);
    $counts = dict[];
    foreach ($classes as $class) {
      $name = resolve_type($class->getName()->getText(), $script, $class);
      $count = C\count(
        $class->getTypeParameters()?->getParameters()?->toVec() ?? vec[],
      );
      $counts[$name] = $count;
    }

    return $counts;
  }
}
