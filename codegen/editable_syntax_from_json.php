<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e12a96f8bf99691759d82164d51f4c49>>
 */
namespace Facebook\HHAST\__Private;
use namespace Facebook\HHAST;

function editable_syntax_from_json(
  dict<string, mixed> $json,
  int $position,
  string $source,
): HHAST\EditableSyntax {
  switch ((string)$json['kind']) {
    case 'token':
      return HHAST\EditableToken::fromJSON(/* HH_IGNORE_ERROR[4110] */
        $json['token'],
        $position,
        $source,
      );
    case 'list':
      return HHAST\EditableList::fromJSON($json, $position, $source);
    case 'missing':
      return HHAST\Missing();
    case 'whitespace':
      return HHAST\WhiteSpace::fromJSON($json, $position, $source);
    case 'end_of_line':
      return HHAST\EndOfLine::fromJSON($json, $position, $source);
    case 'delimited_comment':
      return HHAST\DelimitedComment::fromJSON($json, $position, $source);
    case 'single_line_comment':
      return HHAST\SingleLineComment::fromJSON($json, $position, $source);
    case 'unsafe':
      return HHAST\Unsafe::fromJSON($json, $position, $source);
    case 'unsafe_expression':
      return HHAST\UnsafeExpression::fromJSON($json, $position, $source);
    case 'fix_me':
      return HHAST\FixMe::fromJSON($json, $position, $source);
    case 'ignore_error':
      return HHAST\IgnoreError::fromJSON($json, $position, $source);
    case 'fall_through':
      return HHAST\FallThrough::fromJSON($json, $position, $source);
    case 'end_of_file':
      return HHAST\EndOfFile::fromJSON($json, $position, $source);
    case 'script':
      return HHAST\Script::fromJSON($json, $position, $source);
    case 'simple_type_specifier':
      return HHAST\SimpleTypeSpecifier::fromJSON($json, $position, $source);
    case 'literal':
      return HHAST\LiteralExpression::fromJSON($json, $position, $source);
    case 'variable':
      return HHAST\VariableExpression::fromJSON($json, $position, $source);
    case 'qualified_name':
      return HHAST\QualifiedNameExpression::fromJSON($json, $position, $source);
    case 'pipe_variable':
      return HHAST\PipeVariableExpression::fromJSON($json, $position, $source);
    case 'enum_declaration':
      return HHAST\EnumDeclaration::fromJSON($json, $position, $source);
    case 'enumerator':
      return HHAST\Enumerator::fromJSON($json, $position, $source);
    case 'alias_declaration':
      return HHAST\AliasDeclaration::fromJSON($json, $position, $source);
    case 'property_declaration':
      return HHAST\PropertyDeclaration::fromJSON($json, $position, $source);
    case 'property_declarator':
      return HHAST\PropertyDeclarator::fromJSON($json, $position, $source);
    case 'namespace_declaration':
      return HHAST\NamespaceDeclaration::fromJSON($json, $position, $source);
    case 'namespace_body':
      return HHAST\NamespaceBody::fromJSON($json, $position, $source);
    case 'namespace_empty_body':
      return HHAST\NamespaceEmptyBody::fromJSON($json, $position, $source);
    case 'namespace_use_declaration':
      return HHAST\NamespaceUseDeclaration::fromJSON($json, $position, $source);
    case 'namespace_group_use_declaration':
      return
        HHAST\NamespaceGroupUseDeclaration::fromJSON($json, $position, $source);
    case 'namespace_use_clause':
      return HHAST\NamespaceUseClause::fromJSON($json, $position, $source);
    case 'function_declaration':
      return HHAST\FunctionDeclaration::fromJSON($json, $position, $source);
    case 'function_declaration_header':
      return
        HHAST\FunctionDeclarationHeader::fromJSON($json, $position, $source);
    case 'where_clause':
      return HHAST\WhereClause::fromJSON($json, $position, $source);
    case 'where_constraint':
      return HHAST\WhereConstraint::fromJSON($json, $position, $source);
    case 'methodish_declaration':
      return HHAST\MethodishDeclaration::fromJSON($json, $position, $source);
    case 'classish_declaration':
      return HHAST\ClassishDeclaration::fromJSON($json, $position, $source);
    case 'classish_body':
      return HHAST\ClassishBody::fromJSON($json, $position, $source);
    case 'trait_use_conflict_resolution_item':
      return HHAST\TraitUseConflictResolutionItem::fromJSON(
        $json,
        $position,
        $source,
      );
    case 'trait_use_conflict_resolution':
      return
        HHAST\TraitUseConflictResolution::fromJSON($json, $position, $source);
    case 'trait_use':
      return HHAST\TraitUse::fromJSON($json, $position, $source);
    case 'require_clause':
      return HHAST\RequireClause::fromJSON($json, $position, $source);
    case 'const_declaration':
      return HHAST\ConstDeclaration::fromJSON($json, $position, $source);
    case 'constant_declarator':
      return HHAST\ConstantDeclarator::fromJSON($json, $position, $source);
    case 'type_const_declaration':
      return HHAST\TypeConstDeclaration::fromJSON($json, $position, $source);
    case 'decorated_expression':
      return HHAST\DecoratedExpression::fromJSON($json, $position, $source);
    case 'parameter_declaration':
      return HHAST\ParameterDeclaration::fromJSON($json, $position, $source);
    case 'variadic_parameter':
      return HHAST\VariadicParameter::fromJSON($json, $position, $source);
    case 'attribute_specification':
      return HHAST\AttributeSpecification::fromJSON($json, $position, $source);
    case 'attribute':
      return HHAST\Attribute::fromJSON($json, $position, $source);
    case 'inclusion_expression':
      return HHAST\InclusionExpression::fromJSON($json, $position, $source);
    case 'inclusion_directive':
      return HHAST\InclusionDirective::fromJSON($json, $position, $source);
    case 'compound_statement':
      return HHAST\CompoundStatement::fromJSON($json, $position, $source);
    case 'expression_statement':
      return HHAST\ExpressionStatement::fromJSON($json, $position, $source);
    case 'markup_section':
      return HHAST\MarkupSection::fromJSON($json, $position, $source);
    case 'markup_suffix':
      return HHAST\MarkupSuffix::fromJSON($json, $position, $source);
    case 'unset_statement':
      return HHAST\UnsetStatement::fromJSON($json, $position, $source);
    case 'while_statement':
      return HHAST\WhileStatement::fromJSON($json, $position, $source);
    case 'if_statement':
      return HHAST\IfStatement::fromJSON($json, $position, $source);
    case 'elseif_clause':
      return HHAST\ElseifClause::fromJSON($json, $position, $source);
    case 'else_clause':
      return HHAST\ElseClause::fromJSON($json, $position, $source);
    case 'try_statement':
      return HHAST\TryStatement::fromJSON($json, $position, $source);
    case 'catch_clause':
      return HHAST\CatchClause::fromJSON($json, $position, $source);
    case 'finally_clause':
      return HHAST\FinallyClause::fromJSON($json, $position, $source);
    case 'do_statement':
      return HHAST\DoStatement::fromJSON($json, $position, $source);
    case 'for_statement':
      return HHAST\ForStatement::fromJSON($json, $position, $source);
    case 'foreach_statement':
      return HHAST\ForeachStatement::fromJSON($json, $position, $source);
    case 'switch_statement':
      return HHAST\SwitchStatement::fromJSON($json, $position, $source);
    case 'switch_section':
      return HHAST\SwitchSection::fromJSON($json, $position, $source);
    case 'switch_fallthrough':
      return HHAST\SwitchFallthrough::fromJSON($json, $position, $source);
    case 'case_label':
      return HHAST\CaseLabel::fromJSON($json, $position, $source);
    case 'default_label':
      return HHAST\DefaultLabel::fromJSON($json, $position, $source);
    case 'return_statement':
      return HHAST\ReturnStatement::fromJSON($json, $position, $source);
    case 'goto_label':
      return HHAST\GotoLabel::fromJSON($json, $position, $source);
    case 'goto_statement':
      return HHAST\GotoStatement::fromJSON($json, $position, $source);
    case 'throw_statement':
      return HHAST\ThrowStatement::fromJSON($json, $position, $source);
    case 'break_statement':
      return HHAST\BreakStatement::fromJSON($json, $position, $source);
    case 'continue_statement':
      return HHAST\ContinueStatement::fromJSON($json, $position, $source);
    case 'function_static_statement':
      return HHAST\FunctionStaticStatement::fromJSON($json, $position, $source);
    case 'static_declarator':
      return HHAST\StaticDeclarator::fromJSON($json, $position, $source);
    case 'echo_statement':
      return HHAST\EchoStatement::fromJSON($json, $position, $source);
    case 'global_statement':
      return HHAST\GlobalStatement::fromJSON($json, $position, $source);
    case 'simple_initializer':
      return HHAST\SimpleInitializer::fromJSON($json, $position, $source);
    case 'anonymous_function':
      return HHAST\AnonymousFunction::fromJSON($json, $position, $source);
    case 'anonymous_function_use_clause':
      return
        HHAST\AnonymousFunctionUseClause::fromJSON($json, $position, $source);
    case 'lambda_expression':
      return HHAST\LambdaExpression::fromJSON($json, $position, $source);
    case 'lambda_signature':
      return HHAST\LambdaSignature::fromJSON($json, $position, $source);
    case 'cast_expression':
      return HHAST\CastExpression::fromJSON($json, $position, $source);
    case 'scope_resolution_expression':
      return
        HHAST\ScopeResolutionExpression::fromJSON($json, $position, $source);
    case 'member_selection_expression':
      return
        HHAST\MemberSelectionExpression::fromJSON($json, $position, $source);
    case 'safe_member_selection_expression':
      return HHAST\SafeMemberSelectionExpression::fromJSON(
        $json,
        $position,
        $source,
      );
    case 'embedded_member_selection_expression':
      return HHAST\EmbeddedMemberSelectionExpression::fromJSON(
        $json,
        $position,
        $source,
      );
    case 'yield_expression':
      return HHAST\YieldExpression::fromJSON($json, $position, $source);
    case 'prefix_unary_expression':
      return HHAST\PrefixUnaryExpression::fromJSON($json, $position, $source);
    case 'postfix_unary_expression':
      return HHAST\PostfixUnaryExpression::fromJSON($json, $position, $source);
    case 'binary_expression':
      return HHAST\BinaryExpression::fromJSON($json, $position, $source);
    case 'instanceof_expression':
      return HHAST\InstanceofExpression::fromJSON($json, $position, $source);
    case 'conditional_expression':
      return HHAST\ConditionalExpression::fromJSON($json, $position, $source);
    case 'eval_expression':
      return HHAST\EvalExpression::fromJSON($json, $position, $source);
    case 'empty_expression':
      return HHAST\EmptyExpression::fromJSON($json, $position, $source);
    case 'define_expression':
      return HHAST\DefineExpression::fromJSON($json, $position, $source);
    case 'isset_expression':
      return HHAST\IssetExpression::fromJSON($json, $position, $source);
    case 'function_call_expression':
      return HHAST\FunctionCallExpression::fromJSON($json, $position, $source);
    case 'parenthesized_expression':
      return HHAST\ParenthesizedExpression::fromJSON($json, $position, $source);
    case 'braced_expression':
      return HHAST\BracedExpression::fromJSON($json, $position, $source);
    case 'embedded_braced_expression':
      return
        HHAST\EmbeddedBracedExpression::fromJSON($json, $position, $source);
    case 'list_expression':
      return HHAST\ListExpression::fromJSON($json, $position, $source);
    case 'collection_literal_expression':
      return
        HHAST\CollectionLiteralExpression::fromJSON($json, $position, $source);
    case 'object_creation_expression':
      return
        HHAST\ObjectCreationExpression::fromJSON($json, $position, $source);
    case 'array_creation_expression':
      return HHAST\ArrayCreationExpression::fromJSON($json, $position, $source);
    case 'array_intrinsic_expression':
      return
        HHAST\ArrayIntrinsicExpression::fromJSON($json, $position, $source);
    case 'darray_intrinsic_expression':
      return
        HHAST\DarrayIntrinsicExpression::fromJSON($json, $position, $source);
    case 'dictionary_intrinsic_expression':
      return HHAST\DictionaryIntrinsicExpression::fromJSON(
        $json,
        $position,
        $source,
      );
    case 'keyset_intrinsic_expression':
      return
        HHAST\KeysetIntrinsicExpression::fromJSON($json, $position, $source);
    case 'varray_intrinsic_expression':
      return
        HHAST\VarrayIntrinsicExpression::fromJSON($json, $position, $source);
    case 'vector_intrinsic_expression':
      return
        HHAST\VectorIntrinsicExpression::fromJSON($json, $position, $source);
    case 'element_initializer':
      return HHAST\ElementInitializer::fromJSON($json, $position, $source);
    case 'subscript_expression':
      return HHAST\SubscriptExpression::fromJSON($json, $position, $source);
    case 'embedded_subscript_expression':
      return
        HHAST\EmbeddedSubscriptExpression::fromJSON($json, $position, $source);
    case 'awaitable_creation_expression':
      return
        HHAST\AwaitableCreationExpression::fromJSON($json, $position, $source);
    case 'xhp_children_declaration':
      return HHAST\XHPChildrenDeclaration::fromJSON($json, $position, $source);
    case 'xhp_children_parenthesized_list':
      return
        HHAST\XHPChildrenParenthesizedList::fromJSON($json, $position, $source);
    case 'xhp_category_declaration':
      return HHAST\XHPCategoryDeclaration::fromJSON($json, $position, $source);
    case 'xhp_enum_type':
      return HHAST\XHPEnumType::fromJSON($json, $position, $source);
    case 'xhp_required':
      return HHAST\XHPRequired::fromJSON($json, $position, $source);
    case 'xhp_class_attribute_declaration':
      return
        HHAST\XHPClassAttributeDeclaration::fromJSON($json, $position, $source);
    case 'xhp_class_attribute':
      return HHAST\XHPClassAttribute::fromJSON($json, $position, $source);
    case 'xhp_simple_class_attribute':
      return HHAST\XHPSimpleClassAttribute::fromJSON($json, $position, $source);
    case 'xhp_attribute':
      return HHAST\XHPAttribute::fromJSON($json, $position, $source);
    case 'xhp_open':
      return HHAST\XHPOpen::fromJSON($json, $position, $source);
    case 'xhp_expression':
      return HHAST\XHPExpression::fromJSON($json, $position, $source);
    case 'xhp_close':
      return HHAST\XHPClose::fromJSON($json, $position, $source);
    case 'type_constant':
      return HHAST\TypeConstant::fromJSON($json, $position, $source);
    case 'vector_type_specifier':
      return HHAST\VectorTypeSpecifier::fromJSON($json, $position, $source);
    case 'keyset_type_specifier':
      return HHAST\KeysetTypeSpecifier::fromJSON($json, $position, $source);
    case 'tuple_type_explicit_specifier':
      return
        HHAST\TupleTypeExplicitSpecifier::fromJSON($json, $position, $source);
    case 'varray_type_specifier':
      return HHAST\VarrayTypeSpecifier::fromJSON($json, $position, $source);
    case 'vector_array_type_specifier':
      return
        HHAST\VectorArrayTypeSpecifier::fromJSON($json, $position, $source);
    case 'type_parameter':
      return HHAST\TypeParameter::fromJSON($json, $position, $source);
    case 'type_constraint':
      return HHAST\TypeConstraint::fromJSON($json, $position, $source);
    case 'darray_type_specifier':
      return HHAST\DarrayTypeSpecifier::fromJSON($json, $position, $source);
    case 'map_array_type_specifier':
      return HHAST\MapArrayTypeSpecifier::fromJSON($json, $position, $source);
    case 'dictionary_type_specifier':
      return HHAST\DictionaryTypeSpecifier::fromJSON($json, $position, $source);
    case 'closure_type_specifier':
      return HHAST\ClosureTypeSpecifier::fromJSON($json, $position, $source);
    case 'classname_type_specifier':
      return HHAST\ClassnameTypeSpecifier::fromJSON($json, $position, $source);
    case 'field_specifier':
      return HHAST\FieldSpecifier::fromJSON($json, $position, $source);
    case 'field_initializer':
      return HHAST\FieldInitializer::fromJSON($json, $position, $source);
    case 'shape_type_specifier':
      return HHAST\ShapeTypeSpecifier::fromJSON($json, $position, $source);
    case 'shape_expression':
      return HHAST\ShapeExpression::fromJSON($json, $position, $source);
    case 'tuple_expression':
      return HHAST\TupleExpression::fromJSON($json, $position, $source);
    case 'generic_type_specifier':
      return HHAST\GenericTypeSpecifier::fromJSON($json, $position, $source);
    case 'nullable_type_specifier':
      return HHAST\NullableTypeSpecifier::fromJSON($json, $position, $source);
    case 'soft_type_specifier':
      return HHAST\SoftTypeSpecifier::fromJSON($json, $position, $source);
    case 'type_arguments':
      return HHAST\TypeArguments::fromJSON($json, $position, $source);
    case 'type_parameters':
      return HHAST\TypeParameters::fromJSON($json, $position, $source);
    case 'tuple_type_specifier':
      return HHAST\TupleTypeSpecifier::fromJSON($json, $position, $source);
    case 'error':
      return HHAST\ErrorSyntax::fromJSON($json, $position, $source);
    case 'list_item':
      return HHAST\ListItem::fromJSON($json, $position, $source);
    default:
      throw new \Exception('unexpected JSON kind: '.(string)$json['kind']);
  }
}
