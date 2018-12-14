<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b3e5dda58e32eed54c8d5ade7868651d>>
 */
namespace Facebook\HHAST\__Private;
use namespace Facebook\HHAST;

function editable_node_from_json(
  dict<string, mixed> $json,
  string $file,
  int $offset,
  string $source,
): HHAST\EditableNode {
  switch ((string)$json['kind']) {
    case 'token':
      return HHAST\EditableToken::fromJSON(
        /* HH_IGNORE_ERROR[4110] */ $json['token'],
        $file,
        $offset,
        $source,
      );
    case 'list':
      return HHAST\EditableList::fromJSON($json, $file, $offset, $source);
    case 'missing':
      return HHAST\Missing();
    case 'after_halt_compiler':
      return HHAST\AfterHaltCompiler::fromJSON($json, $file, $offset, $source);
    case 'delimited_comment':
      return HHAST\DelimitedComment::fromJSON($json, $file, $offset, $source);
    case 'end_of_line':
      return HHAST\EndOfLine::fromJSON($json, $file, $offset, $source);
    case 'extra_token_error':
      return HHAST\ExtraTokenError::fromJSON($json, $file, $offset, $source);
    case 'fall_through':
      return HHAST\FallThrough::fromJSON($json, $file, $offset, $source);
    case 'fix_me':
      return HHAST\FixMe::fromJSON($json, $file, $offset, $source);
    case 'ignore_error':
      return HHAST\IgnoreError::fromJSON($json, $file, $offset, $source);
    case 'single_line_comment':
      return HHAST\SingleLineComment::fromJSON($json, $file, $offset, $source);
    case 'unsafe':
      return HHAST\Unsafe::fromJSON($json, $file, $offset, $source);
    case 'unsafe_expression':
      return HHAST\UnsafeExpression::fromJSON($json, $file, $offset, $source);
    case 'whitespace':
      return HHAST\WhiteSpace::fromJSON($json, $file, $offset, $source);
    case 'alias_declaration':
      return HHAST\AliasDeclaration::fromJSON($json, $file, $offset, $source);
    case 'alternate_else_clause':
      return
        HHAST\AlternateElseClause::fromJSON($json, $file, $offset, $source);
    case 'alternate_elseif_clause':
      return
        HHAST\AlternateElseifClause::fromJSON($json, $file, $offset, $source);
    case 'alternate_if_statement':
      return
        HHAST\AlternateIfStatement::fromJSON($json, $file, $offset, $source);
    case 'alternate_loop_statement':
      return
        HHAST\AlternateLoopStatement::fromJSON($json, $file, $offset, $source);
    case 'alternate_switch_statement':
      return HHAST\AlternateSwitchStatement::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'anonymous_class':
      return HHAST\AnonymousClass::fromJSON($json, $file, $offset, $source);
    case 'anonymous_function':
      return HHAST\AnonymousFunction::fromJSON($json, $file, $offset, $source);
    case 'anonymous_function_use_clause':
      return HHAST\AnonymousFunctionUseClause::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'array_creation_expression':
      return
        HHAST\ArrayCreationExpression::fromJSON($json, $file, $offset, $source);
    case 'array_intrinsic_expression':
      return HHAST\ArrayIntrinsicExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'as_expression':
      return HHAST\AsExpression::fromJSON($json, $file, $offset, $source);
    case 'attribute_specification':
      return
        HHAST\AttributeSpecification::fromJSON($json, $file, $offset, $source);
    case 'awaitable_creation_expression':
      return HHAST\AwaitableCreationExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'binary_expression':
      return HHAST\BinaryExpression::fromJSON($json, $file, $offset, $source);
    case 'braced_expression':
      return HHAST\BracedExpression::fromJSON($json, $file, $offset, $source);
    case 'break_statement':
      return HHAST\BreakStatement::fromJSON($json, $file, $offset, $source);
    case 'case_label':
      return HHAST\CaseLabel::fromJSON($json, $file, $offset, $source);
    case 'cast_expression':
      return HHAST\CastExpression::fromJSON($json, $file, $offset, $source);
    case 'catch_clause':
      return HHAST\CatchClause::fromJSON($json, $file, $offset, $source);
    case 'classish_body':
      return HHAST\ClassishBody::fromJSON($json, $file, $offset, $source);
    case 'classish_declaration':
      return
        HHAST\ClassishDeclaration::fromJSON($json, $file, $offset, $source);
    case 'classname_type_specifier':
      return
        HHAST\ClassnameTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'closure_parameter_type_specifier':
      return HHAST\ClosureParameterTypeSpecifier::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'closure_type_specifier':
      return
        HHAST\ClosureTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'collection_literal_expression':
      return HHAST\CollectionLiteralExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'compound_statement':
      return HHAST\CompoundStatement::fromJSON($json, $file, $offset, $source);
    case 'concurrent_statement':
      return
        HHAST\ConcurrentStatement::fromJSON($json, $file, $offset, $source);
    case 'conditional_expression':
      return
        HHAST\ConditionalExpression::fromJSON($json, $file, $offset, $source);
    case 'const_declaration':
      return HHAST\ConstDeclaration::fromJSON($json, $file, $offset, $source);
    case 'constant_declarator':
      return HHAST\ConstantDeclarator::fromJSON($json, $file, $offset, $source);
    case 'constructor_call':
      return HHAST\ConstructorCall::fromJSON($json, $file, $offset, $source);
    case 'continue_statement':
      return HHAST\ContinueStatement::fromJSON($json, $file, $offset, $source);
    case 'darray_intrinsic_expression':
      return HHAST\DarrayIntrinsicExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'darray_type_specifier':
      return
        HHAST\DarrayTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'declare_block_statement':
      return
        HHAST\DeclareBlockStatement::fromJSON($json, $file, $offset, $source);
    case 'declare_directive_statement':
      return HHAST\DeclareDirectiveStatement::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'decorated_expression':
      return
        HHAST\DecoratedExpression::fromJSON($json, $file, $offset, $source);
    case 'default_label':
      return HHAST\DefaultLabel::fromJSON($json, $file, $offset, $source);
    case 'define_expression':
      return HHAST\DefineExpression::fromJSON($json, $file, $offset, $source);
    case 'dictionary_intrinsic_expression':
      return HHAST\DictionaryIntrinsicExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'dictionary_type_specifier':
      return
        HHAST\DictionaryTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'do_statement':
      return HHAST\DoStatement::fromJSON($json, $file, $offset, $source);
    case 'echo_statement':
      return HHAST\EchoStatement::fromJSON($json, $file, $offset, $source);
    case 'element_initializer':
      return HHAST\ElementInitializer::fromJSON($json, $file, $offset, $source);
    case 'else_clause':
      return HHAST\ElseClause::fromJSON($json, $file, $offset, $source);
    case 'elseif_clause':
      return HHAST\ElseifClause::fromJSON($json, $file, $offset, $source);
    case 'embedded_braced_expression':
      return HHAST\EmbeddedBracedExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'embedded_member_selection_expression':
      return HHAST\EmbeddedMemberSelectionExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'embedded_subscript_expression':
      return HHAST\EmbeddedSubscriptExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'empty_expression':
      return HHAST\EmptyExpression::fromJSON($json, $file, $offset, $source);
    case 'end_of_file':
      return HHAST\EndOfFile::fromJSON($json, $file, $offset, $source);
    case 'enum_declaration':
      return HHAST\EnumDeclaration::fromJSON($json, $file, $offset, $source);
    case 'enumerator':
      return HHAST\Enumerator::fromJSON($json, $file, $offset, $source);
    case 'error':
      return HHAST\ErrorSyntax::fromJSON($json, $file, $offset, $source);
    case 'eval_expression':
      return HHAST\EvalExpression::fromJSON($json, $file, $offset, $source);
    case 'expression_statement':
      return
        HHAST\ExpressionStatement::fromJSON($json, $file, $offset, $source);
    case 'field_initializer':
      return HHAST\FieldInitializer::fromJSON($json, $file, $offset, $source);
    case 'field_specifier':
      return HHAST\FieldSpecifier::fromJSON($json, $file, $offset, $source);
    case 'finally_clause':
      return HHAST\FinallyClause::fromJSON($json, $file, $offset, $source);
    case 'for_statement':
      return HHAST\ForStatement::fromJSON($json, $file, $offset, $source);
    case 'foreach_statement':
      return HHAST\ForeachStatement::fromJSON($json, $file, $offset, $source);
    case 'function_call_expression':
      return
        HHAST\FunctionCallExpression::fromJSON($json, $file, $offset, $source);
    case 'function_call_with_type_arguments_expression':
      return HHAST\FunctionCallWithTypeArgumentsExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'function_declaration':
      return
        HHAST\FunctionDeclaration::fromJSON($json, $file, $offset, $source);
    case 'function_declaration_header':
      return HHAST\FunctionDeclarationHeader::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'function_static_statement':
      return
        HHAST\FunctionStaticStatement::fromJSON($json, $file, $offset, $source);
    case 'generic_type_specifier':
      return
        HHAST\GenericTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'global_statement':
      return HHAST\GlobalStatement::fromJSON($json, $file, $offset, $source);
    case 'goto_label':
      return HHAST\GotoLabel::fromJSON($json, $file, $offset, $source);
    case 'goto_statement':
      return HHAST\GotoStatement::fromJSON($json, $file, $offset, $source);
    case 'halt_compiler_expression':
      return
        HHAST\HaltCompilerExpression::fromJSON($json, $file, $offset, $source);
    case 'if_statement':
      return HHAST\IfStatement::fromJSON($json, $file, $offset, $source);
    case 'inclusion_directive':
      return HHAST\InclusionDirective::fromJSON($json, $file, $offset, $source);
    case 'inclusion_expression':
      return
        HHAST\InclusionExpression::fromJSON($json, $file, $offset, $source);
    case 'instanceof_expression':
      return
        HHAST\InstanceofExpression::fromJSON($json, $file, $offset, $source);
    case 'is_expression':
      return HHAST\IsExpression::fromJSON($json, $file, $offset, $source);
    case 'isset_expression':
      return HHAST\IssetExpression::fromJSON($json, $file, $offset, $source);
    case 'keyset_intrinsic_expression':
      return HHAST\KeysetIntrinsicExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'keyset_type_specifier':
      return
        HHAST\KeysetTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'lambda_expression':
      return HHAST\LambdaExpression::fromJSON($json, $file, $offset, $source);
    case 'lambda_signature':
      return HHAST\LambdaSignature::fromJSON($json, $file, $offset, $source);
    case 'let_statement':
      return HHAST\LetStatement::fromJSON($json, $file, $offset, $source);
    case 'list_expression':
      return HHAST\ListExpression::fromJSON($json, $file, $offset, $source);
    case 'list_item':
      return HHAST\ListItem::fromJSON($json, $file, $offset, $source);
    case 'literal':
      return HHAST\LiteralExpression::fromJSON($json, $file, $offset, $source);
    case 'map_array_type_specifier':
      return
        HHAST\MapArrayTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'markup_section':
      return HHAST\MarkupSection::fromJSON($json, $file, $offset, $source);
    case 'markup_suffix':
      return HHAST\MarkupSuffix::fromJSON($json, $file, $offset, $source);
    case 'member_selection_expression':
      return HHAST\MemberSelectionExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'methodish_declaration':
      return
        HHAST\MethodishDeclaration::fromJSON($json, $file, $offset, $source);
    case 'methodish_trait_resolution':
      return HHAST\MethodishTraitResolution::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'namespace_body':
      return HHAST\NamespaceBody::fromJSON($json, $file, $offset, $source);
    case 'namespace_declaration':
      return
        HHAST\NamespaceDeclaration::fromJSON($json, $file, $offset, $source);
    case 'namespace_empty_body':
      return HHAST\NamespaceEmptyBody::fromJSON($json, $file, $offset, $source);
    case 'namespace_group_use_declaration':
      return HHAST\NamespaceGroupUseDeclaration::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'namespace_use_clause':
      return HHAST\NamespaceUseClause::fromJSON($json, $file, $offset, $source);
    case 'namespace_use_declaration':
      return
        HHAST\NamespaceUseDeclaration::fromJSON($json, $file, $offset, $source);
    case 'nullable_as_expression':
      return
        HHAST\NullableAsExpression::fromJSON($json, $file, $offset, $source);
    case 'nullable_type_specifier':
      return
        HHAST\NullableTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'object_creation_expression':
      return HHAST\ObjectCreationExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'parameter_declaration':
      return
        HHAST\ParameterDeclaration::fromJSON($json, $file, $offset, $source);
    case 'parenthesized_expression':
      return
        HHAST\ParenthesizedExpression::fromJSON($json, $file, $offset, $source);
    case 'php7_anonymous_function':
      return
        HHAST\Php7AnonymousFunction::fromJSON($json, $file, $offset, $source);
    case 'pipe_variable':
      return
        HHAST\PipeVariableExpression::fromJSON($json, $file, $offset, $source);
    case 'postfix_unary_expression':
      return
        HHAST\PostfixUnaryExpression::fromJSON($json, $file, $offset, $source);
    case 'prefix_unary_expression':
      return
        HHAST\PrefixUnaryExpression::fromJSON($json, $file, $offset, $source);
    case 'prefixed_string':
      return HHAST\PrefixedStringExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'property_declaration':
      return
        HHAST\PropertyDeclaration::fromJSON($json, $file, $offset, $source);
    case 'property_declarator':
      return HHAST\PropertyDeclarator::fromJSON($json, $file, $offset, $source);
    case 'qualified_name':
      return HHAST\QualifiedName::fromJSON($json, $file, $offset, $source);
    case 'reified_type_argument':
      return
        HHAST\ReifiedTypeArgument::fromJSON($json, $file, $offset, $source);
    case 'require_clause':
      return HHAST\RequireClause::fromJSON($json, $file, $offset, $source);
    case 'return_statement':
      return HHAST\ReturnStatement::fromJSON($json, $file, $offset, $source);
    case 'safe_member_selection_expression':
      return HHAST\SafeMemberSelectionExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'scope_resolution_expression':
      return HHAST\ScopeResolutionExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'script':
      return HHAST\Script::fromJSON($json, $file, $offset, $source);
    case 'shape_expression':
      return HHAST\ShapeExpression::fromJSON($json, $file, $offset, $source);
    case 'shape_type_specifier':
      return HHAST\ShapeTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'simple_initializer':
      return HHAST\SimpleInitializer::fromJSON($json, $file, $offset, $source);
    case 'simple_type_specifier':
      return
        HHAST\SimpleTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'soft_type_specifier':
      return HHAST\SoftTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'static_declarator':
      return HHAST\StaticDeclarator::fromJSON($json, $file, $offset, $source);
    case 'subscript_expression':
      return
        HHAST\SubscriptExpression::fromJSON($json, $file, $offset, $source);
    case 'switch_fallthrough':
      return HHAST\SwitchFallthrough::fromJSON($json, $file, $offset, $source);
    case 'switch_section':
      return HHAST\SwitchSection::fromJSON($json, $file, $offset, $source);
    case 'switch_statement':
      return HHAST\SwitchStatement::fromJSON($json, $file, $offset, $source);
    case 'throw_statement':
      return HHAST\ThrowStatement::fromJSON($json, $file, $offset, $source);
    case 'trait_use':
      return HHAST\TraitUse::fromJSON($json, $file, $offset, $source);
    case 'trait_use_alias_item':
      return HHAST\TraitUseAliasItem::fromJSON($json, $file, $offset, $source);
    case 'trait_use_conflict_resolution':
      return HHAST\TraitUseConflictResolution::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'trait_use_precedence_item':
      return
        HHAST\TraitUsePrecedenceItem::fromJSON($json, $file, $offset, $source);
    case 'try_statement':
      return HHAST\TryStatement::fromJSON($json, $file, $offset, $source);
    case 'tuple_expression':
      return HHAST\TupleExpression::fromJSON($json, $file, $offset, $source);
    case 'tuple_type_explicit_specifier':
      return HHAST\TupleTypeExplicitSpecifier::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'tuple_type_specifier':
      return HHAST\TupleTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'type_arguments':
      return HHAST\TypeArguments::fromJSON($json, $file, $offset, $source);
    case 'type_const_declaration':
      return
        HHAST\TypeConstDeclaration::fromJSON($json, $file, $offset, $source);
    case 'type_constant':
      return HHAST\TypeConstant::fromJSON($json, $file, $offset, $source);
    case 'type_constraint':
      return HHAST\TypeConstraint::fromJSON($json, $file, $offset, $source);
    case 'type_parameter':
      return HHAST\TypeParameter::fromJSON($json, $file, $offset, $source);
    case 'type_parameters':
      return HHAST\TypeParameters::fromJSON($json, $file, $offset, $source);
    case 'unset_statement':
      return HHAST\UnsetStatement::fromJSON($json, $file, $offset, $source);
    case 'using_statement_block_scoped':
      return HHAST\UsingStatementBlockScoped::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'using_statement_function_scoped':
      return HHAST\UsingStatementFunctionScoped::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'variable':
      return HHAST\VariableExpression::fromJSON($json, $file, $offset, $source);
    case 'variadic_parameter':
      return HHAST\VariadicParameter::fromJSON($json, $file, $offset, $source);
    case 'varray_intrinsic_expression':
      return HHAST\VarrayIntrinsicExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'varray_type_specifier':
      return
        HHAST\VarrayTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'vector_array_type_specifier':
      return HHAST\VectorArrayTypeSpecifier::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'vector_intrinsic_expression':
      return HHAST\VectorIntrinsicExpression::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'vector_type_specifier':
      return
        HHAST\VectorTypeSpecifier::fromJSON($json, $file, $offset, $source);
    case 'where_clause':
      return HHAST\WhereClause::fromJSON($json, $file, $offset, $source);
    case 'where_constraint':
      return HHAST\WhereConstraint::fromJSON($json, $file, $offset, $source);
    case 'while_statement':
      return HHAST\WhileStatement::fromJSON($json, $file, $offset, $source);
    case 'xhp_category_declaration':
      return
        HHAST\XHPCategoryDeclaration::fromJSON($json, $file, $offset, $source);
    case 'xhp_children_declaration':
      return
        HHAST\XHPChildrenDeclaration::fromJSON($json, $file, $offset, $source);
    case 'xhp_children_parenthesized_list':
      return HHAST\XHPChildrenParenthesizedList::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'xhp_class_attribute':
      return HHAST\XHPClassAttribute::fromJSON($json, $file, $offset, $source);
    case 'xhp_class_attribute_declaration':
      return HHAST\XHPClassAttributeDeclaration::fromJSON(
        $json,
        $file,
        $offset,
        $source,
      );
    case 'xhp_close':
      return HHAST\XHPClose::fromJSON($json, $file, $offset, $source);
    case 'xhp_enum_type':
      return HHAST\XHPEnumType::fromJSON($json, $file, $offset, $source);
    case 'xhp_expression':
      return HHAST\XHPExpression::fromJSON($json, $file, $offset, $source);
    case 'xhp_open':
      return HHAST\XHPOpen::fromJSON($json, $file, $offset, $source);
    case 'xhp_required':
      return HHAST\XHPRequired::fromJSON($json, $file, $offset, $source);
    case 'xhp_simple_attribute':
      return HHAST\XHPSimpleAttribute::fromJSON($json, $file, $offset, $source);
    case 'xhp_simple_class_attribute':
      return
        HHAST\XHPSimpleClassAttribute::fromJSON($json, $file, $offset, $source);
    case 'xhp_spread_attribute':
      return HHAST\XHPSpreadAttribute::fromJSON($json, $file, $offset, $source);
    case 'yield_expression':
      return HHAST\YieldExpression::fromJSON($json, $file, $offset, $source);
    case 'yield_from_expression':
      return
        HHAST\YieldFromExpression::fromJSON($json, $file, $offset, $source);
    default:
      throw new HHAST\UnsupportedASTNodeError(
        $file,
        $offset,
        (string)$json['kind'],
      );
  }
}
