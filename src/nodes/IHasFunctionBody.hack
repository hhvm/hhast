/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

 namespace Facebook\HHAST;

 interface IHasFunctionBody {
   require extends EditableNode;

  public function hasBody(): bool;
  public function getBody(): ?CompoundStatement;
  public function getBodyx(): CompoundStatement;
  public function getBodyUNTYPED(): EditableNode;
 }
