/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Migrations;

use namespace Facebook\HHAST;
use namespace HH\Lib\{C, Str, Vec};
use type Facebook\HHAST\__Private\Ref;

final class LinterGenericsToTypeConstantsMigration extends StepBasedMigration {
  <<__Override>>
  public function getSteps(): vec<IMigrationStep> {
    $t_node = new Ref(null);
    $is_autofixing = new Ref(false);
    $node_param_name = new Ref('');
    return vec[
      new TypedMigrationStep(
        'Remove generics from parent class',
        HHAST\ClassishDeclaration::class,
        HHAST\ClassishDeclaration::class,
        $decl ==>
          $this->removeGenericsFromParentClass($decl, $t_node, $is_autofixing),
      ),
      new TypedMigrationStep(
        'Add type constants',
        HHAST\ClassishDeclaration::class,
        HHAST\ClassishDeclaration::class,
        $decl ==> $this->addTypeConstants($decl, $t_node->get()),
      ),
      new TypedMigrationStep(
        'Change signature of getLintErrorForNode()',
        HHAST\MethodishDeclaration::class,
        HHAST\MethodishDeclaration::class,
        $decl ==>
          $this->updateGetLintErrorForNodeSignature($decl, $node_param_name),
      ),
      new TypedMigrationStep(
        'Pass fixer to ASTLintError',
        HHAST\ConstructorCall::class,
        HHAST\ConstructorCall::class,
        $cc ==> $this->updateLintErrorConstructorCall(
          $cc,
          $node_param_name->get() as nonnull,
          $is_autofixing->get(),
        ),
      ),
      new TypedMigrationStep(
        'Remove <<__Override>> from getFixedNode',
        HHAST\MethodishDeclaration::class,
        HHAST\MethodishDeclaration::class,
        $decl ==> $this->removeOverrideAttributeFromGetFixedNode($decl),
      ),
      new TypedMigrationStep(
        'Removed getTargetType() method',
        HHAST\MethodishDeclaration::class,
        HHAST\Node::class,
        $decl ==> $this->removeGetTargetTypeMethod($decl),
      ),
      new TypedMigrationStep(
        'Normalize blank lines between declarations',
        HHAST\ClassishBody::class,
        HHAST\ClassishBody::class,
        $body ==> $this->normalizeEmptyLines($body),
      ),
    ];
  }

  private function normalizeEmptyLines(
    HHAST\ClassishBody $body,
  ): HHAST\ClassishBody {
    $elements = $body->getElements()?->getChildren();
    if ($elements === null) {
      return $body;
    }
    $elements = vec($elements);
    foreach ($elements as $idx => $it) {
      if (
        $idx === 0 ||
        (
          $it is HHAST\TypeConstDeclaration &&
          $elements[$idx - 1] is HHAST\TypeConstDeclaration
        ) ||
        (
          $it is HHAST\ConstDeclaration &&
          $elements[$idx - 1] is HHAST\ConstDeclaration
        )
      ) {
        $want_empty = false;
      } else {
        $want_empty = true;
      }
      $first = $it->getFirstTokenx();
      $leading = $first->getLeading();
      $empty = ($leading is HHAST\EndOfLine)
        ? $leading
        : (
            (
              $leading is HHAST\NodeList<_> &&
              $leading->getChildren()[0] is HHAST\EndOfLine
            )
              ? $leading->getChildren()[0]
              : null
          );
      $have_empty = $empty !== null;
      if ($have_empty === $want_empty) {
        continue;
      }

      if ($want_empty /* && !$have_empty */ ) {
        $body = $body->replace(
          $first,
          $first->withLeading(new HHAST\NodeList(vec[
            new HHAST\EndOfLine("\n"),
            $leading,
          ])),
        );
        continue;
      }

      $body = $body->without($empty as nonnull);
    }

    return $body;
  }

  private function removeGetTargetTypeMethod(
    HHAST\MethodishDeclaration $decl,
  ): HHAST\Node {
    if (
      $decl->getFunctionDeclHeader()->getName()->getText() !== 'getTargetType'
    ) {
      return $decl;
    }
    return HHAST\Missing();
  }

