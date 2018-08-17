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
 */
abstract class Diff {
  /** This class diffs two sequences of `TContent` */
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

  /** Implementation of Myers' diff algorith, as in the paper
   *
   * @See Myers (1986) An O(ND) difference algorithm and its variations.
   * Algorithmica, 1(1-4), p251-266. doi: 10.1007/BF01840446
   *
   * In short:
   * - think of the problem as an edit graph: the X axis is the original
   *   sequence and the Y axis is the desired sequence
   * - increasing X is deleting an item (cost 1)
   * - increasing Y is inserting an item from the target sequence (cost 1)
   * - if the items are the same, increase both X and Y simultanously (cost 0)
   * - diffing is now graph traversal problem: find the path with the
   *   lowest-cost cost path from (0, 0) to (len(a), len(b))
   *
   * The paper first defines an edit distance function, then explains how to
   * convert this function into a diff algorithm; in summary:
   *
   * 1) create an edit distance function
   * 2) change it to log all what edits it makes
   * 3) when it's found the minimum edit distance, stop
   * 4) post-process the log into a set of moves
   *
   * The final step is handled by `backtrackPath()`
   */
  final private function getMoves(): vec<this::TMove> {
    /* If you're comparing this to the paper:
     * `$max_x` is N
     * `$max_y` is M
     * `$max_cost` is MAX
     * `$cost` is D
     * `$diagonal` is k
     * `$best_points` is V
     * `$best_points_at_cost` is Vd
     *
     * 'cost' isn't quite the same as 'depth': taking a diagonal path through
     * the space is an increase in depth, but not cost.
     */

    $a = $this->a;
    $b = $this->b;
    $max_x = C\count($a);
    $max_y = C\count($b);
    // Absolute worst case: delete everything from a + insert everything from b
    $max_cost = $max_x + $max_y;

    /* Find the shortest path.
     *
     * $x: offset into a: deletions
     * $y: offset into b: insertions
     * $diagonal: an identifier representing the line where $y = $x - $diagonal
     *
     * From the paper:
     * 1. For any path of cost $cost: -$cost <= $diagonal <= $cost
     * 2. The furthest-reaching 0-cost path ends at (x,x), where x =
     *    min(x) where $a[x] !== $b[x] or $x >= $max_x or $x >= $max_y
     * 3. The furthest-reaching ($cost)-cost path is composed of either:
     *    1. 1. a furthest-reaching ($cost-1)-path on diagonal ($diagonal - 1)
     *       2. a horizontal edge (deletion)
     *       3. any number (including 0) of diagonal edges (keeps)
     *    2. 1. a furthest-reaching ($cost-1)-path on diagonal ($diagonal + 1)
     *       2. a vertical edge (insertion)
     *       3. any number (including 0) of diagonal edges (keeps)
     *
     * So, for each cost, find the furthest-reaching point on each diagonal.
     * Stop when we leave the search space, or reach the endpoint.
     */

    // A map from $diagonal to $x. This is effectively a map from $diagonal to
    // points, as $y = $x - $diagonal.
    //
    // To handle $cost = 0, we take advantage of the fact that:
    // - we will only be looking at $diagonal === 0
    // - the implementation takes the ($diagonal + 1) path if $cost ===
    //   $diagonal
    // So, we set the best-$x for ($diagonal + 1) to 0, as that gets us
    // $y = $x + $diagonal = 0 + 0 = 0, so ($x = 0, $y = 0)
    $best_points = dict[1 => 0];
    $best_points_at_cost = vec[];

    for ($cost = 0; $cost <= $max_cost; $cost++) {
      $best_points_at_cost[] = $best_points;
      for ($diagonal = -$cost; $diagonal <= $cost; $diagonal += 2) { // Use 1.
        // Use 3: The furthest-reaching path on this diagonal is a continuation
        // of a ($cost-1) path on either ($diagonal-1) or ($diagonal+1).
        //
        // Decide which option we're taking for this diagonal
        if (
          // if ===, can't be -1 as $diagonal >= -$cost
          $diagonal === -$cost
          || (
            // if ===, must be -1 as $diagonal <= $cost
            $diagonal !== $cost
            // Okay, we can choose.
            // prefer to keep the ($cost-1) path with higher $x - i.e. prefer to
            // delete. Not needed for correctness or efficiency, but:
            //     -foo
            //     +foof
            // is generally expected, and considered more readable than:
            //     +foof
            //     -foo
            && $best_points[$diagonal - 1] < $best_points[$diagonal + 1]
          )
        ) {
          // keep x, increase $y (add a insertion)
          $x = $best_points[$diagonal + 1];
        } else {
          // increase x, keep y (add a deletion)
          $x = $best_points[$diagonal - 1] + 1;
        }
        $y = $x - $diagonal;

        // Use 2: Can we move along the diagonal (keep/unchanged elem)?
        while (
          $x < $max_x &&
          $y < $max_y &&
          $this->areSame($a[$x]['content'], $b[$y]['content'])
        ) {
          $x++;
          $y++;
        }

        invariant(
          $x <= $max_x && $y <= $max_y,
          'exceeded sequence length',
        );

        $best_points[$diagonal] = $x;

        if ($x === $max_x && $y === $max_y) {
          return $this->backtrackPath($best_points_at_cost);
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
  private function backtrackPath(
    vec<dict<int, int>> $best_points_at_cost,
  ): vec<this::TMove> {
    /* Start at the final position, and backtrack to (0, 0).
     *
     * We know the final (x, y), and that the final cost is
     * C\count($best_points_at_cost).
     *
     */
    $moves = vec[];
    $to_x = C\count($this->a);
    $to_y = C\count($this->b);

    /* Work backwards, finding the (x, y) at ($cost - 1), that gets us to
     * our target at ($cost) */
    foreach (Dict\reverse($best_points_at_cost) as $cost => $best_points) {
      $diagonal = $to_x - $to_y;

      /* Use point 3. again - it's either on ($diagonal -1) with ($x-1, $y)
       * or on ($diagonal + 1) with ($x, $y - 1), plus any number of
       * diagonal moves. Which?
       */
      if (
        $diagonal === -$cost
        || (
          $diagonal !== $cost
          && $best_points[$diagonal - 1] < $best_points[$diagonal + 1]
        )
      ) {
        $diagonal = $diagonal + 1;
      } else {
        $diagonal = $diagonal - 1;
      }
      $from_x = $best_points[$diagonal];
      $from_y = $from_x - $diagonal;

      // We found the move that cost us - now try to fill in free diagonal
      // moves
      while ($to_x > $from_x && $to_y > $from_y) {
        $moves[] = tuple(tuple($to_x - 1, $to_y - 1), tuple($to_x, $to_y));
        $to_x--;
        $to_y--;
      }

      if ($cost === 0) {
        // If cost is 0, there were only diagonals, which we just dealt with
        return $moves;
      }

      $moves[] = tuple(tuple($from_x, $from_y), tuple($to_x, $to_y));

      $to_x = $from_x;
      $to_y = $from_y;
    }
    invariant_violation('unreachable');
  }
}
