<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */


namespace Facebook\HHAST\__Private\Diff;

use namespace HH\Lib\{C, Str, Vec};

final class StringDiff extends Diff {
  const type TContent = string;

  public static function lines(string $a, string $b): this {
    return new self(Str\split($a, "\n"), Str\split($b, "\n"));
  }

  public static function characters(string $a, string $b): this {
    return new self(Str\split($a, ''), Str\split($b, ''));
  }

  public function getUnifiedDiff(int $context = 3): string {
    $hunks = vec[];

    $remaining = $this->getDiff();
    while (!C\is_empty($remaining)) {
      $not_keep = C\find_key($remaining, $row ==> $row[0] !== DiffOp::KEEP);
      if ($not_keep === null) {
        break;
      }
      $start = ($not_keep > $context) ? ($not_keep - $context) : 0;

      $remaining = Vec\drop($remaining, $start);
      $count = C\count($remaining);

      $end = $count;
      $run_start = null;
      for ($i = $context; $i < $count; ++$i) {
        if ($remaining[$i][0] === DiffOp::KEEP) {
          $run_start = $run_start ?? $i;
          continue;
        }

        if ($run_start === null) {
          continue;
        }

        if ($i >= $run_start + (2 * $context)) {
          $end = $run_start + $context;
          break;
        }
      }
      if ($run_start !== null) {
        $end = $run_start + $context;
      }
      $hunks[] = Vec\take($remaining, $end);
      $remaining = Vec\drop($remaining, $end);
    }

    return Vec\map($hunks, $hunk ==> $this->getUnifiedDiffHunk($hunk))
      |> Vec\filter_nulls($$)
      |> Str\join($$, "");
  }

  private function getUnifiedDiffHunk(
    vec<(DiffOp, ?this::TElem, ?this::TElem)> $hunk,
  ): ?string {
    if (C\is_empty($hunk)) {
      return null;
    }
    $old_start = null;
    $new_start = null;
    $old_lines = 0;
    $new_lines = 0;

    $lines = vec[];

    foreach ($hunk as list($op, $old, $new)) {
      switch ($op) {
        case DiffOp::KEEP:
          invariant($old !== null, 'must have old for keep');
          invariant($new !== null, 'must have new for keep');
          $lines[] = ' '.$old['content'];
          $old_start = $old_start ?? $old['pos'];
          $new_start = $new_start ?? $new['pos'];
          ++$old_lines;
          ++$new_lines;
          break;
        case DiffOp::DELETE:
          invariant($old !== null, 'must have old for delete');
          $lines[] = '-'.$old['content'];
          $old_start = $old_start ?? $old['pos'];
          $new_start = $new_start ?? $old['pos'];
          ++$old_lines;
          break;
        case DiffOp::INSERT:
          invariant($new !== null, 'must have new for insert');
          $lines[] = '+'.$new['content'];
          $old_start = $old_start ?? $new['pos'];
          $new_start = $new_start ?? $new['pos'];
          ++$new_lines;
          break;
      }
    }
    invariant($old_start !== null, 'failed to find an old pos');
    invariant($new_start !== null, 'failed to find a new pos');

    return Str\format(
      "@@ -%d,%d +%d,%d @@\n",
      $old_start + 1,
      $old_lines,
      $new_start + 1,
      $new_lines,
    ).Str\join($lines, "\n")."\n";
  }
}
