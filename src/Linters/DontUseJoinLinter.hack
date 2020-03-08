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

final class DontUseJoinLinter extends LineLinter<LineLintError> {

  private static keyset<string> $knownHashes = keyset[];

  <<__Override>>
  public function getLintErrorsForLine(
    string $_line,
    int $line_number,
  ): Traversable<LineLintError> {
    $path = $this->getFile()->getPath();
    $hash = $this->getFile()->getHash();
    if ($line_number === 0 && !C\contains_key(static::$knownHashes, $hash)) {
      echo Str\format("Cleared for %s\n", $path);
      /*Update me!*/\HH\class_meth(static::class, 'getJoinsAsync');
      \HH\clear_static_memoization(static::class, 'getJoinsAsync');
    }
    self::$knownHashes[] = $hash;

    /*HHAST_FIXME[DontUseJoin]*/
    $errors = \HH\Asio\join(static::getJoinsAsync())
      |> idx($$, $this->getFile()->getPath(), dict[])
      |> idx($$, $line_number, null);
    if ($errors is null || C\is_empty($errors)) {
      return vec[];
    }

    return Vec\map(
      $errors,
      $err ==> new LineLintError(
        $this,
        "Don't use HH\Asio\join()",
        tuple($line_number, $err),
      ),
    );
  }

  public static function setKnownHashes(keyset<string> $hashes): void {
    self::$knownHashes = $hashes;
  }

  /**
   * @return dict<file, dict<line, col>>
   */
  <<__Memoize>>
  public static async function getJoinsAsync(
  ): Awaitable<dict<string, dict<int, vec<int>>>> {
    $refs = await __Private\execute_async(
      'hh_client',
      '--find-refs',
      'HH\Asio\join',
    );

    $regex =
      re"/^File \"(?<file>[\/\w.-]+)\", line (?<line>\d+), characters (?<col_start>\d+)-(?<col_end>\d+)/";

    $out = dict[];
    foreach ($refs as $ref) {
      if (!Str\starts_with($ref, 'File')) {
        continue;
      }
      $result = Regex\first_match($ref, $regex);

      invariant($result is nonnull, 'Could not parse line: %s', $ref);

      list($file, $line, $col_start, $col_end) = tuple(
        $result['file'],
        Str\to_int($result['line']),
        Str\to_int($result['col_start']),
        Str\to_int($result['col_end']),
      );

      invariant(
        $line is nonnull && $col_start is nonnull && $col_end is nonnull,
        'Could not parse line: %s',
        $line,
      );

      $out[$file] ??= dict[];
      $out[$file][$line] ??= vec[];
      $out[$file][$line][] = $col_start;
    }

    return $out;
  }

}
