/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSP;

type TextDocumentClientCapabilities = shape(
  ?'synchronization' => shape(
    ?'dynamicRegistration' => bool,
    ?'willSave' => bool,
    ?'willSaveUntil' => bool,
    ?'didSave' => bool,
  ),
  ?'completion' => shape(
    ?'dynamicRegistration' => bool,
    ?'completionItem' => shape(
      ?'snippetSupport' => bool,
      ?'commitCharactersSupport' => bool,
      ?'documentationFormat' => keyset<MarkupKind>,
      ?'deprecatedSupport' => bool,
    ),
    ?'completionItemKind' => shape(
      ?'valueSet' => keyset<CompletionItemKind>,
    ),
    ?'contextSupport' => bool,
  ),
  ?'hover' => shape(
    ?'dynamicRegistration' => bool,
    ?'contentFormat' => vec<MarkupKind>,
  ),
  ?'signatureHelp' => shape(
    ?'dynamicRegistration' => bool,
    ?'signatureInformation' => shape(
      ?'documentationFormat' => vec<MarkupKind>,
    ),
  ),
  ?'references' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'documentHighlight' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'documentSymbol' => shape(
    ?'dynamicRegistration' => bool,
    ?'symbolKind' => shape(
      ?'valueSet' => keyset<SymbolKind>,
    ),
  ),
  ?'formatting' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'rangeFormatting' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'onTypeFormatting' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'definition' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'typeDefinition' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'implementation' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'codeAction' => shape(
    ?'dynamicRegistration' => bool,
    ?'codeActionLiteralSupport' => shape(
      'codeActionKind' => shape(
        /** Not CodeActionKind as undefined values are permitted, including
         * the empty string */
        'valueSet' => keyset<string>,
      ),
    ),
  ),
  ?'codeLens' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'documentLink' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'colorProvider' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'rename' => shape(
    ?'dynamicRegistration' => bool,
  ),
  ?'publishDiagnostics' => shape(
    ?'relatedInformation' => bool,
  ),
);
