/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{Dict, Math, Str, Vec};

final abstract class XHProf {
  private static bool $enabled = false;
  public static function enable(): void {
    invariant(self::$enabled === false, "Can't enable twice");
    self::$enabled = true;
    /* HH_FIXME[2049] no HHI for xhprof */
    /* HH_FIXME[4107] no HHI for xhprof */
    \xhprof_enable();
  }

  const type TResult = shape(
    'inclusive' => int,
    'exclusive' => int,
    'callers' => dict<string, int>,
    'callees' => dict<string, int>,
  );

  public static function disable(): dict<string, self::TResult> {
    invariant(self::$enabled === true, "Can't disable twice");
    self::$enabled = false;
    /* HH_FIXME[2049] no HHI for XHProf */
    /* HH_FIXME[4107] no HHI for XHProf */
    $raw = Dict\map(\xhprof_disable(), $v ==> (int) $v['wt']);

    $inclusive = dict[];
    $callers = dict[];
    $callees = dict[];
    foreach ($raw as $name => $wall) {
      $parts = Str\split($name, '==>');
      $caller = $parts[0];
      $callee = $parts[1] ?? null;

      if ($callee === null) {
        $inclusive[$caller] = $wall;
        continue;
      }

      $inclusive[$callee] = ($inclusive[$callee] ?? 0) + $wall;

      $callers[$callee] = $callers[$callee] ?? dict[];
      $callers[$callee][$caller] = $wall;
      $callees[$caller] = $callees[$caller] ?? dict[];
      $callees[$caller][$callee] = $wall;
    }

    return Dict\map_with_key(
      $inclusive,
      ($func, $inc_wall) ==> {
        $func_callers = $callers[$func] ?? dict[];
        $func_callees = $callees[$func] ?? dict[];
        $ex_wall = $inc_wall - Math\sum($func_callees);
        return shape(
          'inclusive' => $inc_wall,
          'exclusive' => $ex_wall,
          'callers' => $func_callers,
          'callees' => $func_callees,
        );
      },
    );
  }

  public static function disableAndDump(resource $handle): void {
    self::dump($handle, self::disable());
  }

  public static function disableAndGenerateDot(): string {
    return self::generateDot(self::disable());
  }

  public static function generateDot(
    dict<string, self::TResult> $counters,
  ): string {
    $counters = Dict\sort_by($counters, $row ==> -$row['inclusive']);
    $scale = 1000000.0; // usec to sec
    $out = "Digraph D {\n";
    $cull_rate = 0.01;
    $alert_rate = 0.3;

    $node_count = 0;
    $node_ids = dict[];
    $edges = vec[];
    $max = $counters
      |> Vec\map($$, $data ==> $data['inclusive'])
      |> Math\max($$) as nonnull
      |> (float)$$;
    $cull = $cull_rate * $max;
    $alert = $alert_rate * $max;

    foreach ($counters as $name => $data) {
      if ($data['inclusive'] < $cull) {
        continue;
      }
      $this_id = $node_count;
      $node_ids[$name] = $this_id;
      $out .= Str\format(
        "node_%d [ label=\"%s\nInclusive: %.5fs\nExclusive: %.5fs\" penwidth=%.1f %s]\n",
        $this_id,
        Str\replace($name, '\\', '\\\\'),
        $data['inclusive'] / $scale,
        $data['exclusive'] / $scale,
        Math\maxva(1.0, 5 * $data['inclusive'] / $max),
        $data['inclusive'] > $alert ? 'fillcolor="#ff9999" style=filled ' : '',
      );
      $callees = Dict\sort_by($data['callees'], $v ==> -$v);
      foreach ($callees as $callee => $wall) {
        $edges[] = tuple($this_id, $callee, $wall / $scale);
      }
      $node_count++;
    }
    $max = Vec\map($edges, $edge ==> $edge[2]) |> Math\max($$) as nonnull;
    $cull = $cull_rate * $max;
    foreach ($edges as list($caller, $callee, $wall)) {
      if ($wall < $cull) {
        continue;
      }
      $callee = $node_ids[$callee] ?? null;
      if ($callee is null) {
        continue;
      }
      $out .= Str\format(
        "node_%d -> node_%d [ label=\" %.5fs\" penwidth=\"%.1f\"]\n",
        $caller,
        $callee,
        $wall,
        Math\maxva(1.0, 5 * $wall / $max),
      );
    }

    $out .= "}\n";
    return $out;
  }

  public static function dump(
    resource $handle,
    dict<string, self::TResult> $counters,
  ): void {
    $counters = Dict\sort_by($counters, $row ==> -$row['inclusive']);
    $scale = 1000000.0; // usec to sec
    \fwrite($handle, "----- XHPROF -----\n");
    foreach ($counters as $name => $data) {
      \fprintf(
        $handle,
        "%s\n\tInclusive: %.5fs\n\tExclusive: %.5fs\n",
        $name,
        $data['inclusive'] / $scale,
        $data['exclusive'] / $scale,
      );
      \fwrite($handle, "\tCallees:\n");
      $callees = Dict\sort_by($data['callees'], $v ==> -$v);
      foreach ($callees as $callee => $wall) {
        \fprintf($handle, "\t - %8.2fs %s\n", $wall / $scale, $callee);
      }
      \fwrite($handle, "\tCallers:\n");
      $callers = Dict\sort_by($data['callers'], $v ==> -$v);
      foreach ($callers as $caller => $wall) {
        \fprintf($handle, "\t - %8.2fs %s\n", $wall / $scale, $caller);
      }
    }
    \fwrite($handle, "----- XHPROF -----\n");
  }
}
