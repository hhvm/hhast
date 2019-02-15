/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HackCodegen\HackBuilderValues;

final class CodegenEditableTriviaFromJSON extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $cg
      ->codegenFile($this->getOutputDirectory().
        '/editable_trivia_from_json.php')
      ->setNamespace('Facebook\\HHAST\\__Private')
      ->useNamespace('Facebook\\HHAST')
      ->addFunction(
        $cg
          ->codegenFunction('editable_trivia_from_json')
          ->setReturnType('HHAST\\EditableTrivia')
          ->addParameter('dict<string, mixed> $json')
          ->addParameter('string $file')
          ->addParameter('int $offset')
          ->addParameter('string $source')
          ->setBody(
            $cg
              ->codegenHackBuilder()
              ->addAssignment(
                '$trivia_text',
                '\\substr($source, $offset, $json[\'width\'] as int)',
                HackBuilderValues::literal(),
              )
              ->startSwitch('(string) $json[\'kind\']')
              ->addCaseBlocks(
                new Vector($this->getSchema()['trivia']),
                ($trivia, $body) ==> {
                  $body
                    ->addCase(
                      $trivia['trivia_type_name'],
                      HackBuilderValues::export(),
                    )
                    ->returnCasef(
                      'new HHAST\\%s($trivia_text)',
                      $trivia['trivia_kind_name'],
                    );
                },
              )
              ->addDefault()
              ->addMultilineCall(
                'throw new HHAST\\UnsupportedASTNodeError',
                vec[
                  '$file',
                  '$offset',
                  '(string) $json[\'kind\']',
                ],
              )
              ->endDefault()
              ->endSwitch()
              ->getCode(),
          ),
      )
      ->save();
  }
}
