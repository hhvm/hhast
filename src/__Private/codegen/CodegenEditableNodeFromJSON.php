<?hh // strict
/**
 * Copyright (c) 2017, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional
 * grant of patent rights can be found in the PATENTS file in the same
 * directory.
 *
 */

namespace Facebook\HHAST\__Private;

use namespace HH\Lib\C;

use type Facebook\HackCodegen\HackBuilderValues;

final class CodegenEditableNodeFromJSON extends CodegenBase {
  <<__Override>>
  public function generate(): void {
    $cg = $this->getCodegenFactory();

    $cg
      ->codegenFile($this->getOutputDirectory().
        '/editable_node_from_json.php')
      ->setNamespace('Facebook\\HHAST\\__Private')
      ->useNamespace('Facebook\\HHAST')
      ->addFunction(
        $cg
          ->codegenFunction('editable_node_from_json')
          ->setReturnType('HHAST\\EditableNode')
          ->addParameter('dict<string, mixed> $json')
          ->addParameter('int $position')
          ->addParameter('string $source')
          ->setBody(
            $cg
              ->codegenHackBuilder()
              ->startSwitch('(string) $json[\'kind\']')
              ->addCase('token', HackBuilderValues::export())
              ->addReturnf(
                'HHAST\\EditableToken::fromJSON(/* HH_IGNORE_ERROR[4110] */ $json[\'token\'], $position, $source)',
              )
              ->unindent()
              ->addCase('list', HackBuilderValues::export())
              ->addReturnf(
                'HHAST\\EditableList::fromJSON($json, $position, $source)',
              )
              ->unindent()
              ->addCase('missing', HackBuilderValues::export())
              ->addReturnf('HHAST\\Missing()')
              ->unindent()
              ->addCaseBlocks(
                $this->getSchema()['trivia'],
                ($trivia, $body) ==> {
                  $body
                    ->addCase(
                      $trivia['trivia_type_name'],
                      HackBuilderValues::export(),
                    )
                    ->addReturnf(
                      'HHAST\\%s::fromJSON($json, $position, $source)',
                      $trivia['trivia_kind_name'],
                    )
                    ->unindent();
                },
              )
              ->addCaseBlocks(
                (new Vector($this->getSchema()['AST']))->filter(
                  $ast ==> !C\contains_key(
                    self::getHandWrittenSyntaxKinds(),
                    $ast['kind_name'],
                  ),
                ),
                ($ast, $body) ==> {
                  $body
                    ->addCase($ast['description'], HackBuilderValues::export())
                    ->addReturnf(
                      'HHAST\\%s::fromJSON($json, $position, $source)',
                      $ast['kind_name'],
                    )
                    ->unindent();
                },
              )
              ->addDefault()
              ->addLine(
                'throw new \\Exception(\'unexpected JSON kind: \'.(string) $json[\'kind\']);',
              )
              ->endDefault()
              ->endSwitch()
              ->getCode(),
          ),
      )
      ->save();
  }
}
