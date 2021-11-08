/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSP;

type ServerCapabilities = shape(
  /** TextDocumentSyncOptions | TextDocumentSyncKind */
  ?'textDocumentSync' => mixed,
  ?'hoverProvider' => bool,
  ?'completionProvider' => CompletionOptions,
  ?'signatureHelpProvider' => SignatureHelpOptions,
  ?'definitionProvider' => bool,
  /** bool | (TextDocumentRegistrationOptions & StaticRegistrationOptions) */
  ?'typeDefinitionProvider' => mixed,
  /** bool | (TextDocumentRegistrationOptions & StaticRegistrationOptions) */
  ?'implementationProvider' => mixed,
  ?'referencesProvider' => bool,
  ?'documentHighlightProvider' => bool,
  ?'documentSymbolProvider' => bool,
  ?'workspaceSymbolProvider' => bool,
  ?'codeActionProvider' => bool,
  ?'codeLensProvider' => CodeLensOptions,
  ?'documentFormattingProvider' => bool,
  ?'documentRangeFormattingProvider' => bool,
  ?'documentOnTypeFormattingProvider' => DocumentOnTypeFormattingOptions,
  ?'renameProvider' => bool,
  ?'documentLinkProvider' => DocumentLinkOptions,
  /** bool | ColorProviderOptions |
   * ColorProviderOptions & TextDocumentRegistrationOptions
   *   & StaticRegistrationOptions */
  ?'colorProvider' => mixed,
  ?'executeCommandProvider' => ExecuteCommandOptions,
  ?'workspace' => shape(
    ?'workspaceFolders' => shape(
      ?'supported' => bool,
      /** string | bool */
      ?'changeNotifications' => mixed,
    ),
  ),
  ?'experimental' => mixed,
);