  private function removeOverrideAttributeFromGetFixedNode(
    HHAST\MethodishDeclaration $decl,
  ): HHAST\MethodishDeclaration {
    if (
      $decl->getFunctionDeclHeader()->getName()->getText() !== 'getFixedNode'
    ) {
      return $decl;
    }
    $attrs = $decl->getAttributeSpec()?->getAttributes();
    if ($attrs === null) {
      return $decl;
    }
    $attr_items = $attrs->getChildren();
    if (C\count($attr_items) === 1) {
      return $decl->without($decl->getAttributeSpecx())
        ->replace(
          $decl->getFirstTokenx(),
          $decl->getFirstTokenx()->withLeading(
            $decl->getAttributeSpecx()->getFirstTokenx()->getLeading(),
          ),
        );
    }

    $override = C\find(
      $attr_items,
      $attr ==> $attr->getItemx()
        ->getType()
        ->getFirstTokenx()
        ->getText() ===
        '__Override',
    );
    if ($override !== null) {
      return $decl->without($override);
    }
    return $decl;
  }

  private function updateLintErrorConstructorCall(
    HHAST\ConstructorCall $cc,
    string $node_param_name,
    bool $is_autofixing,
  ): HHAST\ConstructorCall {
    if (!$is_autofixing) {
      return $cc;
    }
    if (
      (
        ($cc->getType() ?as HHAST\SimpleTypeSpecifier)?->getSpecifier() ?as
          HHAST\NameToken
      )?->getText() !==
        'ASTLintError'
    ) {
      return $cc;
    }
    $al = $cc->getArgumentListx();
    if (C\count($al->getChildren()) >= 4) {
      // already done
      return $cc;
    }
    $missing = HHAST\Missing();
    return $cc->withArgumentList(
      new HHAST\NodeList(
        Vec\concat(
          $al->getChildren(),
          vec[
            C\lastx($al->getChildren())->getFirstTokenx()->getLeading(),
            new HHAST\UnparsedReplacementCodeNode(
              '() ==> $this->getFixedNode(%s),',
              $node_param_name,
            ),
            new HHAST\EndOfLine("\n"),
          ],
        ),
      ),
    );
  }

  private function updateGetLintErrorForNodeSignature(
    HHAST\MethodishDeclaration $decl,
    Ref<string> $node_param_name,
  ): HHAST\MethodishDeclaration {
    $header = $decl->getFunctionDeclHeader();
    if ($header->getName()->getText() !== 'getLintErrorForNode') {
      return $decl;
    }

    $param_list = $header->getParameterListx();
    $params = $param_list->getChildrenOfItems();
    $last = C\lastx($params) as HHAST\ParameterDeclaration;
    $node_param_name->set(($last->getName() as HHAST\VariableToken)->getText());
    // Add TContext parameter if needed
    if (C\count($params) === 1) {
      $missing = HHAST\Missing();
      $header = $header->withParameterList(
        new HHAST\NodeList(Vec\concat(
          vec[
            $last->withName(
              new HHAST\VariableToken($missing, $missing, '$_context'),
            )
              ->withType(new HHAST\TypeConstant(
                new HHAST\ThisToken($missing, $missing),
                new HHAST\ColonColonToken($missing, $missing),
                new HHAST\NameToken($missing, $missing, 'TContext'),
              )),
          ],
          $params,
        )),
      );
    }

    $type = $header->getType()
      ?->getDescendantsOfType(HHAST\GenericTypeSpecifier::class)[0] ??
      null;
    if ($type !== null) {
      $header = $header->replace(
        $type,
        new HHAST\SimpleTypeSpecifier(
          ($type->getClassType() as HHAST\NameToken)
            ->withTrailing(
              $type->getArgumentList()->getRightAngle()->getTrailing(),
            ),
        ),
      );
    }
    return $decl->withFunctionDeclHeader($header);
  }

