/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\{C, Dict};

use type Facebook\HackCodegen\{
  CodegenFileType,
  HackBuilderKeys,
  HackBuilderValues,
};

final class CodegenNodeFromJSON extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $kind_to_class = Dict\merge(
      dict[
        'list' => 'NodeList',
        'missing' => 'Missing',
      ],
      Dict\pull(
        $this->getSchema()['trivia'],
        $trivia ==> $trivia['trivia_kind_name'],
        $trivia ==> $trivia['trivia_type_name'],
      ),
      Dict\pull(
        Dict\filter(
          $this->getSchema()['AST'],
          $ast ==> !C\contains_key(
            self::getHandWrittenSyntaxKinds(),
            $ast['kind_name'],
          ),
        ),
        $ast ==> $ast['kind_name'],
        $ast ==> $ast['description'],
      ),
    );

    $cg
      ->codegenFile($this->getOutputDirectory().'/node_from_json.hack')
      ->setFileType(CodegenFileType::DOT_HACK)
      ->setNamespace('Facebook\\HHAST\\__Private')
      ->useNamespace('Facebook\\HHAST')
      ->addFunction(
        $cg
          ->codegenFunction('node_from_json')
          ->setReturnType('HHAST\\Node')
          ->addParameter('dict<string, mixed> $json')
          ->addParameter('string $file')
          ->addParameter('int $offset')
          ->addParameter('string $source')
          ->setBody(
            $cg
              ->codegenHackBuilder()
              ->addAssignment(
                '$kind',
                '$json["kind"] as string',
                HackBuilderValues::literal(),
              )
              ->startIfBlock('$kind === "token"')
              ->add('return ')
              ->addMultilineCall(
                'HHAST\\Token::fromJSON',
                vec[
                  '$json[\'token\'] as dict<_, _>',
                  '$file',
                  '$offset',
                  '$source',
                ],
              )
              ->endIfBlock()
              ->addAssignment(
                '$kind_to_class',
                $kind_to_class,
                HackBuilderValues::dict(
                  HackBuilderKeys::export(),
                  HackBuilderValues::lambda(
                    ($_, $v) ==> 'HHAST\\'.$v.'::class',
                  ),
                ),
              )
              ->addAssignment(
                '$class',
                '$kind_to_class[$kind] ?? null',
                HackBuilderValues::literal(),
              )
              ->startIfBlock('$class is nonnull')
              ->add('return ')
              ->addMultilineCall(
                '$class::fromJSON',
                vec['$json', '$file', '$offset', '$source'],
              )
              ->endIfBlock()
              ->addMultilineCall(
                'throw new HHAST\\UnsupportedASTNodeError',
                vec[
                  '$file',
                  '$offset',
                  '(string) $json[\'kind\']',
                ],
              )
              ->getCode(),
          ),
      )
      ->save();
  }
}
