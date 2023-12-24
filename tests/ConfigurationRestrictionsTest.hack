/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Keyset, Str, Vec};
use type Facebook\HackTest\{DataProvider, HackTest};
use function Facebook\FBExpect\expect;

final class ConfigurationRestrictionsTest extends HackTest {
  /**
   * This is not quite complete, since non hhast repo linters are not included.
   * It would be nice to have a discovery mechanism for all linters.
   */
  public function provideLinterClassnames(): vec<(classname<Linter>)> {
    return Keyset\union(
      __Private\LintRunConfig::DEFAULT_LINTERS,
      __Private\LintRunConfig::NON_DEFAULT_LINTERS,
    )
      |> Vec\map($$, $classname ==> tuple($classname));
  }

  <<DataProvider('provideLinterClassnames')>>
  public function testLinterConfigOnlyIncludesValueTypes(
    classname<Linter> $classname,
  ): void {
    $type_structure = \HH\type_structure($classname, 'TConfig');
    $this->throwOnBannedTypeRecursive($type_structure);
  }

  /**
   * @throws BadTypeException for illegal types.
   * @throws any other exception when the type annotation does not typecheck.
   */
  private function throwOnBannedTypeRecursive<T>(
    \HH\TypeStructure<T> $ts,
  ): void {
    $kind = $ts['kind'];
    switch ($kind) {
      ////////////////
      // ALLOW LIST //
      ////////////////
      case \HH\TypeStructureKind::OF_INT:
      case \HH\TypeStructureKind::OF_BOOL:
      case \HH\TypeStructureKind::OF_FLOAT:
      case \HH\TypeStructureKind::OF_STRING:
      case \HH\TypeStructureKind::OF_NUM:
      case \HH\TypeStructureKind::OF_ARRAYKEY:
      case \HH\TypeStructureKind::OF_NULL:
      // debatable, but no real reason to forbid enums
      case \HH\TypeStructureKind::OF_ENUM:
      // These must be manually refined, again debatable
      case \HH\TypeStructureKind::OF_NONNULL:
      case \HH\TypeStructureKind::OF_MIXED:
        return;

      ////////////////
      // BLOCK LIST //
      ////////////////
      // Use a modern Hack array instead
      case \HH\TypeStructureKind::OF_VEC_OR_DICT:
      case \HH\TypeStructureKind::OF_DARRAY:
      case \HH\TypeStructureKind::OF_ARRAY:
      case \HH\TypeStructureKind::OF_VARRAY:
      case \HH\TypeStructureKind::OF_VARRAY_OR_DARRAY:
      // Ask for a vec<T> an keyset($vec) it instead.
      case \HH\TypeStructureKind::OF_KEYSET:
      // Non json serializable types
      case \HH\TypeStructureKind::OF_CLASS:
      case \HH\TypeStructureKind::OF_FUNCTION:
      case \HH\TypeStructureKind::OF_RESOURCE:
      case \HH\TypeStructureKind::OF_NORETURN:
      case \HH\TypeStructureKind::OF_INTERFACE:
      case \HH\TypeStructureKind::OF_TRAIT:
      case \HH\TypeStructureKind::OF_NOTHING:
      case \HH\TypeStructureKind::OF_XHP:
      case \HH\TypeStructureKind::OF_VOID:
      case \HH\TypeStructureKind::OF_GENERIC:
      case \HH\TypeStructureKind::OF_DYNAMIC:
      case \HH\TypeStructureKind::OF_UNRESOLVED:
        throw new BadTypeException(
          'You cannot declare the type '.
          Str\lowercase(
            Str\strip_prefix(\HH\TypeStructureKind::getNames()[$kind], 'OF_'),
          ).
          ' for a config',
        );

      //////////////////
      // RECURSE LIST //
      //////////////////
      case \HH\TypeStructureKind::OF_VEC:
        $this->throwOnBannedTypeRecursive(
          C\onlyx(Shapes::at($ts, 'generic_types') as nonnull),
        );
        break;
      case \HH\TypeStructureKind::OF_TUPLE:
        foreach ((Shapes::at($ts, 'elem_types') as nonnull) as $elem) {
          $this->throwOnBannedTypeRecursive($elem);
        }
        break;
      case \HH\TypeStructureKind::OF_DICT:
        // No need to check the Tk, since it must be arraykey-ish.
        $this->throwOnBannedTypeRecursive(
          Shapes::at($ts, 'generic_types') as nonnull[1],
        );
        break;
      case \HH\TypeStructureKind::OF_SHAPE:
        foreach ((Shapes::at($ts, 'fields') as nonnull) as $field) {
          $this->throwOnBannedTypeRecursive($field);
        }
    }
  }

