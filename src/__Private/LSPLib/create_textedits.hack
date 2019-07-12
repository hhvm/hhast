/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPLib;

use namespace Facebook\HHAST\__Private\LSP;
use namespace Facebook\DiffLib;
use namespace HH\Lib\{C, Str, Vec};

function create_textedits(string $from, string $to): vec<LSP\TextEdit> {
  $diff = DiffLib\StringDiff::lines($from, $to)
    ->getDiff()
    |> DiffLib\cluster($$);
  $edits = vec[];
  while (!C\is_empty($diff)) {
    $first = C\firstx($diff);
    $diff = Vec\drop($diff, 1);
    if ($first is DiffLib\DiffKeepOp<_>) {
      continue;
    }

    // If we have a replacement, the deletion always comes first - so, if we
    // have an InsertOp here, it's a pure insertion
    if ($first is DiffLib\DiffInsertOp<_>) {
      $pos = shape(
        'line' => $first->getNewPos(),
        'character' => 0,
      );

      $edits[] = shape(
        'range' => shape('start' => $pos, 'end' => $pos),
        'newText' => Str\join($first->getContent(), "\n")."\n",
      );
      continue;
    }

    invariant(
      $first is DiffLib\DiffDeleteOp<_>,
      'Expected a DeleteOp, InsertOp, or KeepOp, got %s',
      \get_class($first),
    );

    $pos = $first->getOldPos();
    $len = C\count($first->getContent());

    // if ($first, $next) is (Delete, Insert) we have a replacement
    $next = C\first($diff);
    if (!$next is DiffLib\DiffInsertOp<_>) {
      // (Delete, null|Keep) - just a deletion
      $edits[] = shape(
        'range' => shape(
          'start' => shape('line' => $pos, 'character' => 0),
          'end' => shape('line' => $pos + $len, 'character' => 0),
        ),
        'newText' => '',
      );
      continue;
    }

    // turn ['remove foo', 'add bar'] into 'replace foo with bar'
    $diff = Vec\drop($diff, 1); // consume $next
    $a = Str\join($first->getContent(), "\n");
    $b = Str\join($next->getContent(), "\n");

    // If they're 'too different' (arbitrary heuristic), replace the whole
    // line
    if (\levenshtein($a, $b) > (0.5 * Str\length($b))) {
      $edits[] = shape(
        'range' => shape(
          'start' => shape('line' => $pos, 'character' => 0),
          'end' => shape('line' => $pos + $len, 'character' => 0),
        ),
        'newText' => Str\join($next->getContent(), "\n")."\n",
      );
      continue;
    }

    // Just replace characters within the line
    $ildiff = DiffLib\StringDiff::characters($a, $b)
      |> DiffLib\cluster($$->getDiff());

    $offset_to_pos = (int $offset) ==> {
      $haystack = Str\slice($a, 0, $offset);
      $lines = Str\split($haystack, "\n");
      return shape(
        'line' => $first->getOldPos() + (C\count($lines) - 1),
        'character' => Str\length(C\lastx($lines)),
      );
    };

    // ok, now we basically do the same again :)
    while (!C\is_empty($ildiff)) {
      $ilfirst = C\firstx($ildiff);
      $ildiff = Vec\drop($ildiff, 1);

      if ($ilfirst is DiffLib\DiffKeepOp<_>) {
        continue;
      }

      if ($ilfirst is DiffLib\DiffInsertOp<_>) {
        $ilpos = $offset_to_pos($ilfirst->getNewPos());
        $edits[] = shape(
          'range' => shape(
            'start' => $ilpos,
            'end' => $ilpos,
          ),
          'newText' => Str\join($ilfirst->getContent(), ''),
        );
        continue;
      }

      invariant($ilfirst is DiffLib\DiffDeleteOp<_>, 'unhandled op kind');

      $ilnext = C\first($ildiff);
      if (!$ilnext is DiffLib\DiffInsertOp<_>) {
        $edits[] = shape(
          'range' => shape(
            'start' => $offset_to_pos($ilfirst->getOldPos()),
            'end' => $offset_to_pos(
              $ilfirst->getOldPos() + C\count($ilfirst->getContent()),
            ),
          ),
          'newText' => '',
        );
        continue;
      }

      // Okay, replacement again :)
      $ildiff = Vec\drop($ildiff, 1);
      $edits[] = shape(
        'range' => shape(
          'start' => $offset_to_pos($ilfirst->getOldPos()),
          'end' => $offset_to_pos(
            $ilfirst->getOldPos() + C\count($ilfirst->getContent()),
          ),
        ),
        'newText' => Str\join($ilnext->getContent(), ''),
      );
    }
  }
  return $edits;
}
