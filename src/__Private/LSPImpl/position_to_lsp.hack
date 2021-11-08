/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSPImpl;

use namespace Facebook\HHAST\__Private\LSP;
use namespace HH\Lib\Math;

function position_to_lsp((int, int) $hhast_pos): LSP\Position {
  return shape(
    'line' => Math\maxva($hhast_pos[0] - 1, 0),
    'character' => $hhast_pos[1],
  );
}
