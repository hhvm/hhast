/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\Str;

final class DemangleXHPMigration extends StepBasedMigration {
  <<__Override>>
  public function getSteps(): Traversable<IMigrationStep> {
    return vec[
      new NodeTypeMigrationStep<XHPClassNameToken, _>(
        'Demangle XHP class names (`class :foo:bar-baz`, `:foo:bar-baz::class` etc)',
        $node ==> $node->withText(Str\replace($node->getText(), '-', '_')),
      ),
      // We can't just demangle XHPElementNameToken as that's also used for
      // attribute names - `<foo:bar-baz herp-derp="x" />` needs to be
      // `<foo:bar_baz herp-derp="x" />`, not `herp_derp`.
      new NodeTypeMigrationStep<XHPOpen, _>(
        'Demangle XHP open tags (`<foo:bar-baz>`)',
        $node ==> $node->withName(
          $node->getName()
            ->withText(Str\replace($node->getName()->getText(), '-', '_')),
        ),
      ),
      new NodeTypeMigrationStep<XHPClose, _>(
        'Demangle XHP close tags (`</foo:bar-baz>`)',
        $node ==> $node->withName(
          $node->getName()
            ->withText(Str\replace($node->getName()->getText(), '-', '_')),
        ),
      ),
    ];
  }
}
