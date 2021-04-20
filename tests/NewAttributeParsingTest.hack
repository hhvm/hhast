/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

final class NewAttributeParsingTest extends HackTest {
  public async function testTopLevelAttribute(): Awaitable<void> {
    if (!__Private\is_new_attribute_syntax_allowed()) {
      self::markTestSkipped('Requires new attribute syntax');
    }
    $script = await from_file_async(
      File::fromPath(__DIR__.'/../test-data/new_attribute_on_function.hack'),
    );
    expect($script->getFirstDescendantByType<AttributeSpecification>())
      ->toNotBeNull();
  }

  public async function testClassLevelAttribute(): Awaitable<void> {
    if (!__Private\is_new_attribute_syntax_allowed()) {
      self::markTestSkipped('Requires new attribute syntax');
    }
    $script = await from_file_async(
      File::fromPath(__DIR__.'/../test-data/new_attribute_on_method.hack'),
    );
    expect($script->getFirstDescendantByType<AttributeSpecification>())
      ->toNotBeNull();
  }
}