  private function removeGenericsFromParentClass(
    HHAST\ClassishDeclaration $decl,
    Ref<?HHAST\ITypeSpecifier> $t_node,
    Ref<bool> $is_autofixing,
  ): HHAST\ClassishDeclaration {
    $parent = ($decl->getExtendsListx()->getChildrenOfItems()[0] ?? null) ?as
      HHAST\GenericTypeSpecifier;
    if ($parent === null) {
      return $decl;
    }

    $t_node->set(
      C\onlyx($parent->getArgumentList()->getTypes()->getChildrenOfItems()),
    );
    $is_autofixing->set(
      Str\starts_with(
        ($parent->getClassType() ?as HHAST\NameToken)?->getText() ?? '',
        'AutoFixing',
      ),
    );
    return $decl->replace(
      $parent,
      new HHAST\SimpleTypeSpecifier(
        ($parent->getClassTypex() as HHAST\Token)->withTrailing(
          $parent->getArgumentList()->getRightAngle()->getTrailing(),
        ),
      ),
    );
  }

  private function addTypeConstants(
    HHAST\ClassishDeclaration $decl,
    ?HHAST\ITypeSpecifier $t_node,
  ): HHAST\ClassishDeclaration {
    if ($t_node === null) {
      return $decl;
    }

    $missing = HHAST\Missing();
    $elements = $decl->getBody()->getElementsx();
    $new_elements = vec[];
    if (
      C\any(
        $elements->getChildrenOfType(HHAST\TypeConstDeclaration::class),
        $tc ==> $tc->getName()->getText() === 'TNode',
      )
    ) {
      return $decl;
    }
    $first = C\first($elements->getChildren()) ?? $missing;
    if (
      !C\any(
        $elements->getChildrenOfType(HHAST\TypeConstDeclaration::class),
        $tc ==> $tc->getName()->getText() === 'TContext',
      )
    ) {
      $new_elements[] = new HHAST\TypeConstDeclaration(
        /* attrs = */ $missing,
        /* abstract = */ $missing,
        /* keyword = */ new HHAST\ConstToken(
          $first->getFirstToken()?->getLeading() ?? $missing,
          new HHAST\WhiteSpace(' '),
        ),
        /* type keyword = */ new HHAST\TypeToken(
          $missing,
          new HHAST\WhiteSpace(' '),
        ),
        /* name = */ new HHAST\NameToken(
          $missing,
          new HHAST\WhiteSpace(' '),
          'TContext',
        ),
        /* type parameters = */ $missing,
        /* type_constraint = */ $missing,
        /* equal = */ new HHAST\EqualToken($missing, new HHAST\WhiteSpace(' ')),
        /* type = */ new HHAST\SimpleTypeSpecifier(
          new HHAST\NameToken($missing, $missing, 'Script'),
        ),
        /* semicolon = */ new HHAST\SemicolonToken(
          $missing,
          new HHAST\EndOfLine("\n"),
        ),
      );
    }
    $new_elements[] = new HHAST\TypeConstDeclaration(
      /* attrs = */ $missing,
      /* abstract = */ $missing,
      /* keyword = */ new HHAST\ConstToken(
        $first->getFirstToken()?->getLeading() ?? $missing,
        new HHAST\WhiteSpace(' '),
      ),
      /* type keyword = */ new HHAST\TypeToken(
        $missing,
        new HHAST\WhiteSpace(' '),
      ),
      /* name = */ new HHAST\NameToken(
        $missing,
        new HHAST\WhiteSpace(' '),
        'TNode',
      ),
      /* type parameters = */ $missing,
      /* type_constraint = */ $missing,
      /* equal = */ new HHAST\EqualToken($missing, new HHAST\WhiteSpace(' ')),
      /* type = */ $t_node,
      /* semicolon = */ new HHAST\SemicolonToken(
        $missing,
        new HHAST\EndOfLine("\n"),
      ),
    );
    return $decl->replace(
      $elements,
      HHAST\NodeList::concat(new HHAST\NodeList($new_elements), $elements),
    );
  }
}
