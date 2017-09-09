<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3685c23659cd2dff8182f1f3a4495048>>
 */
namespace Facebook\HHAST\__Private;
use namespace Facebook\HHAST;

function editable_syntax_from_json(
  array<string, mixed> $json,
  int $position,
  string $source,
): HHAST\EditableSyntax {
  switch ((string)$json['kind']) {
    case 'token':
      return HHAST\EditableToken::from_json(/* HH_IGNORE_ERROR[4110] */
        $json['token'],
        $position,
        $source,
      );
    case 'list':
      return HHAST\EditableList::from_json($json, $position, $source);
    case 'missing':
      return HHAST\Missing::getInstance();
    case 'whitespace':
      return HHAST\WhiteSpace::from_json($json, $position, $source);
    case 'end_of_line':
      return HHAST\EndOfLine::from_json($json, $position, $source);
    case 'delimited_comment':
      return HHAST\DelimitedComment::from_json($json, $position, $source);
    case 'single_line_comment':
      return HHAST\SingleLineComment::from_json($json, $position, $source);
    case 'unsafe':
      return HHAST\Unsafe::from_json($json, $position, $source);
    case 'unsafe_expression':
      return HHAST\UnsafeExpression::from_json($json, $position, $source);
    case 'fix_me':
      return HHAST\FixMe::from_json($json, $position, $source);
    case 'ignore_error':
      return HHAST\IgnoreError::from_json($json, $position, $source);
    case 'fall_through':
      return HHAST\FallThrough::from_json($json, $position, $source);
    case 'end_of_file':
      return HHAST\EndOfFile::from_json($json, $position, $source);
    case 'script':
      return HHAST\Script::from_json($json, $position, $source);
    case 'simple_type_specifier':
      return HHAST\SimpleTypeSpecifier::from_json($json, $position, $source);
    case 'literal_expression':
      return HHAST\LiteralExpression::from_json($json, $position, $source);
    case 'variable_expression':
      return HHAST\VariableExpression::from_json($json, $position, $source);
    case 'qualified_name_expression':
      return
        HHAST\QualifiedNameExpression::from_json($json, $position, $source);
    case 'pipe_variable_expression':
      return HHAST\PipeVariableExpression::from_json($json, $position, $source);
    case 'enum_declaration':
      return HHAST\EnumDeclaration::from_json($json, $position, $source);
    case 'enumerator':
      return HHAST\Enumerator::from_json($json, $position, $source);
    case 'alias_declaration':
      return HHAST\AliasDeclaration::from_json($json, $position, $source);
    case 'property_declaration':
      return HHAST\PropertyDeclaration::from_json($json, $position, $source);
    case 'property_declarator':
      return HHAST\PropertyDeclarator::from_json($json, $position, $source);
    case 'namespace_declaration':
      return HHAST\NamespaceDeclaration::from_json($json, $position, $source);
    case 'namespace_body':
      return HHAST\NamespaceBody::from_json($json, $position, $source);
    case 'namespace_empty_body':
      return HHAST\NamespaceEmptyBody::from_json($json, $position, $source);
    case 'namespace_use_declaration':
      return
        HHAST\NamespaceUseDeclaration::from_json($json, $position, $source);
    case 'namespace_group_use_declaration':
      return HHAST\NamespaceGroupUseDeclaration::from_json(
        $json,
        $position,
        $source,
      );
    case 'namespace_use_clause':
      return HHAST\NamespaceUseClause::from_json($json, $position, $source);
    case 'function_declaration':
      return HHAST\FunctionDeclaration::from_json($json, $position, $source);
    case 'function_declaration_header':
      return
        HHAST\FunctionDeclarationHeader::from_json($json, $position, $source);
    case 'where_clause':
      return HHAST\WhereClause::from_json($json, $position, $source);
    case 'where_constraint':
      return HHAST\WhereConstraint::from_json($json, $position, $source);
    case 'methodish_declaration':
      return HHAST\MethodishDeclaration::from_json($json, $position, $source);
    case 'classish_declaration':
      return HHAST\ClassishDeclaration::from_json($json, $position, $source);
    case 'classish_body':
      return HHAST\ClassishBody::from_json($json, $position, $source);
    case 'trait_use_conflict_resolution_item':
      return HHAST\TraitUseConflictResolutionItem::from_json(
        $json,
        $position,
        $source,
      );
    case 'trait_use_conflict_resolution':
      return
        HHAST\TraitUseConflictResolution::from_json($json, $position, $source);
    case 'trait_use':
      return HHAST\TraitUse::from_json($json, $position, $source);
    case 'require_clause':
      return HHAST\RequireClause::from_json($json, $position, $source);
    case 'const_declaration':
      return HHAST\ConstDeclaration::from_json($json, $position, $source);
    case 'constant_declarator':
      return HHAST\ConstantDeclarator::from_json($json, $position, $source);
    case 'type_const_declaration':
      return HHAST\TypeConstDeclaration::from_json($json, $position, $source);
    case 'decorated_expression':
      return HHAST\DecoratedExpression::from_json($json, $position, $source);
    case 'parameter_declaration':
      return HHAST\ParameterDeclaration::from_json($json, $position, $source);
    case 'variadic_parameter':
      return HHAST\VariadicParameter::from_json($json, $position, $source);
    case 'attribute_specification':
      return HHAST\AttributeSpecification::from_json($json, $position, $source);
    case 'attribute':
      return HHAST\Attribute::from_json($json, $position, $source);
    case 'inclusion_expression':
      return HHAST\InclusionExpression::from_json($json, $position, $source);
    case 'inclusion_directive':
      return HHAST\InclusionDirective::from_json($json, $position, $source);
    case 'compound_statement':
      return HHAST\CompoundStatement::from_json($json, $position, $source);
    case 'expression_statement':
      return HHAST\ExpressionStatement::from_json($json, $position, $source);
    case 'markup_section':
      return HHAST\MarkupSection::from_json($json, $position, $source);
    case 'markup_suffix':
      return HHAST\MarkupSuffix::from_json($json, $position, $source);
    case 'unset_statement':
      return HHAST\UnsetStatement::from_json($json, $position, $source);
    case 'while_statement':
      return HHAST\WhileStatement::from_json($json, $position, $source);
    case 'if_statement':
      return HHAST\IfStatement::from_json($json, $position, $source);
    case 'elseif_clause':
      return HHAST\ElseifClause::from_json($json, $position, $source);
    case 'else_clause':
      return HHAST\ElseClause::from_json($json, $position, $source);
    case 'try_statement':
      return HHAST\TryStatement::from_json($json, $position, $source);
    case 'catch_clause':
      return HHAST\CatchClause::from_json($json, $position, $source);
    case 'finally_clause':
      return HHAST\FinallyClause::from_json($json, $position, $source);
    case 'do_statement':
      return HHAST\DoStatement::from_json($json, $position, $source);
    case 'for_statement':
      return HHAST\ForStatement::from_json($json, $position, $source);
    case 'foreach_statement':
      return HHAST\ForeachStatement::from_json($json, $position, $source);
    case 'switch_statement':
      return HHAST\SwitchStatement::from_json($json, $position, $source);
    case 'switch_section':
      return HHAST\SwitchSection::from_json($json, $position, $source);
    case 'switch_fallthrough':
      return HHAST\SwitchFallthrough::from_json($json, $position, $source);
    case 'case_label':
      return HHAST\CaseLabel::from_json($json, $position, $source);
    case 'default_label':
      return HHAST\DefaultLabel::from_json($json, $position, $source);
    case 'return_statement':
      return HHAST\ReturnStatement::from_json($json, $position, $source);
    case 'goto_label':
      return HHAST\GotoLabel::from_json($json, $position, $source);
    case 'goto_statement':
      return HHAST\GotoStatement::from_json($json, $position, $source);
    case 'throw_statement':
      return HHAST\ThrowStatement::from_json($json, $position, $source);
    case 'break_statement':
      return HHAST\BreakStatement::from_json($json, $position, $source);
    case 'continue_statement':
      return HHAST\ContinueStatement::from_json($json, $position, $source);
    case 'function_static_statement':
      return
        HHAST\FunctionStaticStatement::from_json($json, $position, $source);
    case 'static_declarator':
      return HHAST\StaticDeclarator::from_json($json, $position, $source);
    case 'echo_statement':
      return HHAST\EchoStatement::from_json($json, $position, $source);
    case 'global_statement':
      return HHAST\GlobalStatement::from_json($json, $position, $source);
    case 'simple_initializer':
      return HHAST\SimpleInitializer::from_json($json, $position, $source);
    case 'anonymous_function':
      return HHAST\AnonymousFunction::from_json($json, $position, $source);
    case 'anonymous_function_use_clause':
      return
        HHAST\AnonymousFunctionUseClause::from_json($json, $position, $source);
    case 'lambda_expression':
      return HHAST\LambdaExpression::from_json($json, $position, $source);
    case 'lambda_signature':
      return HHAST\LambdaSignature::from_json($json, $position, $source);
    case 'cast_expression':
      return HHAST\CastExpression::from_json($json, $position, $source);
    case 'scope_resolution_expression':
      return
        HHAST\ScopeResolutionExpression::from_json($json, $position, $source);
    case 'member_selection_expression':
      return
        HHAST\MemberSelectionExpression::from_json($json, $position, $source);
    case 'safe_member_selection_expression':
      return HHAST\SafeMemberSelectionExpression::from_json(
        $json,
        $position,
        $source,
      );
    case 'embedded_member_selection_expression':
      return HHAST\EmbeddedMemberSelectionExpression::from_json(
        $json,
        $position,
        $source,
      );
    case 'yield_expression':
      return HHAST\YieldExpression::from_json($json, $position, $source);
    case 'prefix_unary_expression':
      return HHAST\PrefixUnaryExpression::from_json($json, $position, $source);
    case 'postfix_unary_expression':
      return HHAST\PostfixUnaryExpression::from_json($json, $position, $source);
    case 'binary_expression':
      return HHAST\BinaryExpression::from_json($json, $position, $source);
    case 'instanceof_expression':
      return HHAST\InstanceofExpression::from_json($json, $position, $source);
    case 'conditional_expression':
      return HHAST\ConditionalExpression::from_json($json, $position, $source);
    case 'eval_expression':
      return HHAST\EvalExpression::from_json($json, $position, $source);
    case 'empty_expression':
      return HHAST\EmptyExpression::from_json($json, $position, $source);
    case 'define_expression':
      return HHAST\DefineExpression::from_json($json, $position, $source);
    case 'isset_expression':
      return HHAST\IssetExpression::from_json($json, $position, $source);
    case 'function_call_expression':
      return HHAST\FunctionCallExpression::from_json($json, $position, $source);
    case 'parenthesized_expression':
      return
        HHAST\ParenthesizedExpression::from_json($json, $position, $source);
    case 'braced_expression':
      return HHAST\BracedExpression::from_json($json, $position, $source);
    case 'embedded_braced_expression':
      return
        HHAST\EmbeddedBracedExpression::from_json($json, $position, $source);
    case 'list_expression':
      return HHAST\ListExpression::from_json($json, $position, $source);
    case 'collection_literal_expression':
      return
        HHAST\CollectionLiteralExpression::from_json($json, $position, $source);
    case 'object_creation_expression':
      return
        HHAST\ObjectCreationExpression::from_json($json, $position, $source);
    case 'array_creation_expression':
      return
        HHAST\ArrayCreationExpression::from_json($json, $position, $source);
    case 'array_intrinsic_expression':
      return
        HHAST\ArrayIntrinsicExpression::from_json($json, $position, $source);
    case 'darray_intrinsic_expression':
      return
        HHAST\DarrayIntrinsicExpression::from_json($json, $position, $source);
    case 'dictionary_intrinsic_expression':
      return HHAST\DictionaryIntrinsicExpression::from_json(
        $json,
        $position,
        $source,
      );
    case 'keyset_intrinsic_expression':
      return
        HHAST\KeysetIntrinsicExpression::from_json($json, $position, $source);
    case 'varray_intrinsic_expression':
      return
        HHAST\VarrayIntrinsicExpression::from_json($json, $position, $source);
    case 'vector_intrinsic_expression':
      return
        HHAST\VectorIntrinsicExpression::from_json($json, $position, $source);
    case 'element_initializer':
      return HHAST\ElementInitializer::from_json($json, $position, $source);
    case 'subscript_expression':
      return HHAST\SubscriptExpression::from_json($json, $position, $source);
    case 'embedded_subscript_expression':
      return
        HHAST\EmbeddedSubscriptExpression::from_json($json, $position, $source);
    case 'awaitable_creation_expression':
      return
        HHAST\AwaitableCreationExpression::from_json($json, $position, $source);
    case 'xhp_children_declaration':
      return HHAST\XHPChildrenDeclaration::from_json($json, $position, $source);
    case 'xhp_children_parenthesized_list':
      return HHAST\XHPChildrenParenthesizedList::from_json(
        $json,
        $position,
        $source,
      );
    case 'xhp_category_declaration':
      return HHAST\XHPCategoryDeclaration::from_json($json, $position, $source);
    case 'xhp_enum_type':
      return HHAST\XHPEnumType::from_json($json, $position, $source);
    case 'xhp_required':
      return HHAST\XHPRequired::from_json($json, $position, $source);
    case 'xhp_class_attribute_declaration':
      return HHAST\XHPClassAttributeDeclaration::from_json(
        $json,
        $position,
        $source,
      );
    case 'xhp_class_attribute':
      return HHAST\XHPClassAttribute::from_json($json, $position, $source);
    case 'xhp_simple_class_attribute':
      return
        HHAST\XHPSimpleClassAttribute::from_json($json, $position, $source);
    case 'xhp_attribute':
      return HHAST\XHPAttribute::from_json($json, $position, $source);
    case 'xhp_open':
      return HHAST\XHPOpen::from_json($json, $position, $source);
    case 'xhp_expression':
      return HHAST\XHPExpression::from_json($json, $position, $source);
    case 'xhp_close':
      return HHAST\XHPClose::from_json($json, $position, $source);
    case 'type_constant':
      return HHAST\TypeConstant::from_json($json, $position, $source);
    case 'vector_type_specifier':
      return HHAST\VectorTypeSpecifier::from_json($json, $position, $source);
    case 'keyset_type_specifier':
      return HHAST\KeysetTypeSpecifier::from_json($json, $position, $source);
    case 'tuple_type_explicit_specifier':
      return
        HHAST\TupleTypeExplicitSpecifier::from_json($json, $position, $source);
    case 'varray_type_specifier':
      return HHAST\VarrayTypeSpecifier::from_json($json, $position, $source);
    case 'vector_array_type_specifier':
      return
        HHAST\VectorArrayTypeSpecifier::from_json($json, $position, $source);
    case 'type_parameter':
      return HHAST\TypeParameter::from_json($json, $position, $source);
    case 'type_constraint':
      return HHAST\TypeConstraint::from_json($json, $position, $source);
    case 'darray_type_specifier':
      return HHAST\DarrayTypeSpecifier::from_json($json, $position, $source);
    case 'map_array_type_specifier':
      return HHAST\MapArrayTypeSpecifier::from_json($json, $position, $source);
    case 'dictionary_type_specifier':
      return
        HHAST\DictionaryTypeSpecifier::from_json($json, $position, $source);
    case 'closure_type_specifier':
      return HHAST\ClosureTypeSpecifier::from_json($json, $position, $source);
    case 'classname_type_specifier':
      return HHAST\ClassnameTypeSpecifier::from_json($json, $position, $source);
    case 'field_specifier':
      return HHAST\FieldSpecifier::from_json($json, $position, $source);
    case 'field_initializer':
      return HHAST\FieldInitializer::from_json($json, $position, $source);
    case 'shape_type_specifier':
      return HHAST\ShapeTypeSpecifier::from_json($json, $position, $source);
    case 'shape_expression':
      return HHAST\ShapeExpression::from_json($json, $position, $source);
    case 'tuple_expression':
      return HHAST\TupleExpression::from_json($json, $position, $source);
    case 'generic_type_specifier':
      return HHAST\GenericTypeSpecifier::from_json($json, $position, $source);
    case 'nullable_type_specifier':
      return HHAST\NullableTypeSpecifier::from_json($json, $position, $source);
    case 'soft_type_specifier':
      return HHAST\SoftTypeSpecifier::from_json($json, $position, $source);
    case 'type_arguments':
      return HHAST\TypeArguments::from_json($json, $position, $source);
    case 'type_parameters':
      return HHAST\TypeParameters::from_json($json, $position, $source);
    case 'tuple_type_specifier':
      return HHAST\TupleTypeSpecifier::from_json($json, $position, $source);
    case 'error':
      return HHAST\ErrorSyntax::from_json($json, $position, $source);
    case 'list_item':
      return HHAST\ListItem::from_json($json, $position, $source);
    default:
      throw new \Exception('unexpected JSON kind: '.(string)$json['kind']);
  }
}
