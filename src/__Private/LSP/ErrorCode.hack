/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSP;

enum ErrorCode: int as int {
  // JSON RPC
  PARSE_ERROR = -32700;
  INVALID_REQUEST = -32600;
  METHOD_NOT_FOUND = -32601;
  INVALID_PARAMS = -32602;
  INTERNAL_ERROR = -32603;
  SERVER_ERROR_START = -32099;
  SERVER_ERROR_END = -32000;
  SERVER_NOT_INITIALIZED = -32002;
  UNKNOWN_ERROR_CODE = -32001;
  // LSP
  REQUEST_CANCELLED = -32800;
}
