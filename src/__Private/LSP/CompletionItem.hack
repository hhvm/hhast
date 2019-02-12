/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSP;

type CompletionItem = shape(
  'label' => string,
  ?'kind' => CompletionItemKind,
  ?'detail' => string,
  /* string | MarkupContent */
  ?'documentation' => mixed,
  ?'deprecated' => bool,
  ?'sortText' => string,
  ?'filterText' => string,
  ?'insertText' => string,
  ?'insertTextFormat' => InsertTextFormat,
  ?'textEdit' => TextEdit,
  ?'additionalTextEdits' => vec<TextEdit>,
  ?'commitCharacters' => vec<string>,
  ?'command' => Command,
  ?'data' => mixed,
);
