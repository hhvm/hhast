<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{Dict, Math, Str};

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
      }
    );
  }

  public static function disableAndDump(
    resource $handle,
  ): void {
    self::dump($handle, self::disable());
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
