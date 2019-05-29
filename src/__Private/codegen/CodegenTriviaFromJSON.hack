/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use type Facebook\HackCodegen\{CodegenFileType, HackBuilderValues};

final class CodegenTriviaFromJSON extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $cg
      ->codegenFile($this->getOutputDirectory().
        '/trivia_from_json.hack')
      ->setFileType(CodegenFileType::DOT_HACK)
      ->setNamespace('Facebook\\HHAST\\__Private')
      ->useNamespace('Facebook\\HHAST')
      ->addFunction(
        $cg
          ->codegenFunction('trivia_from_json')
          ->setReturnType('HHAST\\Trivia')
          ->addParameter('dict<string, mixed> $json')
          ->addParameter('SourceRef $source_ref')
          ->setBody(
            $cg
              ->codegenHackBuilder()
              ->addAssignment(
                '$trivia_text',
                '\\substr($source_ref[\'source\'], $source_ref[\'offset\'], $source_ref[\'width\'])',
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
                      'new HHAST\\%s($trivia_text, $source_ref)',
                      $trivia['trivia_kind_name'],
                    );
                },
              )
              ->addDefault()
              ->addMultilineCall(
                'throw new HHAST\\UnsupportedASTNodeError',
                vec[
                  '$source_ref["file"]',
                  '$source_ref["offset"]',
                  '$json[\'kind\'] as string',
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
