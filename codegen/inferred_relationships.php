<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<aa8bcf850d0d6dbf7a26de1515263737>>
 */
namespace Facebook\HHAST\__Private;

const dict<string, keyset<string>>
  INFERRED_RELATIONSHIPS = dict[
    'script.script_declarations' => keyset[
      'list',
    ],
    'markup_section.markup_prefix' => keyset[
      'missing',
      'token:?>',
    ],
    'markup_section.markup_text' => keyset[
      'token:markup',
      'missing',
    ],
    'markup_section.markup_suffix' => keyset[
      'markup_suffix',
      'missing',
    ],
    'markup_section.markup_expression' => keyset[
      'missing',
      'expression_statement',
    ],
    'markup_suffix.markup_suffix_less_than_question' => keyset[
      'token:<?',
    ],
    'markup_suffix.markup_suffix_name' => keyset[
      'token:name',
      'token:=',
      'missing',
    ],
    'classish_declaration.classish_attribute' => keyset[
      'missing',
      'attribute_specification',
    ],
    'classish_declaration.classish_modifiers' => keyset[
      'list',
      'missing',
    ],
    'classish_declaration.classish_keyword' => keyset[
      'token:class',
      'token:interface',
      'token:trait',
    ],
    'classish_declaration.classish_name' => keyset[
      'token:XHP_class_name',
      'token:name',
    ],
    'classish_declaration.classish_type_parameters' => keyset[
      'missing',
      'type_parameters',
    ],
    'classish_declaration.classish_extends_keyword' => keyset[
      'missing',
      'token:extends',
    ],
    'classish_declaration.classish_extends_list' => keyset[
      'missing',
      'list',
    ],
    'classish_declaration.classish_implements_keyword' => keyset[
      'missing',
      'token:implements',
    ],
    'classish_declaration.classish_implements_list' => keyset[
      'missing',
      'list',
    ],
    'classish_declaration.classish_body' => keyset[
      'classish_body',
    ],
    'classish_body.classish_body_left_brace' => keyset[
      'token:{',
      'missing',
    ],
    'classish_body.classish_body_elements' => keyset[
      'list',
      'missing',
    ],
    'classish_body.classish_body_right_brace' => keyset[
      'token:}',
      'missing',
    ],
    'methodish_declaration.methodish_attribute' => keyset[
      'missing',
      'attribute_specification',
    ],
    'methodish_declaration.methodish_function_decl_header' => keyset[
      'function_declaration_header',
    ],
    'methodish_declaration.methodish_function_body' => keyset[
      'compound_statement',
      'missing',
      'error',
    ],
    'methodish_declaration.methodish_semicolon' => keyset[
      'missing',
      'token:;',
    ],
    'function_declaration_header.function_modifiers' => keyset[
      'list',
      'missing',
    ],
    'function_declaration_header.function_keyword' => keyset[
      'token:function',
      'missing',
    ],
    'function_declaration_header.function_ampersand' => keyset[
      'missing',
      'token:&',
    ],
    'function_declaration_header.function_name' => keyset[
      'token:name',
      'token:__construct',
      'token:__destruct',
      'error',
    ],
    'function_declaration_header.function_type_parameter_list' => keyset[
      'missing',
      'type_parameters',
    ],
    'function_declaration_header.function_left_paren' => keyset[
      'token:(',
      'missing',
    ],
    'function_declaration_header.function_parameter_list' => keyset[
      'missing',
      'list',
    ],
    'function_declaration_header.function_right_paren' => keyset[
      'token:)',
      'missing',
    ],
    'function_declaration_header.function_colon' => keyset[
      'missing',
      'token::',
    ],
    'function_declaration_header.function_type' => keyset[
      'missing',
      'simple_type_specifier',
      'shape_type_specifier',
      'closure_type_specifier',
      'generic_type_specifier',
      'soft_type_specifier',
      'tuple_type_specifier',
      'vector_type_specifier',
      'nullable_type_specifier',
      'map_array_type_specifier',
      'dictionary_type_specifier',
      'keyset_type_specifier',
      'varray_type_specifier',
      'darray_type_specifier',
      'vector_array_type_specifier',
      'token:noreturn',
      'type_constant',
      'classname_type_specifier',
    ],
    'function_declaration_header.function_where_clause' => keyset[
      'missing',
      'where_clause',
    ],
    'compound_statement.compound_left_brace' => keyset[
      'token:{',
      'missing',
    ],
    'compound_statement.compound_statements' => keyset[
      'list',
      'missing',
    ],
    'compound_statement.compound_right_brace' => keyset[
      'token:}',
      'missing',
    ],
    'return_statement.return_keyword' => keyset[
      'token:return',
    ],
    'return_statement.return_expression' => keyset[
      'array_intrinsic_expression',
      'function_call_expression',
      'literal',
      'binary_expression',
      'object_creation_expression',
      'cast_expression',
      'conditional_expression',
      'variable',
      'prefix_unary_expression',
      'member_selection_expression',
      'anonymous_function',
      'lambda_expression',
      'isset_expression',
      'postfix_unary_expression',
      'subscript_expression',
      'missing',
      'scope_resolution_expression',
      'instanceof_expression',
      'parenthesized_expression',
      'array_creation_expression',
      'vector_intrinsic_expression',
      'token:name',
      'dictionary_intrinsic_expression',
      'shape_expression',
      'keyset_intrinsic_expression',
      'collection_literal_expression',
      'darray_intrinsic_expression',
      'varray_intrinsic_expression',
      'tuple_expression',
      'safe_member_selection_expression',
      'qualified_name',
      'yield_from_expression',
      'eval_expression',
      'function_call_with_type_arguments_expression',
      'xhp_expression',
      'awaitable_creation_expression',
    ],
    'return_statement.return_semicolon' => keyset[
      'token:;',
    ],
    'array_intrinsic_expression.array_intrinsic_keyword' => keyset[
      'token:array',
    ],
    'array_intrinsic_expression.array_intrinsic_left_paren' => keyset[
      'token:(',
    ],
    'array_intrinsic_expression.array_intrinsic_members' => keyset[
      'missing',
      'list',
    ],
    'array_intrinsic_expression.array_intrinsic_right_paren' => keyset[
      'token:)',
    ],
    'function_call_expression.function_call_receiver' => keyset[
      'scope_resolution_expression',
      'token:name',
      'variable',
      'member_selection_expression',
      'parenthesized_expression',
      'subscript_expression',
      'qualified_name',
      'function_call_expression',
      'array_creation_expression',
      'literal',
      'safe_member_selection_expression',
      'prefix_unary_expression',
    ],
    'function_call_expression.function_call_left_paren' => keyset[
      'token:(',
    ],
    'function_call_expression.function_call_argument_list' => keyset[
      'missing',
      'list',
    ],
    'function_call_expression.function_call_right_paren' => keyset[
      'token:)',
      'missing',
    ],
    'scope_resolution_expression.scope_resolution_qualifier' => keyset[
      'token:static',
      'token:XHP_class_name',
      'token:name',
      'token:self',
      'token:parent',
      'variable',
      'prefix_unary_expression',
      'generic_type_specifier',
      'simple_type_specifier',
      'qualified_name',
      'function_call_expression',
      'parenthesized_expression',
      'literal',
      'scope_resolution_expression',
      'pipe_variable',
    ],
    'scope_resolution_expression.scope_resolution_operator' => keyset[
      'token:::',
    ],
    'scope_resolution_expression.scope_resolution_name' => keyset[
      'token:name',
      'token:variable',
      'token:class',
      'prefix_unary_expression',
      'braced_expression',
    ],
    'list_item.list_item' => keyset[
      'simple_type_specifier',
      'xhp_class_attribute',
      'parameter_declaration',
      'binary_expression',
      'literal',
      'function_call_expression',
      'variable',
      'property_declarator',
      'scope_resolution_expression',
      'subscript_expression',
      'prefix_unary_expression',
      'postfix_unary_expression',
      'array_intrinsic_expression',
      'element_initializer',
      'parenthesized_expression',
      'token:variable',
      'field_specifier',
      'field_initializer',
      'type_parameter',
      'attribute',
      'shape_expression',
      'constant_declarator',
      'object_creation_expression',
      'token:name',
      'lambda_expression',
      'vector_intrinsic_expression',
      'collection_literal_expression',
      'member_selection_expression',
      'static_declarator',
      'generic_type_specifier',
      'closure_parameter_type_specifier',
      'instanceof_expression',
      'where_constraint',
      'anonymous_function',
      'xhp_expression',
      'cast_expression',
      'isset_expression',
      'trait_use_alias_item',
      'empty_expression',
      'nullable_type_specifier',
      'tuple_type_specifier',
      'closure_type_specifier',
      'conditional_expression',
      'array_creation_expression',
      'namespace_use_clause',
      'dictionary_intrinsic_expression',
      'keyset_intrinsic_expression',
      'inclusion_expression',
      'missing',
      'list_expression',
      'pipe_variable',
      'qualified_name',
      'variadic_parameter',
      'dictionary_type_specifier',
      'eval_expression',
      'decorated_expression',
      'varray_intrinsic_expression',
      'darray_intrinsic_expression',
      'vector_array_type_specifier',
      'tuple_expression',
      'trait_use_precedence_item',
      'vector_type_specifier',
      'type_constant',
      'awaitable_creation_expression',
      'safe_member_selection_expression',
      'define_expression',
      'shape_type_specifier',
      'token:XHP_category_name',
      'token:noreturn',
      'map_array_type_specifier',
      'xhp_simple_class_attribute',
      'classname_type_specifier',
    ],
    'list_item.list_separator' => keyset[
      'missing',
      'token:,',
      'token:;',
      'token:\\',
    ],
    'simple_type_specifier.simple_type_specifier' => keyset[
      'token:XHP_class_name',
      'token:mixed',
      'token:name',
      'token:int',
      'token:var',
      'token:string',
      'token:self',
      'token:array',
      'token:void',
      'token:bool',
      'token:float',
      'token:resource',
      'token:this',
      'token:parent',
      'token:double',
      'token:num',
      'token:object',
      'token:vec',
      'token:dict',
      'token:keyset',
      'qualified_name',
      'token:arraykey',
      'token:varray',
      'token:darray',
      'token:noreturn',
    ],
    'xhp_class_attribute_declaration.xhp_attribute_keyword' => keyset[
      'token:attribute',
    ],
    'xhp_class_attribute_declaration.xhp_attribute_attributes' => keyset[
      'list',
    ],
    'xhp_class_attribute_declaration.xhp_attribute_semicolon' => keyset[
      'token:;',
    ],
    'xhp_class_attribute.xhp_attribute_decl_type' => keyset[
      'simple_type_specifier',
      'generic_type_specifier',
      'xhp_enum_type',
      'nullable_type_specifier',
      'vector_array_type_specifier',
      'map_array_type_specifier',
    ],
    'xhp_class_attribute.xhp_attribute_decl_name' => keyset[
      'token:XHP_element_name',
    ],
    'xhp_class_attribute.xhp_attribute_decl_initializer' => keyset[
      'missing',
      'simple_initializer',
    ],
    'xhp_class_attribute.xhp_attribute_decl_required' => keyset[
      'missing',
      'xhp_required',
    ],
    'simple_initializer.simple_initializer_equal' => keyset[
      'token:=',
    ],
    'simple_initializer.simple_initializer_value' => keyset[
      'literal',
      'array_intrinsic_expression',
      'shape_expression',
      'collection_literal_expression',
      'token:name',
      'scope_resolution_expression',
      'subscript_expression',
      'array_creation_expression',
      'vector_intrinsic_expression',
      'dictionary_intrinsic_expression',
      'keyset_intrinsic_expression',
      'prefix_unary_expression',
      'binary_expression',
      'conditional_expression',
      'varray_intrinsic_expression',
      'darray_intrinsic_expression',
      'qualified_name',
      'function_call_expression',
      'parenthesized_expression',
      'tuple_expression',
      'xhp_expression',
    ],
    'function_declaration.function_attribute_spec' => keyset[
      'missing',
      'attribute_specification',
    ],
    'function_declaration.function_declaration_header' => keyset[
      'function_declaration_header',
    ],
    'function_declaration.function_body' => keyset[
      'compound_statement',
    ],
    'parameter_declaration.parameter_attribute' => keyset[
      'missing',
      'attribute_specification',
    ],
    'parameter_declaration.parameter_visibility' => keyset[
      'missing',
      'token:public',
      'token:protected',
      'token:private',
    ],
    'parameter_declaration.parameter_call_convention' => keyset[
      'missing',
      'token:inout',
    ],
    'parameter_declaration.parameter_type' => keyset[
      'simple_type_specifier',
      'missing',
      'shape_type_specifier',
      'generic_type_specifier',
      'closure_type_specifier',
      'nullable_type_specifier',
      'tuple_type_specifier',
      'soft_type_specifier',
      'vector_type_specifier',
      'type_constant',
      'classname_type_specifier',
      'dictionary_type_specifier',
      'keyset_type_specifier',
      'map_array_type_specifier',
      'vector_array_type_specifier',
      'varray_type_specifier',
      'darray_type_specifier',
      'error',
    ],
    'parameter_declaration.parameter_name' => keyset[
      'token:variable',
      'decorated_expression',
      'missing',
    ],
    'parameter_declaration.parameter_default_value' => keyset[
      'missing',
      'simple_initializer',
    ],
    'echo_statement.echo_keyword' => keyset[
      'token:echo',
    ],
    'echo_statement.echo_expressions' => keyset[
      'list',
    ],
    'echo_statement.echo_semicolon' => keyset[
      'token:;',
      'missing',
    ],
    'binary_expression.binary_left_operand' => keyset[
      'binary_expression',
      'subscript_expression',
      'variable',
      'member_selection_expression',
      'literal',
      'token:name',
      'function_call_expression',
      'prefix_unary_expression',
      'parenthesized_expression',
      'scope_resolution_expression',
      'list_expression',
      'postfix_unary_expression',
      'isset_expression',
      'xhp_expression',
      'cast_expression',
      'array_intrinsic_expression',
      'vector_intrinsic_expression',
      'object_creation_expression',
      'collection_literal_expression',
      'varray_intrinsic_expression',
      'darray_intrinsic_expression',
      'array_creation_expression',
      'instanceof_expression',
      'empty_expression',
      'safe_member_selection_expression',
      'dictionary_intrinsic_expression',
      'keyset_intrinsic_expression',
      'qualified_name',
      'token:<',
      'pipe_variable',
      'anonymous_function',
    ],
    'binary_expression.binary_operator' => keyset[
      'token:.',
      'token:-',
      'token:=',
      'token:===',
      'token:+',
      'token:>',
      'token:&',
      'token:<',
      'token:*',
      'token:^',
      'token:|',
      'token:<=',
      'token:>=',
      'token:==',
      'token:!=',
      'token:!==',
      'token:+=',
      'token:.=',
      'token:%',
      'token:||',
      'token:<=>',
      'token:<<',
      'token:&&',
      'token:?:',
      'token:/',
      'token:-=',
      'token:/=',
      'token:*=',
      'token:|=',
      'token:&=',
      'token:^=',
      'token:>>=',
      'token:**',
      'token:xor',
      'token:|>',
      'token:??',
      'token:and',
      'token:>>',
      'token:%=',
      'token:<>',
      'token:or',
      'token:<<=',
      'token:**=',
    ],
    'binary_expression.binary_right_operand' => keyset[
      'literal',
      'function_call_expression',
      'subscript_expression',
      'variable',
      'token:name',
      'anonymous_function',
      'object_creation_expression',
      'member_selection_expression',
      'binary_expression',
      'array_intrinsic_expression',
      'parenthesized_expression',
      'shape_expression',
      'prefix_unary_expression',
      'postfix_unary_expression',
      'lambda_expression',
      'collection_literal_expression',
      'vector_intrinsic_expression',
      'dictionary_intrinsic_expression',
      'keyset_intrinsic_expression',
      'cast_expression',
      'conditional_expression',
      'array_creation_expression',
      'isset_expression',
      'scope_resolution_expression',
      'empty_expression',
      'missing',
      'xhp_expression',
      'yield_expression',
      'inclusion_expression',
      'eval_expression',
      'php7_anonymous_function',
      'tuple_expression',
      'varray_intrinsic_expression',
      'darray_intrinsic_expression',
      'awaitable_creation_expression',
      'qualified_name',
      'yield_from_expression',
      'instanceof_expression',
      'safe_member_selection_expression',
      'pipe_variable',
      'token:end_of_file',
      'token:?',
      'function_call_with_type_arguments_expression',
    ],
    'subscript_expression.subscript_receiver' => keyset[
      'subscript_expression',
      'function_call_expression',
      'scope_resolution_expression',
      'variable',
      'member_selection_expression',
      'array_intrinsic_expression',
      'parenthesized_expression',
      'token:)',
      'token:name',
      'literal',
      'prefix_unary_expression',
      'safe_member_selection_expression',
      'array_creation_expression',
    ],
    'subscript_expression.subscript_left_bracket' => keyset[
      'token:[',
      'token:{',
    ],
    'subscript_expression.subscript_index' => keyset[
      'literal',
      'missing',
      'variable',
      'function_call_expression',
      'token:name',
      'scope_resolution_expression',
      'binary_expression',
      'cast_expression',
      'prefix_unary_expression',
      'postfix_unary_expression',
      'array_intrinsic_expression',
      'object_creation_expression',
      'member_selection_expression',
      'subscript_expression',
      'safe_member_selection_expression',
      'anonymous_function',
      'parenthesized_expression',
    ],
    'subscript_expression.subscript_right_bracket' => keyset[
      'token:]',
      'token:}',
      'missing',
    ],
    'expression_statement.expression_statement_expression' => keyset[
      'function_call_expression',
      'binary_expression',
      'xhp_expression',
      'prefix_unary_expression',
      'postfix_unary_expression',
      'missing',
      'object_creation_expression',
      'yield_expression',
      'define_expression',
      'inclusion_expression',
      'eval_expression',
      'token:name',
      'scope_resolution_expression',
      'subscript_expression',
      'isset_expression',
      'empty_expression',
      'literal',
      'anonymous_function',
      'parenthesized_expression',
      'member_selection_expression',
      'variable',
      'collection_literal_expression',
      'function_call_with_type_arguments_expression',
      'lambda_expression',
      'tuple_expression',
      'token:,',
      'yield_from_expression',
      'conditional_expression',
      'token:}',
      'safe_member_selection_expression',
      'qualified_name',
      'halt_compiler_expression',
      'token::',
      'token:===',
      'darray_intrinsic_expression',
      'varray_intrinsic_expression',
      'array_intrinsic_expression',
      'token:)',
    ],
    'expression_statement.expression_statement_semicolon' => keyset[
      'token:;',
      'missing',
    ],
    'property_declaration.property_modifiers' => keyset[
      'list',
      'token:var',
    ],
    'property_declaration.property_type' => keyset[
      'missing',
      'simple_type_specifier',
      'nullable_type_specifier',
      'generic_type_specifier',
      'varray_type_specifier',
      'darray_type_specifier',
      'vector_array_type_specifier',
      'soft_type_specifier',
      'tuple_type_specifier',
      'type_constant',
      'map_array_type_specifier',
      'dictionary_type_specifier',
      'closure_type_specifier',
    ],
    'property_declaration.property_declarators' => keyset[
      'list',
    ],
    'property_declaration.property_semicolon' => keyset[
      'token:;',
    ],
    'property_declarator.property_name' => keyset[
      'token:variable',
    ],
    'property_declarator.property_initializer' => keyset[
      'missing',
      'simple_initializer',
    ],
    'decorated_expression.decorated_expression_decorator' => keyset[
      'token:&',
      'token:...',
      'token:inout',
    ],
    'decorated_expression.decorated_expression_expression' => keyset[
      'token:variable',
      'variable',
      'decorated_expression',
      'array_creation_expression',
      'function_call_expression',
      'subscript_expression',
      'scope_resolution_expression',
    ],
    'end_of_file.end_of_file_token' => keyset[
      'token:end_of_file',
    ],
    'anonymous_function.anonymous_static_keyword' => keyset[
      'missing',
      'token:static',
    ],
    'anonymous_function.anonymous_async_keyword' => keyset[
      'missing',
      'token:async',
    ],
    'anonymous_function.anonymous_coroutine_keyword' => keyset[
      'missing',
      'token:coroutine',
    ],
    'anonymous_function.anonymous_function_keyword' => keyset[
      'token:function',
    ],
    'anonymous_function.anonymous_left_paren' => keyset[
      'token:(',
      'missing',
    ],
    'anonymous_function.anonymous_parameters' => keyset[
      'list',
      'missing',
    ],
    'anonymous_function.anonymous_right_paren' => keyset[
      'token:)',
      'missing',
    ],
    'anonymous_function.anonymous_colon' => keyset[
      'missing',
      'token::',
    ],
    'anonymous_function.anonymous_type' => keyset[
      'missing',
      'simple_type_specifier',
      'soft_type_specifier',
      'generic_type_specifier',
      'nullable_type_specifier',
      'tuple_type_specifier',
      'closure_type_specifier',
      'vector_array_type_specifier',
      'map_array_type_specifier',
    ],
    'anonymous_function.anonymous_use' => keyset[
      'missing',
      'anonymous_function_use_clause',
    ],
    'anonymous_function.anonymous_body' => keyset[
      'compound_statement',
    ],
    'if_statement.if_keyword' => keyset[
      'token:if',
    ],
    'if_statement.if_left_paren' => keyset[
      'token:(',
    ],
    'if_statement.if_condition' => keyset[
      'prefix_unary_expression',
      'binary_expression',
      'variable',
      'function_call_expression',
      'literal',
      'isset_expression',
      'subscript_expression',
      'array_intrinsic_expression',
      'member_selection_expression',
      'cast_expression',
      'instanceof_expression',
      'token:name',
      'parenthesized_expression',
      'empty_expression',
      'scope_resolution_expression',
      'is_expression',
    ],
    'if_statement.if_right_paren' => keyset[
      'token:)',
    ],
    'if_statement.if_statement' => keyset[
      'compound_statement',
      'throw_statement',
      'return_statement',
      'break_statement',
      'expression_statement',
      'unset_statement',
      'echo_statement',
      'global_statement',
      'continue_statement',
      'goto_statement',
    ],
    'if_statement.if_elseif_clauses' => keyset[
      'missing',
      'list',
    ],
    'if_statement.if_else_clause' => keyset[
      'missing',
      'else_clause',
    ],
    'prefix_unary_expression.prefix_unary_operator' => keyset[
      'token:!',
      'token:-',
      'token:~',
      'token:print',
      'token:++',
      'token:--',
      'token:$',
      'token:&',
      'token:clone',
      'token:@',
      'token:await',
      'token:+',
      'token:suspend',
    ],
    'prefix_unary_expression.prefix_unary_operand' => keyset[
      'variable',
      'literal',
      'member_selection_expression',
      'token:name',
      'function_call_expression',
      'isset_expression',
      'parenthesized_expression',
      'subscript_expression',
      'binary_expression',
      'token:variable',
      'braced_expression',
      'scope_resolution_expression',
      'object_creation_expression',
      'postfix_unary_expression',
      'inclusion_expression',
      'prefix_unary_expression',
      'cast_expression',
      'empty_expression',
      'conditional_expression',
      'define_expression',
      'instanceof_expression',
      'array_intrinsic_expression',
      'token:end_of_file',
      'eval_expression',
      'safe_member_selection_expression',
      'pipe_variable',
    ],
    'throw_statement.throw_keyword' => keyset[
      'token:throw',
    ],
    'throw_statement.throw_expression' => keyset[
      'object_creation_expression',
      'variable',
      'function_call_expression',
      'parenthesized_expression',
      'literal',
    ],
    'throw_statement.throw_semicolon' => keyset[
      'token:;',
    ],
    'object_creation_expression.object_creation_new_keyword' => keyset[
      'token:new',
    ],
    'object_creation_expression.object_creation_object' => keyset[
      'constructor_call',
      'anonymous_class',
    ],
    'constructor_call.constructor_call_type' => keyset[
      'simple_type_specifier',
      'token:name',
      'variable',
      'subscript_expression',
      'token:self',
      'qualified_name',
      'generic_type_specifier',
      'token:parent',
      'token:static',
      'scope_resolution_expression',
      'member_selection_expression',
      'parenthesized_expression',
    ],
    'constructor_call.constructor_call_left_paren' => keyset[
      'token:(',
      'missing',
    ],
    'constructor_call.constructor_call_argument_list' => keyset[
      'list',
      'missing',
    ],
    'constructor_call.constructor_call_right_paren' => keyset[
      'token:)',
      'missing',
    ],
    'xhp_expression.xhp_open' => keyset[
      'xhp_open',
    ],
    'xhp_expression.xhp_body' => keyset[
      'missing',
      'list',
    ],
    'xhp_expression.xhp_close' => keyset[
      'missing',
      'xhp_close',
    ],
    'xhp_open.xhp_open_left_angle' => keyset[
      'token:<',
    ],
    'xhp_open.xhp_open_name' => keyset[
      'token:XHP_element_name',
    ],
    'xhp_open.xhp_open_attributes' => keyset[
      'list',
      'missing',
    ],
    'xhp_open.xhp_open_right_angle' => keyset[
      'token:/>',
      'token:>',
      'missing',
    ],
    'xhp_simple_attribute.xhp_simple_attribute_name' => keyset[
      'token:XHP_element_name',
    ],
    'xhp_simple_attribute.xhp_simple_attribute_equal' => keyset[
      'token:=',
      'missing',
    ],
    'xhp_simple_attribute.xhp_simple_attribute_expression' => keyset[
      'braced_expression',
      'token:XHP_string_literal',
      'missing',
    ],
    'braced_expression.braced_expression_left_brace' => keyset[
      'token:{',
    ],
    'braced_expression.braced_expression_expression' => keyset[
      'token:name',
      'literal',
      'binary_expression',
      'function_call_expression',
      'variable',
      'object_creation_expression',
      'subscript_expression',
      'prefix_unary_expression',
      'collection_literal_expression',
      'array_intrinsic_expression',
    ],
    'braced_expression.braced_expression_right_brace' => keyset[
      'token:}',
    ],
    'xhp_close.xhp_close_left_angle' => keyset[
      'token:</',
      'token:end_of_file',
    ],
    'xhp_close.xhp_close_name' => keyset[
      'token:XHP_element_name',
      'missing',
    ],
    'xhp_close.xhp_close_right_angle' => keyset[
      'token:>',
      'missing',
    ],
    'member_selection_expression.member_object' => keyset[
      'variable',
      'member_selection_expression',
      'function_call_expression',
      'subscript_expression',
      'parenthesized_expression',
      'scope_resolution_expression',
      'pipe_variable',
      'prefix_unary_expression',
    ],
    'member_selection_expression.member_operator' => keyset[
      'token:->',
    ],
    'member_selection_expression.member_name' => keyset[
      'token:name',
      'token:variable',
      'braced_expression',
      'prefix_unary_expression',
      'token:XHP_class_name',
    ],
    'try_statement.try_keyword' => keyset[
      'token:try',
    ],
    'try_statement.try_compound_statement' => keyset[
      'compound_statement',
    ],
    'try_statement.try_catch_clauses' => keyset[
      'list',
      'missing',
    ],
    'try_statement.try_finally_clause' => keyset[
      'missing',
      'finally_clause',
    ],
    'catch_clause.catch_keyword' => keyset[
      'token:catch',
    ],
    'catch_clause.catch_left_paren' => keyset[
      'token:(',
    ],
    'catch_clause.catch_type' => keyset[
      'simple_type_specifier',
      'error',
    ],
    'catch_clause.catch_variable' => keyset[
      'token:variable',
      'missing',
    ],
    'catch_clause.catch_right_paren' => keyset[
      'token:)',
      'missing',
    ],
    'catch_clause.catch_body' => keyset[
      'compound_statement',
    ],
    'for_statement.for_keyword' => keyset[
      'token:for',
    ],
    'for_statement.for_left_paren' => keyset[
      'token:(',
    ],
    'for_statement.for_initializer' => keyset[
      'list',
      'missing',
    ],
    'for_statement.for_first_semicolon' => keyset[
      'token:;',
    ],
    'for_statement.for_control' => keyset[
      'list',
      'missing',
    ],
    'for_statement.for_second_semicolon' => keyset[
      'token:;',
    ],
    'for_statement.for_end_of_loop' => keyset[
      'list',
      'missing',
    ],
    'for_statement.for_right_paren' => keyset[
      'token:)',
    ],
    'for_statement.for_body' => keyset[
      'compound_statement',
      'expression_statement',
      'echo_statement',
      'for_statement',
      'unset_statement',
    ],
    'postfix_unary_expression.postfix_unary_operand' => keyset[
      'variable',
      'member_selection_expression',
      'subscript_expression',
      'prefix_unary_expression',
      'scope_resolution_expression',
    ],
    'postfix_unary_expression.postfix_unary_operator' => keyset[
      'token:++',
      'token:--',
    ],
    'cast_expression.cast_left_paren' => keyset[
      'token:(',
    ],
    'cast_expression.cast_type' => keyset[
      'token:int',
      'token:double',
      'token:string',
      'token:bool',
      'token:object',
      'token:array',
      'token:float',
      'token:unset',
      'token:name',
    ],
    'cast_expression.cast_right_paren' => keyset[
      'token:)',
    ],
    'cast_expression.cast_operand' => keyset[
      'variable',
      'parenthesized_expression',
      'literal',
      'function_call_expression',
      'member_selection_expression',
      'subscript_expression',
      'object_creation_expression',
      'token:name',
      'array_intrinsic_expression',
      'cast_expression',
      'array_creation_expression',
      'scope_resolution_expression',
      'vector_intrinsic_expression',
      'postfix_unary_expression',
      'collection_literal_expression',
      'dictionary_intrinsic_expression',
      'xhp_expression',
      'instanceof_expression',
      'anonymous_function',
      'prefix_unary_expression',
    ],
    'element_initializer.element_key' => keyset[
      'literal',
      'variable',
      'scope_resolution_expression',
      'token:name',
      'array_intrinsic_expression',
      'function_call_expression',
      'prefix_unary_expression',
      'object_creation_expression',
      'vector_intrinsic_expression',
      'dictionary_intrinsic_expression',
      'keyset_intrinsic_expression',
      'collection_literal_expression',
      'binary_expression',
      'parenthesized_expression',
      'qualified_name',
      'anonymous_function',
      'array_creation_expression',
      'cast_expression',
    ],
    'element_initializer.element_arrow' => keyset[
      'token:=>',
    ],
    'element_initializer.element_value' => keyset[
      'literal',
      'object_creation_expression',
      'prefix_unary_expression',
      'cast_expression',
      'token:name',
      'variable',
      'array_intrinsic_expression',
      'dictionary_intrinsic_expression',
      'array_creation_expression',
      'vector_intrinsic_expression',
      'keyset_intrinsic_expression',
      'conditional_expression',
      'scope_resolution_expression',
      'function_call_expression',
      'binary_expression',
      'collection_literal_expression',
      'anonymous_function',
      'darray_intrinsic_expression',
      'varray_intrinsic_expression',
      'tuple_expression',
      'member_selection_expression',
      'subscript_expression',
      'parenthesized_expression',
      'isset_expression',
      'qualified_name',
    ],
    'trait_use.trait_use_keyword' => keyset[
      'token:use',
    ],
    'trait_use.trait_use_names' => keyset[
      'list',
    ],
    'trait_use.trait_use_semicolon' => keyset[
      'token:;',
    ],
    'parenthesized_expression.parenthesized_expression_left_paren' => keyset[
      'token:(',
    ],
    'parenthesized_expression.parenthesized_expression_expression' => keyset[
      'binary_expression',
      'prefix_unary_expression',
      'conditional_expression',
      'function_call_expression',
      'postfix_unary_expression',
      'collection_literal_expression',
      'object_creation_expression',
      'variable',
      'literal',
      'instanceof_expression',
      'array_intrinsic_expression',
      'isset_expression',
      'xhp_expression',
      'parenthesized_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'member_selection_expression',
      'anonymous_function',
      'lambda_expression',
      'cast_expression',
      'yield_expression',
      'token:name',
      'qualified_name',
      'empty_expression',
      'inclusion_expression',
      'token:?',
    ],
    'parenthesized_expression.parenthesized_expression_right_paren' => keyset[
      'token:)',
      'missing',
    ],
    'foreach_statement.foreach_keyword' => keyset[
      'token:foreach',
    ],
    'foreach_statement.foreach_left_paren' => keyset[
      'token:(',
    ],
    'foreach_statement.foreach_collection' => keyset[
      'variable',
      'vector_intrinsic_expression',
      'array_intrinsic_expression',
      'function_call_expression',
      'member_selection_expression',
      'array_creation_expression',
      'subscript_expression',
      'object_creation_expression',
      'prefix_unary_expression',
      'parenthesized_expression',
      'scope_resolution_expression',
      'cast_expression',
      'collection_literal_expression',
      'anonymous_function',
    ],
    'foreach_statement.foreach_await_keyword' => keyset[
      'missing',
      'token:await',
    ],
    'foreach_statement.foreach_as' => keyset[
      'token:as',
    ],
    'foreach_statement.foreach_key' => keyset[
      'missing',
      'variable',
      'list_expression',
      'prefix_unary_expression',
      'subscript_expression',
      'function_call_expression',
      'member_selection_expression',
      'scope_resolution_expression',
    ],
    'foreach_statement.foreach_arrow' => keyset[
      'missing',
      'token:=>',
    ],
    'foreach_statement.foreach_value' => keyset[
      'variable',
      'prefix_unary_expression',
      'list_expression',
      'function_call_expression',
      'subscript_expression',
      'member_selection_expression',
      'scope_resolution_expression',
    ],
    'foreach_statement.foreach_right_paren' => keyset[
      'token:)',
    ],
    'foreach_statement.foreach_body' => keyset[
      'compound_statement',
      'expression_statement',
      'foreach_statement',
      'echo_statement',
    ],
    'conditional_expression.conditional_test' => keyset[
      'isset_expression',
      'parenthesized_expression',
      'binary_expression',
      'variable',
      'function_call_expression',
      'token:name',
      'literal',
      'empty_expression',
      'subscript_expression',
      'prefix_unary_expression',
      'member_selection_expression',
      'scope_resolution_expression',
      'conditional_expression',
      'instanceof_expression',
      'token:<',
    ],
    'conditional_expression.conditional_question' => keyset[
      'token:?',
    ],
    'conditional_expression.conditional_consequence' => keyset[
      'subscript_expression',
      'literal',
      'object_creation_expression',
      'array_intrinsic_expression',
      'token:name',
      'variable',
      'scope_resolution_expression',
      'function_call_expression',
      'prefix_unary_expression',
      'array_creation_expression',
      'collection_literal_expression',
      'cast_expression',
      'missing',
      'member_selection_expression',
      'parenthesized_expression',
      'binary_expression',
      'lambda_expression',
    ],
    'conditional_expression.conditional_colon' => keyset[
      'token::',
      'missing',
    ],
    'conditional_expression.conditional_alternative' => keyset[
      'literal',
      'object_creation_expression',
      'prefix_unary_expression',
      'token:name',
      'variable',
      'scope_resolution_expression',
      'binary_expression',
      'parenthesized_expression',
      'function_call_expression',
      'subscript_expression',
      'array_creation_expression',
      'collection_literal_expression',
      'array_intrinsic_expression',
      'isset_expression',
      'tuple_expression',
      'cast_expression',
      'anonymous_function',
      'missing',
      'lambda_expression',
    ],
    'isset_expression.isset_keyword' => keyset[
      'token:isset',
    ],
    'isset_expression.isset_left_paren' => keyset[
      'token:(',
    ],
    'isset_expression.isset_argument_list' => keyset[
      'list',
    ],
    'isset_expression.isset_right_paren' => keyset[
      'token:)',
    ],
    'global_statement.global_keyword' => keyset[
      'token:global',
    ],
    'global_statement.global_variables' => keyset[
      'list',
    ],
    'global_statement.global_semicolon' => keyset[
      'token:;',
    ],
    'alias_declaration.alias_attribute_spec' => keyset[
      'missing',
      'attribute_specification',
    ],
    'alias_declaration.alias_keyword' => keyset[
      'token:type',
      'token:newtype',
    ],
    'alias_declaration.alias_name' => keyset[
      'token:name',
    ],
    'alias_declaration.alias_generic_parameter' => keyset[
      'missing',
      'type_parameters',
    ],
    'alias_declaration.alias_constraint' => keyset[
      'missing',
      'type_constraint',
    ],
    'alias_declaration.alias_equal' => keyset[
      'token:=',
    ],
    'alias_declaration.alias_type' => keyset[
      'shape_type_specifier',
      'simple_type_specifier',
      'dictionary_type_specifier',
      'closure_type_specifier',
      'map_array_type_specifier',
      'tuple_type_specifier',
      'generic_type_specifier',
      'nullable_type_specifier',
      'vector_array_type_specifier',
      'keyset_type_specifier',
    ],
    'alias_declaration.alias_semicolon' => keyset[
      'token:;',
    ],
    'shape_type_specifier.shape_type_keyword' => keyset[
      'token:shape',
    ],
    'shape_type_specifier.shape_type_left_paren' => keyset[
      'token:(',
    ],
    'shape_type_specifier.shape_type_fields' => keyset[
      'list',
      'missing',
    ],
    'shape_type_specifier.shape_type_ellipsis' => keyset[
      'missing',
      'token:...',
    ],
    'shape_type_specifier.shape_type_right_paren' => keyset[
      'token:)',
    ],
    'field_specifier.field_question' => keyset[
      'missing',
      'token:?',
    ],
    'field_specifier.field_name' => keyset[
      'literal',
      'scope_resolution_expression',
    ],
    'field_specifier.field_arrow' => keyset[
      'token:=>',
    ],
    'field_specifier.field_type' => keyset[
      'simple_type_specifier',
      'nullable_type_specifier',
      'shape_type_specifier',
      'type_constant',
      'generic_type_specifier',
    ],
    'nullable_type_specifier.nullable_question' => keyset[
      'token:?',
    ],
    'nullable_type_specifier.nullable_type' => keyset[
      'simple_type_specifier',
      'generic_type_specifier',
      'tuple_type_specifier',
      'map_array_type_specifier',
      'closure_type_specifier',
      'shape_type_specifier',
      'type_constant',
      'dictionary_type_specifier',
      'vector_array_type_specifier',
      'vector_type_specifier',
      'keyset_type_specifier',
    ],
    'shape_expression.shape_expression_keyword' => keyset[
      'token:shape',
    ],
    'shape_expression.shape_expression_left_paren' => keyset[
      'token:(',
    ],
    'shape_expression.shape_expression_fields' => keyset[
      'list',
      'missing',
    ],
    'shape_expression.shape_expression_right_paren' => keyset[
      'token:)',
    ],
    'field_initializer.field_initializer_name' => keyset[
      'literal',
      'token:?',
      'variable',
      'scope_resolution_expression',
    ],
    'field_initializer.field_initializer_arrow' => keyset[
      'token:=>',
    ],
    'field_initializer.field_initializer_value' => keyset[
      'literal',
      'binary_expression',
      'variable',
      'vector_intrinsic_expression',
      'subscript_expression',
      'array_intrinsic_expression',
      'token:name',
      'object_creation_expression',
    ],
    'type_parameters.type_parameters_left_angle' => keyset[
      'token:<',
    ],
    'type_parameters.type_parameters_parameters' => keyset[
      'list',
    ],
    'type_parameters.type_parameters_right_angle' => keyset[
      'token:>',
    ],
    'type_parameter.type_variance' => keyset[
      'missing',
      'token:+',
      'token:-',
    ],
    'type_parameter.type_name' => keyset[
      'token:name',
    ],
    'type_parameter.type_constraints' => keyset[
      'list',
      'missing',
    ],
    'type_constraint.constraint_keyword' => keyset[
      'token:as',
      'token:super',
    ],
    'type_constraint.constraint_type' => keyset[
      'shape_type_specifier',
      'simple_type_specifier',
      'generic_type_specifier',
      'closure_type_specifier',
      'nullable_type_specifier',
      'type_constant',
      'classname_type_specifier',
      'dictionary_type_specifier',
      'vector_array_type_specifier',
      'keyset_type_specifier',
    ],
    'attribute_specification.attribute_specification_left_double_angle' =>
      keyset[
        'token:<<',
      ],
    'attribute_specification.attribute_specification_attributes' => keyset[
      'list',
    ],
    'attribute_specification.attribute_specification_right_double_angle' =>
      keyset[
        'token:>>',
      ],
    'attribute.attribute_name' => keyset[
      'token:name',
    ],
    'attribute.attribute_left_paren' => keyset[
      'token:(',
      'missing',
    ],
    'attribute.attribute_values' => keyset[
      'list',
      'missing',
    ],
    'attribute.attribute_right_paren' => keyset[
      'token:)',
      'missing',
    ],
    'const_declaration.const_abstract' => keyset[
      'missing',
      'token:abstract',
    ],
    'const_declaration.const_keyword' => keyset[
      'token:const',
    ],
    'const_declaration.const_type_specifier' => keyset[
      'simple_type_specifier',
      'missing',
      'generic_type_specifier',
      'type_constant',
      'vector_type_specifier',
      'nullable_type_specifier',
      'classname_type_specifier',
      'keyset_type_specifier',
    ],
    'const_declaration.const_declarators' => keyset[
      'list',
    ],
    'const_declaration.const_semicolon' => keyset[
      'token:;',
    ],
    'constant_declarator.constant_declarator_name' => keyset[
      'token:name',
    ],
    'constant_declarator.constant_declarator_initializer' => keyset[
      'simple_initializer',
      'missing',
    ],
    'lambda_expression.lambda_async' => keyset[
      'missing',
      'token:async',
    ],
    'lambda_expression.lambda_coroutine' => keyset[
      'missing',
      'token:coroutine',
    ],
    'lambda_expression.lambda_signature' => keyset[
      'token:variable',
      'lambda_signature',
    ],
    'lambda_expression.lambda_arrow' => keyset[
      'token:==>',
    ],
    'lambda_expression.lambda_body' => keyset[
      'compound_statement',
      'subscript_expression',
      'function_call_expression',
      'lambda_expression',
      'binary_expression',
      'variable',
      'literal',
      'member_selection_expression',
      'prefix_unary_expression',
      'array_intrinsic_expression',
      'conditional_expression',
      'cast_expression',
      'parenthesized_expression',
      'object_creation_expression',
    ],
    'vector_intrinsic_expression.vector_intrinsic_keyword' => keyset[
      'token:vec',
    ],
    'vector_intrinsic_expression.vector_intrinsic_left_bracket' => keyset[
      'token:[',
    ],
    'vector_intrinsic_expression.vector_intrinsic_members' => keyset[
      'list',
      'missing',
    ],
    'vector_intrinsic_expression.vector_intrinsic_right_bracket' => keyset[
      'token:]',
    ],
    'collection_literal_expression.collection_literal_name' => keyset[
      'simple_type_specifier',
      'generic_type_specifier',
    ],
    'collection_literal_expression.collection_literal_left_brace' => keyset[
      'token:{',
    ],
    'collection_literal_expression.collection_literal_initializers' => keyset[
      'list',
      'missing',
    ],
    'collection_literal_expression.collection_literal_right_brace' => keyset[
      'token:}',
      'missing',
    ],
    'dictionary_intrinsic_expression.dictionary_intrinsic_keyword' => keyset[
      'token:dict',
    ],
    'dictionary_intrinsic_expression.dictionary_intrinsic_left_bracket' =>
      keyset[
        'token:[',
      ],
    'dictionary_intrinsic_expression.dictionary_intrinsic_members' => keyset[
      'missing',
      'list',
    ],
    'dictionary_intrinsic_expression.dictionary_intrinsic_right_bracket' =>
      keyset[
        'token:]',
      ],
    'keyset_intrinsic_expression.keyset_intrinsic_keyword' => keyset[
      'token:keyset',
    ],
    'keyset_intrinsic_expression.keyset_intrinsic_left_bracket' => keyset[
      'token:[',
    ],
    'keyset_intrinsic_expression.keyset_intrinsic_members' => keyset[
      'missing',
      'list',
    ],
    'keyset_intrinsic_expression.keyset_intrinsic_right_bracket' => keyset[
      'token:]',
    ],
    'inclusion_directive.inclusion_expression' => keyset[
      'inclusion_expression',
    ],
    'inclusion_directive.inclusion_semicolon' => keyset[
      'token:;',
    ],
    'inclusion_expression.inclusion_require' => keyset[
      'token:include',
      'token:require',
      'token:include_once',
      'token:require_once',
    ],
    'inclusion_expression.inclusion_filename' => keyset[
      'binary_expression',
      'literal',
      'variable',
      'token:name',
      'parenthesized_expression',
      'subscript_expression',
    ],
    'else_clause.else_keyword' => keyset[
      'token:else',
    ],
    'else_clause.else_statement' => keyset[
      'compound_statement',
      'if_statement',
      'return_statement',
      'echo_statement',
      'expression_statement',
    ],
    'yield_expression.yield_keyword' => keyset[
      'token:yield',
    ],
    'yield_expression.yield_operand' => keyset[
      'literal',
      'member_selection_expression',
      'postfix_unary_expression',
      'variable',
      'function_call_expression',
      'element_initializer',
      'binary_expression',
      'prefix_unary_expression',
      'token:break',
      'parenthesized_expression',
      'token:name',
      'tuple_expression',
      'lambda_expression',
      'subscript_expression',
      'missing',
      'object_creation_expression',
      'anonymous_function',
    ],
    'function_static_statement.static_static_keyword' => keyset[
      'token:static',
    ],
    'function_static_statement.static_declarations' => keyset[
      'list',
    ],
    'function_static_statement.static_semicolon' => keyset[
      'token:;',
    ],
    'static_declarator.static_name' => keyset[
      'token:variable',
    ],
    'static_declarator.static_initializer' => keyset[
      'simple_initializer',
      'missing',
    ],
    'lambda_signature.lambda_left_paren' => keyset[
      'token:(',
    ],
    'lambda_signature.lambda_parameters' => keyset[
      'missing',
      'list',
    ],
    'lambda_signature.lambda_right_paren' => keyset[
      'token:)',
    ],
    'lambda_signature.lambda_colon' => keyset[
      'missing',
      'token::',
    ],
    'lambda_signature.lambda_type' => keyset[
      'missing',
      'simple_type_specifier',
      'generic_type_specifier',
      'closure_type_specifier',
    ],
    'generic_type_specifier.generic_class_type' => keyset[
      'token:name',
      'token:string',
      'qualified_name',
      'token:XHP_class_name',
    ],
    'generic_type_specifier.generic_argument_list' => keyset[
      'type_arguments',
    ],
    'type_arguments.type_arguments_left_angle' => keyset[
      'token:<',
    ],
    'type_arguments.type_arguments_types' => keyset[
      'list',
    ],
    'type_arguments.type_arguments_right_angle' => keyset[
      'token:>',
      'missing',
    ],
    'closure_type_specifier.closure_outer_left_paren' => keyset[
      'token:(',
    ],
    'closure_type_specifier.closure_coroutine' => keyset[
      'missing',
      'token:coroutine',
    ],
    'closure_type_specifier.closure_function_keyword' => keyset[
      'token:function',
    ],
    'closure_type_specifier.closure_inner_left_paren' => keyset[
      'token:(',
    ],
    'closure_type_specifier.closure_parameter_list' => keyset[
      'list',
      'missing',
    ],
    'closure_type_specifier.closure_inner_right_paren' => keyset[
      'token:)',
    ],
    'closure_type_specifier.closure_colon' => keyset[
      'token::',
    ],
    'closure_type_specifier.closure_return_type' => keyset[
      'simple_type_specifier',
      'generic_type_specifier',
      'nullable_type_specifier',
      'closure_type_specifier',
    ],
    'closure_type_specifier.closure_outer_right_paren' => keyset[
      'token:)',
    ],
    'closure_parameter_type_specifier.closure_parameter_call_convention' =>
      keyset[
        'missing',
        'token:inout',
      ],
    'closure_parameter_type_specifier.closure_parameter_type' => keyset[
      'simple_type_specifier',
      'nullable_type_specifier',
      'generic_type_specifier',
      'soft_type_specifier',
      'tuple_type_specifier',
      'type_constant',
    ],
    'instanceof_expression.instanceof_left_operand' => keyset[
      'variable',
      'parenthesized_expression',
      'function_call_expression',
      'object_creation_expression',
      'member_selection_expression',
      'subscript_expression',
      'literal',
      'anonymous_function',
      'scope_resolution_expression',
    ],
    'instanceof_expression.instanceof_operator' => keyset[
      'token:instanceof',
    ],
    'instanceof_expression.instanceof_right_operand' => keyset[
      'token:name',
      'variable',
      'qualified_name',
      'scope_resolution_expression',
      'subscript_expression',
      'member_selection_expression',
      'parenthesized_expression',
    ],
    'where_clause.where_clause_keyword' => keyset[
      'token:where',
    ],
    'where_clause.where_clause_constraints' => keyset[
      'list',
    ],
    'where_constraint.where_constraint_left_type' => keyset[
      'simple_type_specifier',
      'generic_type_specifier',
      'type_constant',
    ],
    'where_constraint.where_constraint_operator' => keyset[
      'token:=',
      'token:super',
      'token:as',
    ],
    'where_constraint.where_constraint_right_type' => keyset[
      'simple_type_specifier',
      'nullable_type_specifier',
      'generic_type_specifier',
      'type_constant',
    ],
    'switch_statement.switch_keyword' => keyset[
      'token:switch',
    ],
    'switch_statement.switch_left_paren' => keyset[
      'token:(',
    ],
    'switch_statement.switch_expression' => keyset[
      'variable',
      'binary_expression',
      'subscript_expression',
      'function_call_expression',
      'object_creation_expression',
      'prefix_unary_expression',
      'literal',
      'member_selection_expression',
    ],
    'switch_statement.switch_right_paren' => keyset[
      'token:)',
    ],
    'switch_statement.switch_left_brace' => keyset[
      'token:{',
      'missing',
    ],
    'switch_statement.switch_sections' => keyset[
      'list',
      'missing',
    ],
    'switch_statement.switch_right_brace' => keyset[
      'token:}',
      'missing',
    ],
    'switch_section.switch_section_labels' => keyset[
      'list',
      'missing',
    ],
    'switch_section.switch_section_statements' => keyset[
      'list',
      'missing',
    ],
    'switch_section.switch_section_fallthrough' => keyset[
      'missing',
    ],
    'case_label.case_keyword' => keyset[
      'token:case',
    ],
    'case_label.case_expression' => keyset[
      'literal',
      'prefix_unary_expression',
      'variable',
      'scope_resolution_expression',
      'function_call_expression',
      'instanceof_expression',
      'array_intrinsic_expression',
      'token:name',
    ],
    'case_label.case_colon' => keyset[
      'token::',
      'token:;',
    ],
    'break_statement.break_keyword' => keyset[
      'token:break',
    ],
    'break_statement.break_level' => keyset[
      'missing',
      'literal',
      'variable',
    ],
    'break_statement.break_semicolon' => keyset[
      'token:;',
    ],
    'default_label.default_keyword' => keyset[
      'token:default',
    ],
    'default_label.default_colon' => keyset[
      'token::',
      'token:;',
    ],
    'array_creation_expression.array_creation_left_bracket' => keyset[
      'token:[',
    ],
    'array_creation_expression.array_creation_members' => keyset[
      'list',
      'missing',
    ],
    'array_creation_expression.array_creation_right_bracket' => keyset[
      'token:]',
    ],
    'unset_statement.unset_keyword' => keyset[
      'token:unset',
    ],
    'unset_statement.unset_left_paren' => keyset[
      'token:(',
    ],
    'unset_statement.unset_variables' => keyset[
      'list',
    ],
    'unset_statement.unset_right_paren' => keyset[
      'token:)',
    ],
    'unset_statement.unset_semicolon' => keyset[
      'token:;',
    ],
    'anonymous_function_use_clause.anonymous_use_keyword' => keyset[
      'token:use',
    ],
    'anonymous_function_use_clause.anonymous_use_left_paren' => keyset[
      'token:(',
    ],
    'anonymous_function_use_clause.anonymous_use_variables' => keyset[
      'list',
    ],
    'anonymous_function_use_clause.anonymous_use_right_paren' => keyset[
      'token:)',
    ],
    'list_expression.list_keyword' => keyset[
      'token:list',
    ],
    'list_expression.list_left_paren' => keyset[
      'token:(',
    ],
    'list_expression.list_members' => keyset[
      'list',
      'missing',
    ],
    'list_expression.list_right_paren' => keyset[
      'token:)',
    ],
    'soft_type_specifier.soft_at' => keyset[
      'token:@',
    ],
    'soft_type_specifier.soft_type' => keyset[
      'simple_type_specifier',
      'generic_type_specifier',
      'nullable_type_specifier',
      'tuple_type_specifier',
      'closure_type_specifier',
      'map_array_type_specifier',
    ],
    'tuple_type_specifier.tuple_left_paren' => keyset[
      'token:(',
    ],
    'tuple_type_specifier.tuple_types' => keyset[
      'list',
    ],
    'tuple_type_specifier.tuple_right_paren' => keyset[
      'token:)',
    ],
    'continue_statement.continue_keyword' => keyset[
      'token:continue',
    ],
    'continue_statement.continue_level' => keyset[
      'missing',
      'literal',
      'variable',
    ],
    'continue_statement.continue_semicolon' => keyset[
      'token:;',
    ],
    'while_statement.while_keyword' => keyset[
      'token:while',
    ],
    'while_statement.while_left_paren' => keyset[
      'token:(',
    ],
    'while_statement.while_condition' => keyset[
      'literal',
      'binary_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'isset_expression',
      'function_call_expression',
      'variable',
      'postfix_unary_expression',
      'instanceof_expression',
    ],
    'while_statement.while_right_paren' => keyset[
      'token:)',
    ],
    'while_statement.while_body' => keyset[
      'compound_statement',
      'echo_statement',
      'expression_statement',
      'continue_statement',
    ],
    'finally_clause.finally_keyword' => keyset[
      'token:finally',
    ],
    'finally_clause.finally_body' => keyset[
      'compound_statement',
    ],
    'define_expression.define_keyword' => keyset[
      'token:define',
    ],
    'define_expression.define_left_paren' => keyset[
      'token:(',
    ],
    'define_expression.define_argument_list' => keyset[
      'list',
      'missing',
    ],
    'define_expression.define_right_paren' => keyset[
      'token:)',
    ],
    'trait_use_conflict_resolution.trait_use_conflict_resolution_keyword' =>
      keyset[
        'token:use',
      ],
    'trait_use_conflict_resolution.trait_use_conflict_resolution_names' =>
      keyset[
        'list',
      ],
    'trait_use_conflict_resolution.trait_use_conflict_resolution_left_brace' =>
      keyset[
        'token:{',
      ],
    'trait_use_conflict_resolution.trait_use_conflict_resolution_clauses' =>
      keyset[
        'list',
        'missing',
      ],
    'trait_use_conflict_resolution.trait_use_conflict_resolution_right_brace' =>
      keyset[
        'token:}',
      ],
    'trait_use_alias_item.trait_use_alias_item_aliasing_name' => keyset[
      'simple_type_specifier',
      'scope_resolution_expression',
    ],
    'trait_use_alias_item.trait_use_alias_item_keyword' => keyset[
      'token:as',
    ],
    'trait_use_alias_item.trait_use_alias_item_modifiers' => keyset[
      'list',
      'missing',
    ],
    'trait_use_alias_item.trait_use_alias_item_aliased_name' => keyset[
      'missing',
      'simple_type_specifier',
    ],
    'empty_expression.empty_keyword' => keyset[
      'token:empty',
    ],
    'empty_expression.empty_left_paren' => keyset[
      'token:(',
    ],
    'empty_expression.empty_argument' => keyset[
      'member_selection_expression',
      'variable',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'binary_expression',
      'collection_literal_expression',
      'xhp_expression',
      'function_call_expression',
      'parenthesized_expression',
      'array_intrinsic_expression',
      'object_creation_expression',
      'safe_member_selection_expression',
      'array_creation_expression',
      'literal',
    ],
    'empty_expression.empty_right_paren' => keyset[
      'token:)',
    ],
    'error.error_error' => keyset[
      'token:}',
      'token:variable',
      'token:=',
      'token:decimal_literal',
      'token:;',
      'token:namespace',
      'token:\\',
      'token:name',
      'token:{',
    ],
    'eval_expression.eval_keyword' => keyset[
      'token:eval',
    ],
    'eval_expression.eval_left_paren' => keyset[
      'token:(',
    ],
    'eval_expression.eval_argument' => keyset[
      'literal',
      'function_call_expression',
      'variable',
      'binary_expression',
    ],
    'eval_expression.eval_right_paren' => keyset[
      'token:)',
    ],
    'qualified_name.qualified_name_parts' => keyset[
      'list',
    ],
    'do_statement.do_keyword' => keyset[
      'token:do',
    ],
    'do_statement.do_body' => keyset[
      'compound_statement',
      'expression_statement',
    ],
    'do_statement.do_while_keyword' => keyset[
      'token:while',
    ],
    'do_statement.do_left_paren' => keyset[
      'token:(',
    ],
    'do_statement.do_condition' => keyset[
      'literal',
      'binary_expression',
      'variable',
      'function_call_expression',
      'subscript_expression',
      'prefix_unary_expression',
    ],
    'do_statement.do_right_paren' => keyset[
      'token:)',
    ],
    'do_statement.do_semicolon' => keyset[
      'token:;',
    ],
    'namespace_declaration.namespace_keyword' => keyset[
      'token:namespace',
    ],
    'namespace_declaration.namespace_name' => keyset[
      'token:name',
      'qualified_name',
      'missing',
    ],
    'namespace_declaration.namespace_body' => keyset[
      'namespace_body',
      'namespace_empty_body',
    ],
    'namespace_body.namespace_left_brace' => keyset[
      'token:{',
    ],
    'namespace_body.namespace_declarations' => keyset[
      'list',
      'missing',
    ],
    'namespace_body.namespace_right_brace' => keyset[
      'token:}',
      'missing',
    ],
    'namespace_use_declaration.namespace_use_keyword' => keyset[
      'token:use',
    ],
    'namespace_use_declaration.namespace_use_kind' => keyset[
      'missing',
      'token:namespace',
      'token:type',
      'token:function',
      'token:const',
    ],
    'namespace_use_declaration.namespace_use_clauses' => keyset[
      'list',
    ],
    'namespace_use_declaration.namespace_use_semicolon' => keyset[
      'token:;',
    ],
    'namespace_use_clause.namespace_use_clause_kind' => keyset[
      'missing',
      'token:const',
      'token:function',
    ],
    'namespace_use_clause.namespace_use_name' => keyset[
      'qualified_name',
      'token:name',
    ],
    'namespace_use_clause.namespace_use_as' => keyset[
      'missing',
      'token:as',
    ],
    'namespace_use_clause.namespace_use_alias' => keyset[
      'missing',
      'token:name',
    ],
    'namespace_empty_body.namespace_semicolon' => keyset[
      'token:;',
    ],
    'enum_declaration.enum_attribute_spec' => keyset[
      'missing',
    ],
    'enum_declaration.enum_keyword' => keyset[
      'token:enum',
    ],
    'enum_declaration.enum_name' => keyset[
      'token:name',
    ],
    'enum_declaration.enum_colon' => keyset[
      'token::',
    ],
    'enum_declaration.enum_base' => keyset[
      'simple_type_specifier',
      'classname_type_specifier',
      'generic_type_specifier',
    ],
    'enum_declaration.enum_type' => keyset[
      'type_constraint',
      'missing',
    ],
    'enum_declaration.enum_left_brace' => keyset[
      'token:{',
    ],
    'enum_declaration.enum_enumerators' => keyset[
      'list',
      'missing',
    ],
    'enum_declaration.enum_right_brace' => keyset[
      'token:}',
    ],
    'enumerator.enumerator_name' => keyset[
      'token:name',
    ],
    'enumerator.enumerator_equal' => keyset[
      'token:=',
    ],
    'enumerator.enumerator_value' => keyset[
      'literal',
      'scope_resolution_expression',
      'binary_expression',
    ],
    'enumerator.enumerator_semicolon' => keyset[
      'token:;',
    ],
    'require_clause.require_keyword' => keyset[
      'token:require',
    ],
    'require_clause.require_kind' => keyset[
      'token:extends',
      'token:implements',
    ],
    'require_clause.require_name' => keyset[
      'simple_type_specifier',
      'generic_type_specifier',
    ],
    'require_clause.require_semicolon' => keyset[
      'token:;',
    ],
    'vector_type_specifier.vector_type_keyword' => keyset[
      'token:vec',
    ],
    'vector_type_specifier.vector_type_left_angle' => keyset[
      'token:<',
    ],
    'vector_type_specifier.vector_type_type' => keyset[
      'vector_type_specifier',
      'simple_type_specifier',
      'classname_type_specifier',
    ],
    'vector_type_specifier.vector_type_trailing_comma' => keyset[
      'missing',
    ],
    'vector_type_specifier.vector_type_right_angle' => keyset[
      'token:>',
    ],
    'type_const_declaration.type_const_abstract' => keyset[
      'missing',
      'token:abstract',
    ],
    'type_const_declaration.type_const_keyword' => keyset[
      'token:const',
    ],
    'type_const_declaration.type_const_type_keyword' => keyset[
      'token:type',
    ],
    'type_const_declaration.type_const_name' => keyset[
      'token:name',
    ],
    'type_const_declaration.type_const_type_parameters' => keyset[
      'missing',
      'type_parameters',
    ],
    'type_const_declaration.type_const_type_constraint' => keyset[
      'missing',
      'type_constraint',
    ],
    'type_const_declaration.type_const_equal' => keyset[
      'token:=',
      'missing',
    ],
    'type_const_declaration.type_const_type_specifier' => keyset[
      'vector_type_specifier',
      'dictionary_type_specifier',
      'keyset_type_specifier',
      'nullable_type_specifier',
      'generic_type_specifier',
      'tuple_type_specifier',
      'closure_type_specifier',
      'simple_type_specifier',
      'type_constant',
      'missing',
      'shape_type_specifier',
    ],
    'type_const_declaration.type_const_semicolon' => keyset[
      'token:;',
    ],
    'type_constant.type_constant_left_type' => keyset[
      'token:name',
      'type_constant',
      'token:self',
      'token:this',
      'token:parent',
    ],
    'type_constant.type_constant_separator' => keyset[
      'token:::',
    ],
    'type_constant.type_constant_right_type' => keyset[
      'token:name',
    ],
    'classname_type_specifier.classname_keyword' => keyset[
      'token:classname',
    ],
    'classname_type_specifier.classname_left_angle' => keyset[
      'missing',
      'token:<',
    ],
    'classname_type_specifier.classname_type' => keyset[
      'missing',
      'simple_type_specifier',
      'type_constant',
    ],
    'classname_type_specifier.classname_trailing_comma' => keyset[
      'missing',
    ],
    'classname_type_specifier.classname_right_angle' => keyset[
      'missing',
      'token:>',
    ],
    'map_array_type_specifier.map_array_keyword' => keyset[
      'token:array',
    ],
    'map_array_type_specifier.map_array_left_angle' => keyset[
      'token:<',
    ],
    'map_array_type_specifier.map_array_key' => keyset[
      'simple_type_specifier',
    ],
    'map_array_type_specifier.map_array_comma' => keyset[
      'token:,',
    ],
    'map_array_type_specifier.map_array_value' => keyset[
      'simple_type_specifier',
      'shape_type_specifier',
      'soft_type_specifier',
      'nullable_type_specifier',
      'generic_type_specifier',
      'missing',
    ],
    'map_array_type_specifier.map_array_right_angle' => keyset[
      'token:>',
    ],
    'variadic_parameter.variadic_parameter_call_convention' => keyset[
      'missing',
    ],
    'variadic_parameter.variadic_parameter_type' => keyset[
      'missing',
      'simple_type_specifier',
    ],
    'variadic_parameter.variadic_parameter_ellipsis' => keyset[
      'token:...',
    ],
    'dictionary_type_specifier.dictionary_type_keyword' => keyset[
      'token:dict',
    ],
    'dictionary_type_specifier.dictionary_type_left_angle' => keyset[
      'token:<',
    ],
    'dictionary_type_specifier.dictionary_type_members' => keyset[
      'list',
    ],
    'dictionary_type_specifier.dictionary_type_right_angle' => keyset[
      'token:>',
    ],
    'keyset_type_specifier.keyset_type_keyword' => keyset[
      'token:keyset',
    ],
    'keyset_type_specifier.keyset_type_left_angle' => keyset[
      'token:<',
    ],
    'keyset_type_specifier.keyset_type_type' => keyset[
      'simple_type_specifier',
    ],
    'keyset_type_specifier.keyset_type_trailing_comma' => keyset[
      'missing',
    ],
    'keyset_type_specifier.keyset_type_right_angle' => keyset[
      'token:>',
    ],
    'function_call_with_type_arguments_expression.function_call_with_type_arguments_receiver' =>
      keyset[
        'token:name',
        'member_selection_expression',
        'scope_resolution_expression',
      ],
    'function_call_with_type_arguments_expression.function_call_with_type_arguments_type_args' =>
      keyset[
        'type_arguments',
      ],
    'function_call_with_type_arguments_expression.function_call_with_type_arguments_left_paren' =>
      keyset[
        'token:(',
      ],
    'function_call_with_type_arguments_expression.function_call_with_type_arguments_argument_list' =>
      keyset[
        'missing',
        'list',
      ],
    'function_call_with_type_arguments_expression.function_call_with_type_arguments_right_paren' =>
      keyset[
        'token:)',
      ],
    'vector_array_type_specifier.vector_array_keyword' => keyset[
      'token:array',
    ],
    'vector_array_type_specifier.vector_array_left_angle' => keyset[
      'token:<',
    ],
    'vector_array_type_specifier.vector_array_type' => keyset[
      'simple_type_specifier',
      'varray_type_specifier',
      'darray_type_specifier',
      'generic_type_specifier',
      'shape_type_specifier',
      'tuple_type_specifier',
      'nullable_type_specifier',
      'vector_array_type_specifier',
    ],
    'vector_array_type_specifier.vector_array_right_angle' => keyset[
      'token:>',
    ],
    'php7_anonymous_function.php7_anonymous_static_keyword' => keyset[
      'missing',
    ],
    'php7_anonymous_function.php7_anonymous_async_keyword' => keyset[
      'missing',
    ],
    'php7_anonymous_function.php7_anonymous_coroutine_keyword' => keyset[
      'missing',
    ],
    'php7_anonymous_function.php7_anonymous_function_keyword' => keyset[
      'token:function',
    ],
    'php7_anonymous_function.php7_anonymous_left_paren' => keyset[
      'token:(',
    ],
    'php7_anonymous_function.php7_anonymous_parameters' => keyset[
      'missing',
    ],
    'php7_anonymous_function.php7_anonymous_right_paren' => keyset[
      'token:)',
    ],
    'php7_anonymous_function.php7_anonymous_use' => keyset[
      'anonymous_function_use_clause',
    ],
    'php7_anonymous_function.php7_anonymous_colon' => keyset[
      'token::',
    ],
    'php7_anonymous_function.php7_anonymous_type' => keyset[
      'simple_type_specifier',
    ],
    'php7_anonymous_function.php7_anonymous_body' => keyset[
      'compound_statement',
    ],
    'varray_intrinsic_expression.varray_intrinsic_keyword' => keyset[
      'token:varray',
    ],
    'varray_intrinsic_expression.varray_intrinsic_left_bracket' => keyset[
      'token:[',
    ],
    'varray_intrinsic_expression.varray_intrinsic_members' => keyset[
      'list',
      'missing',
    ],
    'varray_intrinsic_expression.varray_intrinsic_right_bracket' => keyset[
      'token:]',
    ],
    'tuple_expression.tuple_expression_keyword' => keyset[
      'token:tuple',
    ],
    'tuple_expression.tuple_expression_left_paren' => keyset[
      'token:(',
    ],
    'tuple_expression.tuple_expression_items' => keyset[
      'missing',
      'list',
    ],
    'tuple_expression.tuple_expression_right_paren' => keyset[
      'token:)',
    ],
    'varray_type_specifier.varray_keyword' => keyset[
      'token:varray',
    ],
    'varray_type_specifier.varray_left_angle' => keyset[
      'token:<',
    ],
    'varray_type_specifier.varray_type' => keyset[
      'simple_type_specifier',
      'varray_type_specifier',
      'darray_type_specifier',
      'vector_array_type_specifier',
    ],
    'varray_type_specifier.varray_trailing_comma' => keyset[
      'missing',
    ],
    'varray_type_specifier.varray_right_angle' => keyset[
      'token:>',
    ],
    'darray_type_specifier.darray_keyword' => keyset[
      'token:darray',
    ],
    'darray_type_specifier.darray_left_angle' => keyset[
      'token:<',
    ],
    'darray_type_specifier.darray_key' => keyset[
      'simple_type_specifier',
    ],
    'darray_type_specifier.darray_comma' => keyset[
      'token:,',
    ],
    'darray_type_specifier.darray_value' => keyset[
      'simple_type_specifier',
      'varray_type_specifier',
      'darray_type_specifier',
      'vector_array_type_specifier',
    ],
    'darray_type_specifier.darray_trailing_comma' => keyset[
      'missing',
    ],
    'darray_type_specifier.darray_right_angle' => keyset[
      'token:>',
    ],
    'darray_intrinsic_expression.darray_intrinsic_keyword' => keyset[
      'token:darray',
    ],
    'darray_intrinsic_expression.darray_intrinsic_left_bracket' => keyset[
      'token:[',
    ],
    'darray_intrinsic_expression.darray_intrinsic_members' => keyset[
      'missing',
      'list',
    ],
    'darray_intrinsic_expression.darray_intrinsic_right_bracket' => keyset[
      'token:]',
    ],
    'goto_statement.goto_statement_keyword' => keyset[
      'token:goto',
    ],
    'goto_statement.goto_statement_label_name' => keyset[
      'token:name',
    ],
    'goto_statement.goto_statement_semicolon' => keyset[
      'token:;',
    ],
    'goto_label.goto_label_name' => keyset[
      'token:name',
    ],
    'goto_label.goto_label_colon' => keyset[
      'token::',
    ],
    'trait_use_precedence_item.trait_use_precedence_item_name' => keyset[
      'scope_resolution_expression',
    ],
    'trait_use_precedence_item.trait_use_precedence_item_keyword' => keyset[
      'token:insteadof',
    ],
    'trait_use_precedence_item.trait_use_precedence_item_removed_names' =>
      keyset[
        'list',
      ],
    'awaitable_creation_expression.awaitable_async' => keyset[
      'token:async',
    ],
    'awaitable_creation_expression.awaitable_coroutine' => keyset[
      'missing',
    ],
    'awaitable_creation_expression.awaitable_compound_statement' => keyset[
      'compound_statement',
    ],
    'elseif_clause.elseif_keyword' => keyset[
      'token:elseif',
    ],
    'elseif_clause.elseif_left_paren' => keyset[
      'token:(',
    ],
    'elseif_clause.elseif_condition' => keyset[
      'literal',
      'binary_expression',
      'function_call_expression',
      'variable',
    ],
    'elseif_clause.elseif_right_paren' => keyset[
      'token:)',
    ],
    'elseif_clause.elseif_statement' => keyset[
      'compound_statement',
      'expression_statement',
    ],
    'using_statement_function_scoped.using_function_await_keyword' => keyset[
      'missing',
      'token:await',
    ],
    'using_statement_function_scoped.using_function_using_keyword' => keyset[
      'token:using',
    ],
    'using_statement_function_scoped.using_function_expression' => keyset[
      'object_creation_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'variable',
      'lambda_expression',
      'binary_expression',
    ],
    'using_statement_function_scoped.using_function_semicolon' => keyset[
      'token:;',
    ],
    'using_statement_block_scoped.using_block_await_keyword' => keyset[
      'missing',
      'token:await',
    ],
    'using_statement_block_scoped.using_block_using_keyword' => keyset[
      'token:using',
    ],
    'using_statement_block_scoped.using_block_left_paren' => keyset[
      'token:(',
    ],
    'using_statement_block_scoped.using_block_expressions' => keyset[
      'list',
    ],
    'using_statement_block_scoped.using_block_right_paren' => keyset[
      'token:)',
    ],
    'using_statement_block_scoped.using_block_body' => keyset[
      'compound_statement',
    ],
    'xhp_required.xhp_required_at' => keyset[
      'token:@',
    ],
    'xhp_required.xhp_required_keyword' => keyset[
      'token:required',
    ],
    'namespace_group_use_declaration.namespace_group_use_keyword' => keyset[
      'token:use',
    ],
    'namespace_group_use_declaration.namespace_group_use_kind' => keyset[
      'token:type',
      'token:namespace',
      'missing',
      'token:const',
      'token:function',
    ],
    'namespace_group_use_declaration.namespace_group_use_prefix' => keyset[
      'qualified_name',
    ],
    'namespace_group_use_declaration.namespace_group_use_left_brace' => keyset[
      'token:{',
    ],
    'namespace_group_use_declaration.namespace_group_use_clauses' => keyset[
      'list',
    ],
    'namespace_group_use_declaration.namespace_group_use_right_brace' => keyset[
      'token:}',
      'missing',
    ],
    'namespace_group_use_declaration.namespace_group_use_semicolon' => keyset[
      'token:;',
      'missing',
    ],
    'xhp_enum_type.xhp_enum_optional' => keyset[
      'missing',
    ],
    'xhp_enum_type.xhp_enum_keyword' => keyset[
      'token:enum',
    ],
    'xhp_enum_type.xhp_enum_left_brace' => keyset[
      'token:{',
    ],
    'xhp_enum_type.xhp_enum_values' => keyset[
      'list',
    ],
    'xhp_enum_type.xhp_enum_right_brace' => keyset[
      'token:}',
    ],
    'safe_member_selection_expression.safe_member_object' => keyset[
      'scope_resolution_expression',
      'variable',
      'member_selection_expression',
      'function_call_expression',
      'safe_member_selection_expression',
      'prefix_unary_expression',
    ],
    'safe_member_selection_expression.safe_member_operator' => keyset[
      'token:?->',
    ],
    'safe_member_selection_expression.safe_member_name' => keyset[
      'token:name',
      'token:XHP_class_name',
      'prefix_unary_expression',
    ],
    'yield_from_expression.yield_from_yield_keyword' => keyset[
      'token:yield',
    ],
    'yield_from_expression.yield_from_from_keyword' => keyset[
      'token:from',
    ],
    'yield_from_expression.yield_from_operand' => keyset[
      'function_call_expression',
      'array_creation_expression',
      'variable',
      'literal',
      'parenthesized_expression',
    ],
    'declare_directive_statement.declare_directive_keyword' => keyset[
      'token:declare',
    ],
    'declare_directive_statement.declare_directive_left_paren' => keyset[
      'token:(',
    ],
    'declare_directive_statement.declare_directive_expression' => keyset[
      'binary_expression',
    ],
    'declare_directive_statement.declare_directive_right_paren' => keyset[
      'token:)',
    ],
    'declare_directive_statement.declare_directive_semicolon' => keyset[
      'token:;',
    ],
    'declare_block_statement.declare_block_keyword' => keyset[
      'token:declare',
    ],
    'declare_block_statement.declare_block_left_paren' => keyset[
      'token:(',
    ],
    'declare_block_statement.declare_block_expression' => keyset[
      'binary_expression',
    ],
    'declare_block_statement.declare_block_right_paren' => keyset[
      'token:)',
    ],
    'declare_block_statement.declare_block_body' => keyset[
      'compound_statement',
    ],
    'xhp_category_declaration.xhp_category_keyword' => keyset[
      'token:category',
    ],
    'xhp_category_declaration.xhp_category_categories' => keyset[
      'list',
    ],
    'xhp_category_declaration.xhp_category_semicolon' => keyset[
      'token:;',
    ],
    'halt_compiler_expression.halt_compiler_keyword' => keyset[
      'token:__halt_compiler',
    ],
    'halt_compiler_expression.halt_compiler_left_paren' => keyset[
      'token:(',
    ],
    'halt_compiler_expression.halt_compiler_argument_list' => keyset[
      'missing',
    ],
    'halt_compiler_expression.halt_compiler_right_paren' => keyset[
      'token:)',
    ],
    'anonymous_class.anonymous_class_class_keyword' => keyset[
      'token:class',
    ],
    'anonymous_class.anonymous_class_left_paren' => keyset[
      'missing',
      'token:(',
    ],
    'anonymous_class.anonymous_class_argument_list' => keyset[
      'missing',
      'list',
    ],
    'anonymous_class.anonymous_class_right_paren' => keyset[
      'missing',
      'token:)',
    ],
    'anonymous_class.anonymous_class_extends_keyword' => keyset[
      'missing',
      'token:extends',
    ],
    'anonymous_class.anonymous_class_extends_list' => keyset[
      'missing',
      'list',
    ],
    'anonymous_class.anonymous_class_implements_keyword' => keyset[
      'missing',
      'token:implements',
    ],
    'anonymous_class.anonymous_class_implements_list' => keyset[
      'missing',
      'list',
    ],
    'anonymous_class.anonymous_class_body' => keyset[
      'classish_body',
    ],
    'xhp_spread_attribute.xhp_spread_attribute_left_brace' => keyset[
      'token:{',
    ],
    'xhp_spread_attribute.xhp_spread_attribute_spread_operator' => keyset[
      'token:...',
    ],
    'xhp_spread_attribute.xhp_spread_attribute_expression' => keyset[
      'xhp_expression',
      'variable',
    ],
    'xhp_spread_attribute.xhp_spread_attribute_right_brace' => keyset[
      'token:}',
    ],
    'xhp_simple_class_attribute.xhp_simple_class_attribute_type' => keyset[
      'simple_type_specifier',
    ],
    'is_expression.is_left_operand' => keyset[
      'variable',
    ],
    'is_expression.is_operator' => keyset[
      'token:is',
    ],
    'is_expression.is_right_operand' => keyset[
      'simple_type_specifier',
      'nullable_type_specifier',
      'shape_type_specifier',
      'tuple_type_specifier',
      'classname_type_specifier',
    ],
  ];