  public function provideGoodTypeStructures(): vec<(\HH\TypeStructure<mixed>)> {
    return vec[
      tuple(static::toTypeStructure<shape('use_tabs' => bool)>()),
      tuple(static::toTypeStructure<shape('use_tabs' => ?bool)>()),
      tuple(static::toTypeStructure<shape(?'use_tabs' => bool)>()),
      tuple(static::toTypeStructure<shape(?'use_tabs' => ?bool)>()),
      tuple(static::toTypeStructure<shape('use_tabs' => bool, ...)>()),
      tuple(static::toTypeStructure<shape('use_tabs' => ?bool, ...)>()),
      tuple(static::toTypeStructure<shape(?'use_tabs' => bool, ...)>()),
      tuple(static::toTypeStructure<shape(?'use_tabs' => ?bool, ...)>()),
      tuple(static::toTypeStructure<shape('type' => float)>()),
      tuple(static::toTypeStructure<shape('type' => int)>()),
      tuple(static::toTypeStructure<shape('type' => num)>()),
      tuple(static::toTypeStructure<shape('type' => string)>()),
      tuple(static::toTypeStructure<shape('type' => arraykey)>()),
      tuple(static::toTypeStructure<shape('type' => nonnull)>()),
      tuple(static::toTypeStructure<shape('type' => null)>()),
      tuple(static::toTypeStructure<shape('type' => mixed)>()),
      tuple(static::toTypeStructure<shape('type' => vec<string>)>()),
      tuple(static::toTypeStructure<shape('type' => dict<string, string>)>()),
      tuple(static::toTypeStructure<
        shape('type' => dict<string, vec<shape('type' => bool)>>),
      >()),
      tuple(static::toTypeStructure<
        shape(
          'type' => shape(
            'inner' => shape(
              'deeper' => vec<int>,
              ...
            ),
          ),
        ),
      >()),
      tuple(static::toTypeStructure<shape()>()),
      tuple(static::toTypeStructure<shape(...)>()),
    ];
  }

  <<DataProvider('provideGoodTypeStructures')>>
  public function testThrowOnBannedTypeRecursiveDoesNotThrowForGoodTypes<T>(
    \HH\TypeStructure<T> $type_structure,
  ): void {
    expect(() ==> $this->throwOnBannedTypeRecursive($type_structure))
      ->notToThrow();
  }

  public function provideBadTypeStructures(): vec<(\HH\TypeStructure<mixed>)> {
    return vec[
      tuple(static::toTypeStructure<\Exception>()),
      tuple(static::toTypeStructure<keyset<string>>()),
      tuple(static::toTypeStructure<resource>()),
      tuple(static::toTypeStructure<dynamic>()),
      tuple(static::toTypeStructure<void>()),
      tuple(static::toTypeStructure<noreturn>()),
      tuple(static::toTypeStructure<\DateTimeInterface>()),
    ];
  }

  <<DataProvider('provideBadTypeStructures')>>
  public function testThrowOnBannedTypeRecursiveThrowsForBadTypes<T>(
    \HH\TypeStructure<T> $type_structure,
  ): void {
    expect(() ==> $this->throwOnBannedTypeRecursive($type_structure))
      ->toThrow(BadTypeException::class, 'You cannot declare');
  }

  private static function toTypeStructure<reify T>(): \HH\TypeStructure<mixed> {
    return \HH\FIXME\UNSAFE_CAST<
      \HH\TypeStructure<T>,
      \HH\TypeStructure<mixed>,
    >(\HH\ReifiedGenerics\get_type_structure<T>());
  }
}

final class BadTypeException extends \Exception {}
