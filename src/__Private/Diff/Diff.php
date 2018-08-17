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

use namespace HH\Lib\{C, Dict, Vec};

/** An implementation of Myer's diff algorithm.
 *
 * This base class operates on two sequences of any `TContent` where identity
 * is defined; you most likely want the `StringDiff` subclass.
 *
 * @See Myers (1986) An O(ND) difference algorithm and its variations.
 * Algorithmica, 1(1-4), p251-266. doi: 10.1007/BF01840446
 *
 * In short:
 * - think of the problem as an edit graph: the X axis is the original sequence
 *   and the Y axis is the desired sequence
 * - increasing X is deleting an item (cost 1)
 * - increasing Y is inserting an item from the target sequence (cost 1)
 * - where the items are the same, increase both X and Y simultanously (cost 0)
 * - diffing is now graph traversal problem: find the path with the lowest cost
 *   path from (0, 0) to (len(a), len(b))
 */
abstract class Diff {
  /** The classes diffs two sequences of `TContent` */
  abstract const type TContent;
  const type TElem = shape('content' => this::TContent, 'pos' => int);
  /** Internal: ((from_x, from_y), (to_x, to_y)
   *
   * - `(x+1, y)` is 'delete from a'
   * - `(x, y+1)` is 'insert to a from b'
   * - `(x+1, y+1)` is 'keep'
   */
  const type TMove = ((int, int), (int, int));

  private vec<this::TElem> $a;
  private vec<this::TElem> $b;

  public function __construct(vec<this::TContent> $a, vec<this::TContent> $b) {
    $this->a =
      Vec\map_with_key($a, ($k, $v) ==> shape('content' => $v, 'pos' => $k));
    $this->b =
      Vec\map_with_key($b, ($k, $v) ==> shape('content' => $v, 'pos' => $k));
  }

  /** The definition of identity for this differ.
   *
   * This defaults to `$a === $b`; subclasses may override this.
   */
  protected function areSame(this::TContent $a, this::TContent $b): bool {
    return $a === $b;
  }

  /** Get the diff as a sequence of operations to transform from A to B.
   *
   * If you're dealing with strings, you might want
   * `StringDiff::getUnifiedDiff()`
   */
  <<__Memoize>>
  final public function getDiff(): vec<(DiffOp, ?this::TElem, ?this::TElem)> {
    $a = $this->a;
    $b = $this->b;

    $moves = Vec\reverse($this->getMoves());
    $diff = vec[];

    $prev = tuple(0, 0);
    foreach ($moves as list($from, $to)) {
      invariant($from === $prev, "Missed a step");
      list($x, $y) = $from;
      $prev = $to;
      if ($to === tuple($x + 1, $y + 1)) {
        $diff[] = tuple(DiffOp::KEEP, $a[$x], $b[$y]);
        continue;
      }

      if ($to === tuple($x + 1, $y)) {
        $diff[] = tuple(DiffOp::DELETE, $a[$x], null);
        continue;
      }

      if ($to === tuple($x, $y + 1)) {
        $diff[] = tuple(DiffOp::INSERT, null, $b[$y]);
        continue;
      }

      invariant_violation(
        'invalid move: (%d, %d) => (%d, %d)',
        $from[0],
        $from[1],
        $to[0],
        $to[1],
      );
    }
    return $diff;
  }

  /** Implementation as in the paper.
   *
   * The paper first defines an edit distance function, then explains how to
   * convert this function into a diff algorithm; in summary:
   *
   * 1) create an edit distance function
   * 2) change it to log all what edits it makes
   * 3) when it's found the minimum edit distance, stop
   * 4) post-process the trace into a set of moves
   *
   * The final step is handled by `backtrackPath`
   */
  final private function getMoves(): vec<this::TMove> {
    // Variable names match the paper
    $n = C\count($this->a);
    $m = C\count($this->b);
    $max = $m + $n;
    $v = dict[1 => 0];
    $vd = vec[];

    // $d: depth a.k.a cost
    // $x: index into $a
    // $y: index into $b
    // $k = $x - $y
    // $v: map from $k, to best possible $x
    // $vd: trace of $v at each depth
    for ($d = 0; $d <= $max; $d++) {
      $vd[] = $v;
      for ($k = -$d; $k <= $d; $k += 2) {
        if ($k === -$d || ($k !== $d && $v[$k - 1] < $v[$k + 1])) {
          $x = $v[$k + 1];
        } else {
          $x = $v[$k - 1] + 1;
        }
        $y = $x - $k;

        // diagonal moves
        while (
          $x < $n &&
          $y < $m &&
          $this->areSame($this->a[$x]['content'], $this->b[$y]['content'])
        ) {
          $x++;
          $y++;
        }
        $v[$k] = $x;
        if ($x >= $n && $y >= $m) {
          return $this->backtrackPath($vd);
        }
      }
    }
    invariant_violation(
      'Shortest path is greater than the maximum possible length',
    );
  }

  /** Backtracking algorithm in the paper.
   *
   * Returns a reversed list of moves.
   */
  private function backtrackPath(vec<dict<int, int>> $vd): vec<this::TMove> {
    $moves = vec[];
    // Start at the final position, and backtrack to (0, 0)
    $to_x = C\count($this->a);
    $to_y = C\count($this->b);

    foreach (Dict\reverse($vd) as $d => $v) {
      $k = $to_x - $to_y;

      if ($k === -$d || ($k !== $d && $v[$k - 1] < $v[$k + 1])) {
        $k = $k + 1;
      } else {
        $k = $k - 1;
      }
      $from_x = $v[$k];
      $from_y = $from_x - $k;

      // diagonal moves
      while ($to_x > $from_x && $to_y > $from_y) {
        $moves[] = tuple(tuple($to_x - 1, $to_y - 1), tuple($to_x, $to_y));
        $to_x--;
        $to_y--;
      }

      if ($d === 0) {
        // if cost is 0, any remaining moves had to be diagonal
        return $moves;
      }

      $moves[] = tuple(tuple($from_x, $from_y), tuple($to_x, $to_y));

      $to_x = $from_x;
      $to_y = $from_y;
    }
    invariant_violation('unreachable');
  }
}
