/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\LSP;

enum CompletionItemKind: int {
  // K prefix because of reserved words
  K_TEXT = 1;
  K_METHOD = 2;
  K_FUNCTION = 3;
  K_CONSTRUCTOR = 4;
  K_FIELD = 5;
  K_VARIABLE = 6;
  K_CLASS = 7;
  K_INTERFACE = 8;
  K_MODULE = 9;
  K_PROPERTY = 10;
  K_UNIT = 11;
  K_VALUE = 12;
  K_ENUM = 13;
  K_KEYWORD = 14;
  K_SNIPPET = 15;
  K_COLOR = 16;
  K_FILE = 17;
  K_REFERENCE = 18;
  K_FOLDER = 19;
  K_ENUM_MEMBER = 20;
  K_CONSTANT = 21;
  K_STRUCT = 22;
  K_EVENT = 23;
  K_OPERATOR = 24;
  K_TYPE_PARAMETER = 25;
}
