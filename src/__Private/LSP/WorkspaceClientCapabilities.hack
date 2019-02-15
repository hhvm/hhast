/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSP;

type WorkspaceClientCapabilities = shape(
  ?'applyEdit' => bool,
  ?'workspaceEdit' => shape(
    ?'documentChanges' => bool,
  ),
  ?'didChangeConfiguration' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'didChangeWatchedFiles' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'symbol' => shape(
    ?'dynamicRegistration' => bool,
    ?'symbolKind' => shape(
      ?'valueSet' => vec<SymbolKind>,
    ),
  ),
  ?'executeCommand' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'workspaceFolders' => bool,
  ?'configuration' => bool,
);
