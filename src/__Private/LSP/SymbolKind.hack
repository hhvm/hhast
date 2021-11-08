/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSP;

enum SymbolKind: int {
  // K prefix because of reserved words
  K_FILE = 1;
  K_MODULE = 2;
  K_NAMESPACE = 3;
  K_PACKAGE = 4;
  K_CLASS = 5;
  K_METHOD = 6;
  K_PROPERTY = 7;
  K_FIELD = 8;
  K_CONSTRUCTOR = 9;
  K_ENUM = 10;
  K_INTERFACE = 11;
  K_FUNCTION = 12;
  K_VARIABLE = 13;
  K_CONSTANT = 14;
  K_STRING = 15;
  K_NUMBER = 16;
  K_BOOLEAN = 17;
  K_ARRAY = 18;
  K_OBJECT = 19;
  K_KEY = 20;
  K_NULL = 21;
  K_ENUM_MEMBER = 22;
  K_STRUCT = 23;
  K_EVENT = 24;
  K_OPERATOR = 25;
  K_TYPE_PARAMETER = 26;
}
