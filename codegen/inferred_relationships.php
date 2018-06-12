<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0f94ecb2af3774af0e6be15d5e0ddcc2>>
 */
namespace Facebook\HHAST\__Private;

const dict<string, keyset<string>>
  INFERRED_RELATIONSHIPS = dict[
    'alias_declaration.alias_attribute_spec' => keyset[
      'attribute_specification',
      'missing',
    ],
    'alias_declaration.alias_constraint' => keyset[
      'missing',
      'type_constraint',
    ],
    'alias_declaration.alias_equal' => keyset[
      'token:=',
    ],
    'alias_declaration.alias_generic_parameter' => keyset[
      'missing',
      'type_parameters',
    ],
    'alias_declaration.alias_keyword' => keyset[
      'token:newtype',
      'token:type',
    ],
    'alias_declaration.alias_name' => keyset[
      'token:name',
    ],
    'alias_declaration.alias_semicolon' => keyset[
      'token:;',
    ],
    'alias_declaration.alias_type' => keyset[
      'closure_type_specifier',
      'dictionary_type_specifier',
      'generic_type_specifier',
      'keyset_type_specifier',
      'map_array_type_specifier',
      'nullable_type_specifier',
      'shape_type_specifier',
      'simple_type_specifier',
      'tuple_type_specifier',
      'vector_array_type_specifier',
      'vector_type_specifier',
    ],
    'alternate_else_clause.alternate_else_colon' => keyset[
      'token::',
    ],
    'alternate_else_clause.alternate_else_keyword' => keyset[
      'token:else',
    ],
    'alternate_else_clause.alternate_else_statement' => keyset[
      'list',
    ],
    'alternate_if_statement.alternate_if_colon' => keyset[
      'token::',
    ],
    'alternate_if_statement.alternate_if_condition' => keyset[
      'binary_expression',
      'literal',
      'variable',
    ],
    'alternate_if_statement.alternate_if_else_clause' => keyset[
      'alternate_else_clause',
      'missing',
    ],
    'alternate_if_statement.alternate_if_elseif_clauses' => keyset[
      'missing',
    ],
    'alternate_if_statement.alternate_if_endif_keyword' => keyset[
      'token:endif',
    ],
    'alternate_if_statement.alternate_if_keyword' => keyset[
      'token:if',
    ],
    'alternate_if_statement.alternate_if_left_paren' => keyset[
      'token:(',
    ],
    'alternate_if_statement.alternate_if_right_paren' => keyset[
      'token:)',
    ],
    'alternate_if_statement.alternate_if_semicolon' => keyset[
      'token:;',
    ],
    'alternate_if_statement.alternate_if_statement' => keyset[
      'list',
    ],
    'alternate_loop_statement.alternate_loop_closing_keyword' => keyset[
      'token:enddeclare',
      'token:endfor',
      'token:endforeach',
      'token:endwhile',
    ],
    'alternate_loop_statement.alternate_loop_closing_semicolon' => keyset[
      'token:;',
    ],
    'alternate_loop_statement.alternate_loop_opening_colon' => keyset[
      'token::',
    ],
    'alternate_loop_statement.alternate_loop_statements' => keyset[
      'list',
    ],
    'alternate_switch_statement.alternate_switch_closing_endswitch' => keyset[
      'token:endswitch',
    ],
    'alternate_switch_statement.alternate_switch_closing_semicolon' => keyset[
      'token:;',
    ],
    'alternate_switch_statement.alternate_switch_expression' => keyset[
      'literal',
      'variable',
    ],
    'alternate_switch_statement.alternate_switch_keyword' => keyset[
      'token:switch',
    ],
    'alternate_switch_statement.alternate_switch_left_paren' => keyset[
      'token:(',
    ],
    'alternate_switch_statement.alternate_switch_opening_colon' => keyset[
      'token::',
    ],
    'alternate_switch_statement.alternate_switch_right_paren' => keyset[
      'token:)',
    ],
    'alternate_switch_statement.alternate_switch_sections' => keyset[
      'list',
    ],
    'anonymous_class.anonymous_class_argument_list' => keyset[
      'list',
      'missing',
    ],
    'anonymous_class.anonymous_class_body' => keyset[
      'classish_body',
    ],
    'anonymous_class.anonymous_class_class_keyword' => keyset[
      'token:class',
    ],
    'anonymous_class.anonymous_class_extends_keyword' => keyset[
      'missing',
      'token:extends',
    ],
    'anonymous_class.anonymous_class_extends_list' => keyset[
      'list',
      'missing',
    ],
    'anonymous_class.anonymous_class_implements_keyword' => keyset[
      'missing',
      'token:implements',
    ],
    'anonymous_class.anonymous_class_implements_list' => keyset[
      'list',
      'missing',
    ],
    'anonymous_class.anonymous_class_left_paren' => keyset[
      'missing',
      'token:(',
    ],
    'anonymous_class.anonymous_class_right_paren' => keyset[
      'missing',
      'token:)',
    ],
    'anonymous_function.anonymous_ampersand' => keyset[
      'missing',
      'token:&',
    ],
    'anonymous_function.anonymous_async_keyword' => keyset[
      'missing',
      'token:async',
    ],
    'anonymous_function.anonymous_attribute_spec' => keyset[
      'attribute_specification',
      'missing',
    ],
    'anonymous_function.anonymous_body' => keyset[
      'compound_statement',
    ],
    'anonymous_function.anonymous_colon' => keyset[
      'missing',
      'token::',
    ],
    'anonymous_function.anonymous_coroutine_keyword' => keyset[
      'missing',
      'token:coroutine',
    ],
    'anonymous_function.anonymous_function_keyword' => keyset[
      'token:function',
    ],
    'anonymous_function.anonymous_left_paren' => keyset[
      'missing',
      'token:(',
    ],
    'anonymous_function.anonymous_parameters' => keyset[
      'list',
      'missing',
    ],
    'anonymous_function.anonymous_right_paren' => keyset[
      'missing',
      'token:)',
    ],
    'anonymous_function.anonymous_static_keyword' => keyset[
      'missing',
      'token:static',
    ],
    'anonymous_function.anonymous_type' => keyset[
      'closure_type_specifier',
      'generic_type_specifier',
      'map_array_type_specifier',
      'missing',
      'nullable_type_specifier',
      'simple_type_specifier',
      'soft_type_specifier',
      'tuple_type_specifier',
      'vector_array_type_specifier',
    ],
    'anonymous_function.anonymous_use' => keyset[
      'anonymous_function_use_clause',
      'missing',
    ],
    'anonymous_function_use_clause.anonymous_use_keyword' => keyset[
      'token:use',
    ],
    'anonymous_function_use_clause.anonymous_use_left_paren' => keyset[
      'token:(',
    ],
    'anonymous_function_use_clause.anonymous_use_right_paren' => keyset[
      'token:)',
    ],
    'anonymous_function_use_clause.anonymous_use_variables' => keyset[
      'list',
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
    'array_intrinsic_expression.array_intrinsic_keyword' => keyset[
      'token:array',
    ],
    'array_intrinsic_expression.array_intrinsic_left_paren' => keyset[
      'token:(',
    ],
    'array_intrinsic_expression.array_intrinsic_members' => keyset[
      'list',
      'missing',
    ],
    'array_intrinsic_expression.array_intrinsic_right_paren' => keyset[
      'token:)',
    ],
    'as_expression.as_left_operand' => keyset[
      'variable',
    ],
    'as_expression.as_operator' => keyset[
      'token:as',
    ],
    'as_expression.as_right_operand' => keyset[
      'nullable_type_specifier',
      'shape_type_specifier',
      'simple_type_specifier',
      'tuple_type_specifier',
    ],
    'attribute.attribute_left_paren' => keyset[
      'missing',
      'token:(',
    ],
    'attribute.attribute_name' => keyset[
      'token:name',
    ],
    'attribute.attribute_right_paren' => keyset[
      'missing',
      'token:)',
    ],
    'attribute.attribute_values' => keyset[
      'list',
      'missing',
    ],
    'attribute_specification.attribute_specification_attributes' => keyset[
      'list',
    ],
    'attribute_specification.attribute_specification_left_double_angle' =>
      keyset[
        'token:<<',
      ],
    'attribute_specification.attribute_specification_right_double_angle' =>
      keyset[
        'token:>>',
      ],
    'awaitable_creation_expression.awaitable_async' => keyset[
      'token:async',
    ],
    'awaitable_creation_expression.awaitable_attribute_spec' => keyset[
      'attribute_specification',
      'missing',
    ],
    'awaitable_creation_expression.awaitable_compound_statement' => keyset[
      'compound_statement',
    ],
    'awaitable_creation_expression.awaitable_coroutine' => keyset[
      'missing',
    ],
    'binary_expression.binary_left_operand' => keyset[
      'anonymous_function',
      'array_creation_expression',
      'array_intrinsic_expression',
      'binary_expression',
      'cast_expression',
      'collection_literal_expression',
      'darray_intrinsic_expression',
      'dictionary_intrinsic_expression',
      'empty_expression',
      'function_call_expression',
      'instanceof_expression',
      'isset_expression',
      'keyset_intrinsic_expression',
      'list_expression',
      'literal',
      'member_selection_expression',
      'object_creation_expression',
      'parenthesized_expression',
      'pipe_variable',
      'postfix_unary_expression',
      'prefix_unary_expression',
      'qualified_name',
      'scope_resolution_expression',
      'subscript_expression',
      'token:)',
      'token:name',
      'variable',
      'varray_intrinsic_expression',
      'vector_intrinsic_expression',
    ],
    'binary_expression.binary_operator' => keyset[
      'token:!=',
      'token:!==',
      'token:%',
      'token:%=',
      'token:&',
      'token:&&',
      'token:&=',
      'token:*',
      'token:**',
      'token:**=',
      'token:*=',
      'token:+',
      'token:+=',
      'token:-',
      'token:-=',
      'token:.',
      'token:.=',
      'token:/',
      'token:/=',
      'token:<',
      'token:<<',
      'token:<<=',
      'token:<=',
      'token:<=>',
      'token:<>',
      'token:=',
      'token:==',
      'token:===',
      'token:>',
      'token:>=',
      'token:>>',
      'token:>>=',
      'token:?:',
      'token:??',
      'token:^',
      'token:^=',
      'token:and',
      'token:or',
      'token:xor',
      'token:|',
      'token:|=',
      'token:|>',
      'token:||',
    ],
    'binary_expression.binary_right_operand' => keyset[
      'anonymous_function',
      'array_creation_expression',
      'array_intrinsic_expression',
      'awaitable_creation_expression',
      'binary_expression',
      'cast_expression',
      'collection_literal_expression',
      'conditional_expression',
      'darray_intrinsic_expression',
      'dictionary_intrinsic_expression',
      'empty_expression',
      'eval_expression',
      'function_call_expression',
      'function_call_with_type_arguments_expression',
      'inclusion_expression',
      'instanceof_expression',
      'isset_expression',
      'keyset_intrinsic_expression',
      'lambda_expression',
      'literal',
      'member_selection_expression',
      'missing',
      'nullable_as_expression',
      'object_creation_expression',
      'parenthesized_expression',
      'php7_anonymous_function',
      'pipe_variable',
      'postfix_unary_expression',
      'prefix_unary_expression',
      'qualified_name',
      'safe_member_selection_expression',
      'scope_resolution_expression',
      'shape_expression',
      'subscript_expression',
      'token:?',
      'token:end_of_file',
      'token:name',
      'tuple_expression',
      'variable',
      'varray_intrinsic_expression',
      'vector_intrinsic_expression',
      'xhp_expression',
      'yield_expression',
      'yield_from_expression',
    ],
    'braced_expression.braced_expression_expression' => keyset[
      'array_intrinsic_expression',
      'binary_expression',
      'collection_literal_expression',
      'function_call_expression',
      'literal',
      'object_creation_expression',
      'prefix_unary_expression',
      'subscript_expression',
      'token:name',
      'variable',
    ],
    'braced_expression.braced_expression_left_brace' => keyset[
      'token:{',
    ],
    'braced_expression.braced_expression_right_brace' => keyset[
      'token:}',
    ],
    'break_statement.break_keyword' => keyset[
      'token:break',
    ],
    'break_statement.break_level' => keyset[
      'literal',
      'missing',
      'variable',
    ],
    'break_statement.break_semicolon' => keyset[
      'token:;',
    ],
    'case_label.case_colon' => keyset[
      'token::',
      'token:;',
    ],
    'case_label.case_expression' => keyset[
      'array_intrinsic_expression',
      'function_call_expression',
      'instanceof_expression',
      'literal',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'token:name',
      'variable',
    ],
    'case_label.case_keyword' => keyset[
      'token:case',
    ],
    'cast_expression.cast_left_paren' => keyset[
      'token:(',
    ],
    'cast_expression.cast_operand' => keyset[
      'anonymous_function',
      'array_creation_expression',
      'array_intrinsic_expression',
      'cast_expression',
      'collection_literal_expression',
      'dictionary_intrinsic_expression',
      'function_call_expression',
      'keyset_intrinsic_expression',
      'literal',
      'member_selection_expression',
      'object_creation_expression',
      'parenthesized_expression',
      'postfix_unary_expression',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'variable',
      'vector_intrinsic_expression',
      'xhp_expression',
    ],
    'cast_expression.cast_right_paren' => keyset[
      'token:)',
    ],
    'cast_expression.cast_type' => keyset[
      'token:array',
      'token:binary',
      'token:bool',
      'token:boolean',
      'token:double',
      'token:float',
      'token:int',
      'token:integer',
      'token:object',
      'token:real',
      'token:string',
      'token:unset',
    ],
    'catch_clause.catch_body' => keyset[
      'compound_statement',
    ],
    'catch_clause.catch_keyword' => keyset[
      'token:catch',
    ],
    'catch_clause.catch_left_paren' => keyset[
      'token:(',
    ],
    'catch_clause.catch_right_paren' => keyset[
      'token:)',
    ],
    'catch_clause.catch_type' => keyset[
      'simple_type_specifier',
    ],
    'catch_clause.catch_variable' => keyset[
      'missing',
      'token:variable',
    ],
    'classish_body.classish_body_elements' => keyset[
      'list',
      'missing',
    ],
    'classish_body.classish_body_left_brace' => keyset[
      'token:{',
    ],
    'classish_body.classish_body_right_brace' => keyset[
      'missing',
      'token:}',
    ],
    'classish_declaration.classish_attribute' => keyset[
      'attribute_specification',
      'missing',
    ],
    'classish_declaration.classish_body' => keyset[
      'classish_body',
    ],
    'classish_declaration.classish_extends_keyword' => keyset[
      'missing',
      'token:extends',
    ],
    'classish_declaration.classish_extends_list' => keyset[
      'list',
      'missing',
    ],
    'classish_declaration.classish_implements_keyword' => keyset[
      'missing',
      'token:implements',
    ],
    'classish_declaration.classish_implements_list' => keyset[
      'list',
      'missing',
    ],
    'classish_declaration.classish_keyword' => keyset[
      'token:class',
      'token:interface',
      'token:trait',
    ],
    'classish_declaration.classish_modifiers' => keyset[
      'list',
      'missing',
    ],
    'classish_declaration.classish_name' => keyset[
      'token:XHP_class_name',
      'token:name',
    ],
    'classish_declaration.classish_type_parameters' => keyset[
      'missing',
      'type_parameters',
    ],
    'classname_type_specifier.classname_keyword' => keyset[
      'token:classname',
    ],
    'classname_type_specifier.classname_left_angle' => keyset[
      'missing',
      'token:<',
    ],
    'classname_type_specifier.classname_right_angle' => keyset[
      'missing',
      'token:>',
    ],
    'classname_type_specifier.classname_trailing_comma' => keyset[
      'missing',
    ],
    'classname_type_specifier.classname_type' => keyset[
      'missing',
      'simple_type_specifier',
      'type_constant',
    ],
    'closure_parameter_type_specifier.closure_parameter_call_convention' =>
      keyset[
        'missing',
        'token:inout',
      ],
    'closure_parameter_type_specifier.closure_parameter_type' => keyset[
      'generic_type_specifier',
      'nullable_type_specifier',
      'simple_type_specifier',
      'soft_type_specifier',
      'tuple_type_specifier',
      'type_constant',
    ],
    'closure_type_specifier.closure_colon' => keyset[
      'token::',
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
    'closure_type_specifier.closure_inner_right_paren' => keyset[
      'token:)',
    ],
    'closure_type_specifier.closure_outer_left_paren' => keyset[
      'token:(',
    ],
    'closure_type_specifier.closure_outer_right_paren' => keyset[
      'token:)',
    ],
    'closure_type_specifier.closure_parameter_list' => keyset[
      'list',
      'missing',
    ],
    'closure_type_specifier.closure_return_type' => keyset[
      'closure_type_specifier',
      'generic_type_specifier',
      'nullable_type_specifier',
      'simple_type_specifier',
    ],
    'collection_literal_expression.collection_literal_initializers' => keyset[
      'list',
      'missing',
    ],
    'collection_literal_expression.collection_literal_left_brace' => keyset[
      'token:{',
    ],
    'collection_literal_expression.collection_literal_name' => keyset[
      'generic_type_specifier',
      'simple_type_specifier',
    ],
    'collection_literal_expression.collection_literal_right_brace' => keyset[
      'missing',
      'token:}',
    ],
    'compound_statement.compound_left_brace' => keyset[
      'missing',
      'token:{',
    ],
    'compound_statement.compound_right_brace' => keyset[
      'missing',
      'token:}',
    ],
    'compound_statement.compound_statements' => keyset[
      'list',
      'missing',
    ],
    'conditional_expression.conditional_alternative' => keyset[
      'anonymous_function',
      'array_creation_expression',
      'array_intrinsic_expression',
      'binary_expression',
      'cast_expression',
      'collection_literal_expression',
      'function_call_expression',
      'isset_expression',
      'lambda_expression',
      'literal',
      'missing',
      'object_creation_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'tuple_expression',
      'variable',
    ],
    'conditional_expression.conditional_colon' => keyset[
      'missing',
      'token::',
    ],
    'conditional_expression.conditional_consequence' => keyset[
      'array_creation_expression',
      'array_intrinsic_expression',
      'binary_expression',
      'cast_expression',
      'collection_literal_expression',
      'function_call_expression',
      'lambda_expression',
      'literal',
      'member_selection_expression',
      'missing',
      'object_creation_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'variable',
    ],
    'conditional_expression.conditional_question' => keyset[
      'token:?',
    ],
    'conditional_expression.conditional_test' => keyset[
      'binary_expression',
      'conditional_expression',
      'empty_expression',
      'function_call_expression',
      'instanceof_expression',
      'isset_expression',
      'literal',
      'member_selection_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:<',
      'token:name',
      'variable',
    ],
    'const_declaration.const_abstract' => keyset[
      'missing',
      'token:abstract',
    ],
    'const_declaration.const_declarators' => keyset[
      'list',
    ],
    'const_declaration.const_keyword' => keyset[
      'token:const',
    ],
    'const_declaration.const_semicolon' => keyset[
      'token:;',
    ],
    'const_declaration.const_type_specifier' => keyset[
      'classname_type_specifier',
      'generic_type_specifier',
      'keyset_type_specifier',
      'missing',
      'nullable_type_specifier',
      'simple_type_specifier',
      'type_constant',
      'vector_type_specifier',
    ],
    'const_declaration.const_visibility' => keyset[
      'missing',
      'token:protected',
      'token:public',
    ],
    'constant_declarator.constant_declarator_initializer' => keyset[
      'missing',
      'simple_initializer',
    ],
    'constant_declarator.constant_declarator_name' => keyset[
      'token:name',
    ],
    'constructor_call.constructor_call_argument_list' => keyset[
      'list',
      'missing',
    ],
    'constructor_call.constructor_call_left_paren' => keyset[
      'missing',
      'token:(',
    ],
    'constructor_call.constructor_call_right_paren' => keyset[
      'missing',
      'token:)',
    ],
    'constructor_call.constructor_call_type' => keyset[
      'generic_type_specifier',
      'member_selection_expression',
      'parenthesized_expression',
      'qualified_name',
      'scope_resolution_expression',
      'simple_type_specifier',
      'subscript_expression',
      'token:name',
      'token:parent',
      'token:self',
      'token:static',
      'variable',
    ],
    'continue_statement.continue_keyword' => keyset[
      'token:continue',
    ],
    'continue_statement.continue_level' => keyset[
      'literal',
      'missing',
      'variable',
    ],
    'continue_statement.continue_semicolon' => keyset[
      'token:;',
    ],
    'darray_intrinsic_expression.darray_intrinsic_explicit_type' => keyset[
      'missing',
    ],
    'darray_intrinsic_expression.darray_intrinsic_keyword' => keyset[
      'token:darray',
    ],
    'darray_intrinsic_expression.darray_intrinsic_left_bracket' => keyset[
      'token:[',
    ],
    'darray_intrinsic_expression.darray_intrinsic_members' => keyset[
      'list',
      'missing',
    ],
    'darray_intrinsic_expression.darray_intrinsic_right_bracket' => keyset[
      'token:]',
    ],
    'darray_type_specifier.darray_comma' => keyset[
      'token:,',
    ],
    'darray_type_specifier.darray_key' => keyset[
      'simple_type_specifier',
    ],
    'darray_type_specifier.darray_keyword' => keyset[
      'token:darray',
    ],
    'darray_type_specifier.darray_left_angle' => keyset[
      'token:<',
    ],
    'darray_type_specifier.darray_right_angle' => keyset[
      'token:>',
    ],
    'darray_type_specifier.darray_trailing_comma' => keyset[
      'missing',
    ],
    'darray_type_specifier.darray_value' => keyset[
      'darray_type_specifier',
      'simple_type_specifier',
      'varray_type_specifier',
      'vector_array_type_specifier',
    ],
    'declare_block_statement.declare_block_body' => keyset[
      'alternate_loop_statement',
      'compound_statement',
    ],
    'declare_block_statement.declare_block_expression' => keyset[
      'binary_expression',
    ],
    'declare_block_statement.declare_block_keyword' => keyset[
      'token:declare',
    ],
    'declare_block_statement.declare_block_left_paren' => keyset[
      'token:(',
    ],
    'declare_block_statement.declare_block_right_paren' => keyset[
      'token:)',
    ],
    'declare_directive_statement.declare_directive_expression' => keyset[
      'binary_expression',
    ],
    'declare_directive_statement.declare_directive_keyword' => keyset[
      'token:declare',
    ],
    'declare_directive_statement.declare_directive_left_paren' => keyset[
      'token:(',
    ],
    'declare_directive_statement.declare_directive_right_paren' => keyset[
      'token:)',
    ],
    'declare_directive_statement.declare_directive_semicolon' => keyset[
      'token:;',
    ],
    'decorated_expression.decorated_expression_decorator' => keyset[
      'token:&',
      'token:...',
      'token:inout',
    ],
    'decorated_expression.decorated_expression_expression' => keyset[
      'array_creation_expression',
      'array_intrinsic_expression',
      'decorated_expression',
      'function_call_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:variable',
      'variable',
    ],
    'default_label.default_colon' => keyset[
      'token::',
      'token:;',
    ],
    'default_label.default_keyword' => keyset[
      'token:default',
    ],
    'define_expression.define_argument_list' => keyset[
      'list',
      'missing',
    ],
    'define_expression.define_keyword' => keyset[
      'token:define',
    ],
    'define_expression.define_left_paren' => keyset[
      'token:(',
    ],
    'define_expression.define_right_paren' => keyset[
      'token:)',
    ],
    'dictionary_intrinsic_expression.dictionary_intrinsic_explicit_type' =>
      keyset[
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
      'list',
      'missing',
    ],
    'dictionary_intrinsic_expression.dictionary_intrinsic_right_bracket' =>
      keyset[
        'token:]',
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
    'do_statement.do_body' => keyset[
      'compound_statement',
      'expression_statement',
    ],
    'do_statement.do_condition' => keyset[
      'binary_expression',
      'function_call_expression',
      'literal',
      'prefix_unary_expression',
      'subscript_expression',
      'variable',
    ],
    'do_statement.do_keyword' => keyset[
      'token:do',
    ],
    'do_statement.do_left_paren' => keyset[
      'token:(',
    ],
    'do_statement.do_right_paren' => keyset[
      'token:)',
    ],
    'do_statement.do_semicolon' => keyset[
      'token:;',
    ],
    'do_statement.do_while_keyword' => keyset[
      'token:while',
    ],
    'echo_statement.echo_expressions' => keyset[
      'list',
    ],
    'echo_statement.echo_keyword' => keyset[
      'token:echo',
    ],
    'echo_statement.echo_semicolon' => keyset[
      'missing',
      'token:;',
    ],
    'element_initializer.element_arrow' => keyset[
      'token:=>',
    ],
    'element_initializer.element_key' => keyset[
      'anonymous_function',
      'array_creation_expression',
      'array_intrinsic_expression',
      'binary_expression',
      'cast_expression',
      'collection_literal_expression',
      'dictionary_intrinsic_expression',
      'function_call_expression',
      'keyset_intrinsic_expression',
      'literal',
      'object_creation_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'qualified_name',
      'scope_resolution_expression',
      'token:name',
      'variable',
      'vector_intrinsic_expression',
    ],
    'element_initializer.element_value' => keyset[
      'anonymous_function',
      'array_creation_expression',
      'array_intrinsic_expression',
      'binary_expression',
      'cast_expression',
      'collection_literal_expression',
      'conditional_expression',
      'darray_intrinsic_expression',
      'dictionary_intrinsic_expression',
      'function_call_expression',
      'isset_expression',
      'keyset_intrinsic_expression',
      'literal',
      'member_selection_expression',
      'object_creation_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'qualified_name',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'tuple_expression',
      'variable',
      'varray_intrinsic_expression',
      'vector_intrinsic_expression',
    ],
    'else_clause.else_keyword' => keyset[
      'token:else',
    ],
    'else_clause.else_statement' => keyset[
      'compound_statement',
      'echo_statement',
      'expression_statement',
      'if_statement',
      'return_statement',
    ],
    'elseif_clause.elseif_condition' => keyset[
      'binary_expression',
      'function_call_expression',
      'literal',
      'variable',
    ],
    'elseif_clause.elseif_keyword' => keyset[
      'token:elseif',
    ],
    'elseif_clause.elseif_left_paren' => keyset[
      'token:(',
    ],
    'elseif_clause.elseif_right_paren' => keyset[
      'token:)',
    ],
    'elseif_clause.elseif_statement' => keyset[
      'compound_statement',
      'expression_statement',
    ],
    'empty_expression.empty_argument' => keyset[
      'array_creation_expression',
      'array_intrinsic_expression',
      'binary_expression',
      'collection_literal_expression',
      'function_call_expression',
      'literal',
      'member_selection_expression',
      'object_creation_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'safe_member_selection_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'variable',
      'xhp_expression',
    ],
    'empty_expression.empty_keyword' => keyset[
      'token:empty',
    ],
    'empty_expression.empty_left_paren' => keyset[
      'token:(',
    ],
    'empty_expression.empty_right_paren' => keyset[
      'token:)',
    ],
    'end_of_file.end_of_file_token' => keyset[
      'token:end_of_file',
    ],
    'enum_declaration.enum_attribute_spec' => keyset[
      'attribute_specification',
      'missing',
    ],
    'enum_declaration.enum_base' => keyset[
      'classname_type_specifier',
      'generic_type_specifier',
      'simple_type_specifier',
    ],
    'enum_declaration.enum_colon' => keyset[
      'token::',
    ],
    'enum_declaration.enum_enumerators' => keyset[
      'list',
      'missing',
    ],
    'enum_declaration.enum_keyword' => keyset[
      'token:enum',
    ],
    'enum_declaration.enum_left_brace' => keyset[
      'token:{',
    ],
    'enum_declaration.enum_name' => keyset[
      'token:name',
    ],
    'enum_declaration.enum_right_brace' => keyset[
      'token:}',
    ],
    'enum_declaration.enum_type' => keyset[
      'missing',
      'type_constraint',
    ],
    'enumerator.enumerator_equal' => keyset[
      'token:=',
    ],
    'enumerator.enumerator_name' => keyset[
      'token:name',
    ],
    'enumerator.enumerator_semicolon' => keyset[
      'token:;',
    ],
    'enumerator.enumerator_value' => keyset[
      'binary_expression',
      'function_call_expression',
      'literal',
      'object_creation_expression',
      'scope_resolution_expression',
      'token:name',
      'variable',
    ],
    'error.error_error' => keyset[
      'token:;',
      'token:=',
      'token:decimal_literal',
      'token:variable',
      'token:}',
    ],
    'eval_expression.eval_argument' => keyset[
      'binary_expression',
      'function_call_expression',
      'literal',
      'variable',
    ],
    'eval_expression.eval_keyword' => keyset[
      'token:eval',
    ],
    'eval_expression.eval_left_paren' => keyset[
      'token:(',
    ],
    'eval_expression.eval_right_paren' => keyset[
      'token:)',
    ],
    'expression_statement.expression_statement_expression' => keyset[
      'anonymous_function',
      'as_expression',
      'binary_expression',
      'cast_expression',
      'collection_literal_expression',
      'conditional_expression',
      'darray_intrinsic_expression',
      'define_expression',
      'empty_expression',
      'eval_expression',
      'function_call_expression',
      'function_call_with_type_arguments_expression',
      'halt_compiler_expression',
      'inclusion_expression',
      'isset_expression',
      'lambda_expression',
      'literal',
      'member_selection_expression',
      'missing',
      'object_creation_expression',
      'parenthesized_expression',
      'postfix_unary_expression',
      'prefix_unary_expression',
      'qualified_name',
      'safe_member_selection_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:)',
      'token:,',
      'token::',
      'token:===',
      'token:?',
      'token:name',
      'token:}',
      'tuple_expression',
      'variable',
      'varray_intrinsic_expression',
      'xhp_expression',
      'yield_expression',
      'yield_from_expression',
    ],
    'expression_statement.expression_statement_semicolon' => keyset[
      'missing',
      'token:;',
    ],
    'field_initializer.field_initializer_arrow' => keyset[
      'token:=>',
    ],
    'field_initializer.field_initializer_name' => keyset[
      'literal',
      'scope_resolution_expression',
      'token:?',
      'token:name',
      'variable',
    ],
    'field_initializer.field_initializer_value' => keyset[
      'array_intrinsic_expression',
      'binary_expression',
      'lambda_expression',
      'literal',
      'object_creation_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'variable',
      'vector_intrinsic_expression',
    ],
    'field_specifier.field_arrow' => keyset[
      'token:=>',
    ],
    'field_specifier.field_name' => keyset[
      'literal',
      'scope_resolution_expression',
    ],
    'field_specifier.field_question' => keyset[
      'missing',
      'token:?',
    ],
    'field_specifier.field_type' => keyset[
      'closure_type_specifier',
      'generic_type_specifier',
      'nullable_type_specifier',
      'shape_type_specifier',
      'simple_type_specifier',
      'type_constant',
    ],
    'finally_clause.finally_body' => keyset[
      'compound_statement',
    ],
    'finally_clause.finally_keyword' => keyset[
      'token:finally',
    ],
    'for_statement.for_body' => keyset[
      'alternate_loop_statement',
      'compound_statement',
      'echo_statement',
      'expression_statement',
      'for_statement',
      'unset_statement',
    ],
    'for_statement.for_control' => keyset[
      'list',
      'missing',
    ],
    'for_statement.for_end_of_loop' => keyset[
      'list',
      'missing',
    ],
    'for_statement.for_first_semicolon' => keyset[
      'token:;',
    ],
    'for_statement.for_initializer' => keyset[
      'list',
      'missing',
    ],
    'for_statement.for_keyword' => keyset[
      'token:for',
    ],
    'for_statement.for_left_paren' => keyset[
      'token:(',
    ],
    'for_statement.for_right_paren' => keyset[
      'token:)',
    ],
    'for_statement.for_second_semicolon' => keyset[
      'token:;',
    ],
    'foreach_statement.foreach_arrow' => keyset[
      'missing',
      'token:=>',
    ],
    'foreach_statement.foreach_as' => keyset[
      'token:as',
    ],
    'foreach_statement.foreach_await_keyword' => keyset[
      'missing',
      'token:await',
    ],
    'foreach_statement.foreach_body' => keyset[
      'alternate_loop_statement',
      'compound_statement',
      'echo_statement',
      'expression_statement',
      'foreach_statement',
    ],
    'foreach_statement.foreach_collection' => keyset[
      'anonymous_function',
      'array_creation_expression',
      'array_intrinsic_expression',
      'cast_expression',
      'collection_literal_expression',
      'function_call_expression',
      'member_selection_expression',
      'object_creation_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'variable',
      'vector_intrinsic_expression',
    ],
    'foreach_statement.foreach_key' => keyset[
      'function_call_expression',
      'list_expression',
      'member_selection_expression',
      'missing',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'variable',
    ],
    'foreach_statement.foreach_keyword' => keyset[
      'token:foreach',
    ],
    'foreach_statement.foreach_left_paren' => keyset[
      'token:(',
    ],
    'foreach_statement.foreach_right_paren' => keyset[
      'token:)',
    ],
    'foreach_statement.foreach_value' => keyset[
      'array_creation_expression',
      'function_call_expression',
      'list_expression',
      'member_selection_expression',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'variable',
    ],
    'function_call_expression.function_call_argument_list' => keyset[
      'list',
      'missing',
    ],
    'function_call_expression.function_call_left_paren' => keyset[
      'token:(',
    ],
    'function_call_expression.function_call_receiver' => keyset[
      'array_creation_expression',
      'function_call_expression',
      'literal',
      'member_selection_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'qualified_name',
      'safe_member_selection_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'variable',
    ],
    'function_call_expression.function_call_right_paren' => keyset[
      'missing',
      'token:)',
    ],
    'function_call_with_type_arguments_expression.function_call_with_type_arguments_argument_list' =>
      keyset[
        'list',
        'missing',
      ],
    'function_call_with_type_arguments_expression.function_call_with_type_arguments_left_paren' =>
      keyset[
        'missing',
        'token:(',
      ],
    'function_call_with_type_arguments_expression.function_call_with_type_arguments_receiver' =>
      keyset[
        'member_selection_expression',
        'scope_resolution_expression',
        'token:name',
      ],
    'function_call_with_type_arguments_expression.function_call_with_type_arguments_right_paren' =>
      keyset[
        'missing',
        'token:)',
      ],
    'function_call_with_type_arguments_expression.function_call_with_type_arguments_type_args' =>
      keyset[
        'type_arguments',
      ],
    'function_declaration.function_attribute_spec' => keyset[
      'attribute_specification',
      'missing',
    ],
    'function_declaration.function_body' => keyset[
      'compound_statement',
    ],
    'function_declaration.function_declaration_header' => keyset[
      'function_declaration_header',
    ],
    'function_declaration_header.function_ampersand' => keyset[
      'missing',
      'token:&',
    ],
    'function_declaration_header.function_colon' => keyset[
      'missing',
      'token::',
    ],
    'function_declaration_header.function_keyword' => keyset[
      'missing',
      'token:function',
    ],
    'function_declaration_header.function_left_paren' => keyset[
      'missing',
      'token:(',
    ],
    'function_declaration_header.function_modifiers' => keyset[
      'list',
      'missing',
    ],
    'function_declaration_header.function_name' => keyset[
      'error',
      'token:__construct',
      'token:__destruct',
      'token:name',
    ],
    'function_declaration_header.function_parameter_list' => keyset[
      'list',
      'missing',
    ],
    'function_declaration_header.function_right_paren' => keyset[
      'missing',
      'token:)',
    ],
    'function_declaration_header.function_type' => keyset[
      'classname_type_specifier',
      'closure_type_specifier',
      'darray_type_specifier',
      'dictionary_type_specifier',
      'generic_type_specifier',
      'keyset_type_specifier',
      'map_array_type_specifier',
      'missing',
      'nullable_type_specifier',
      'shape_type_specifier',
      'simple_type_specifier',
      'soft_type_specifier',
      'token:noreturn',
      'tuple_type_specifier',
      'type_constant',
      'varray_type_specifier',
      'vector_array_type_specifier',
      'vector_type_specifier',
    ],
    'function_declaration_header.function_type_parameter_list' => keyset[
      'missing',
      'type_parameters',
    ],
    'function_declaration_header.function_where_clause' => keyset[
      'missing',
      'where_clause',
    ],
    'function_static_statement.static_declarations' => keyset[
      'list',
    ],
    'function_static_statement.static_semicolon' => keyset[
      'token:;',
    ],
    'function_static_statement.static_static_keyword' => keyset[
      'token:static',
    ],
    'generic_type_specifier.generic_argument_list' => keyset[
      'type_arguments',
    ],
    'generic_type_specifier.generic_class_type' => keyset[
      'qualified_name',
      'token:XHP_class_name',
      'token:name',
      'token:string',
    ],
    'global_statement.global_keyword' => keyset[
      'token:global',
    ],
    'global_statement.global_semicolon' => keyset[
      'token:;',
    ],
    'global_statement.global_variables' => keyset[
      'list',
    ],
    'goto_label.goto_label_colon' => keyset[
      'token::',
    ],
    'goto_label.goto_label_name' => keyset[
      'token:name',
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
    'halt_compiler_expression.halt_compiler_argument_list' => keyset[
      'missing',
    ],
    'halt_compiler_expression.halt_compiler_keyword' => keyset[
      'token:__halt_compiler',
    ],
    'halt_compiler_expression.halt_compiler_left_paren' => keyset[
      'token:(',
    ],
    'halt_compiler_expression.halt_compiler_right_paren' => keyset[
      'token:)',
    ],
    'if_statement.if_condition' => keyset[
      'array_intrinsic_expression',
      'as_expression',
      'binary_expression',
      'cast_expression',
      'empty_expression',
      'function_call_expression',
      'instanceof_expression',
      'is_expression',
      'isset_expression',
      'literal',
      'member_selection_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'qualified_name',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'variable',
    ],
    'if_statement.if_else_clause' => keyset[
      'else_clause',
      'missing',
    ],
    'if_statement.if_elseif_clauses' => keyset[
      'list',
      'missing',
    ],
    'if_statement.if_keyword' => keyset[
      'token:if',
    ],
    'if_statement.if_left_paren' => keyset[
      'token:(',
    ],
    'if_statement.if_right_paren' => keyset[
      'token:)',
    ],
    'if_statement.if_statement' => keyset[
      'break_statement',
      'compound_statement',
      'continue_statement',
      'echo_statement',
      'expression_statement',
      'global_statement',
      'goto_statement',
      'return_statement',
      'throw_statement',
      'unset_statement',
    ],
    'inclusion_directive.inclusion_expression' => keyset[
      'inclusion_expression',
    ],
    'inclusion_directive.inclusion_semicolon' => keyset[
      'token:;',
    ],
    'inclusion_expression.inclusion_filename' => keyset[
      'binary_expression',
      'literal',
      'parenthesized_expression',
      'subscript_expression',
      'token:name',
      'variable',
    ],
    'inclusion_expression.inclusion_require' => keyset[
      'token:include',
      'token:include_once',
      'token:require',
      'token:require_once',
    ],
    'instanceof_expression.instanceof_left_operand' => keyset[
      'anonymous_function',
      'cast_expression',
      'function_call_expression',
      'literal',
      'member_selection_expression',
      'object_creation_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'variable',
    ],
    'instanceof_expression.instanceof_operator' => keyset[
      'token:instanceof',
    ],
    'instanceof_expression.instanceof_right_operand' => keyset[
      'member_selection_expression',
      'parenthesized_expression',
      'qualified_name',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'variable',
    ],
    'is_expression.is_left_operand' => keyset[
      'variable',
    ],
    'is_expression.is_operator' => keyset[
      'token:is',
    ],
    'is_expression.is_right_operand' => keyset[
      'closure_type_specifier',
      'dictionary_type_specifier',
      'generic_type_specifier',
      'keyset_type_specifier',
      'nullable_type_specifier',
      'shape_type_specifier',
      'simple_type_specifier',
      'soft_type_specifier',
      'tuple_type_specifier',
      'type_constant',
      'vector_type_specifier',
    ],
    'isset_expression.isset_argument_list' => keyset[
      'list',
    ],
    'isset_expression.isset_keyword' => keyset[
      'token:isset',
    ],
    'isset_expression.isset_left_paren' => keyset[
      'token:(',
    ],
    'isset_expression.isset_right_paren' => keyset[
      'token:)',
    ],
    'keyset_intrinsic_expression.keyset_intrinsic_explicit_type' => keyset[
      'missing',
    ],
    'keyset_intrinsic_expression.keyset_intrinsic_keyword' => keyset[
      'token:keyset',
    ],
    'keyset_intrinsic_expression.keyset_intrinsic_left_bracket' => keyset[
      'token:[',
    ],
    'keyset_intrinsic_expression.keyset_intrinsic_members' => keyset[
      'list',
      'missing',
    ],
    'keyset_intrinsic_expression.keyset_intrinsic_right_bracket' => keyset[
      'token:]',
    ],
    'keyset_type_specifier.keyset_type_keyword' => keyset[
      'token:keyset',
    ],
    'keyset_type_specifier.keyset_type_left_angle' => keyset[
      'token:<',
    ],
    'keyset_type_specifier.keyset_type_right_angle' => keyset[
      'token:>',
    ],
    'keyset_type_specifier.keyset_type_trailing_comma' => keyset[
      'missing',
    ],
    'keyset_type_specifier.keyset_type_type' => keyset[
      'simple_type_specifier',
    ],
    'lambda_expression.lambda_arrow' => keyset[
      'token:==>',
    ],
    'lambda_expression.lambda_async' => keyset[
      'missing',
      'token:async',
    ],
    'lambda_expression.lambda_attribute_spec' => keyset[
      'attribute_specification',
      'missing',
    ],
    'lambda_expression.lambda_body' => keyset[
      'array_intrinsic_expression',
      'binary_expression',
      'cast_expression',
      'compound_statement',
      'conditional_expression',
      'function_call_expression',
      'lambda_expression',
      'literal',
      'member_selection_expression',
      'object_creation_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'subscript_expression',
      'variable',
    ],
    'lambda_expression.lambda_coroutine' => keyset[
      'missing',
      'token:coroutine',
    ],
    'lambda_expression.lambda_signature' => keyset[
      'lambda_signature',
      'token:variable',
    ],
    'lambda_signature.lambda_colon' => keyset[
      'missing',
      'token::',
    ],
    'lambda_signature.lambda_left_paren' => keyset[
      'token:(',
    ],
    'lambda_signature.lambda_parameters' => keyset[
      'list',
      'missing',
    ],
    'lambda_signature.lambda_right_paren' => keyset[
      'token:)',
    ],
    'lambda_signature.lambda_type' => keyset[
      'closure_type_specifier',
      'generic_type_specifier',
      'missing',
      'simple_type_specifier',
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
    'list_item.list_item' => keyset[
      'anonymous_function',
      'array_creation_expression',
      'array_intrinsic_expression',
      'attribute',
      'awaitable_creation_expression',
      'binary_expression',
      'cast_expression',
      'classname_type_specifier',
      'closure_parameter_type_specifier',
      'closure_type_specifier',
      'collection_literal_expression',
      'conditional_expression',
      'constant_declarator',
      'darray_intrinsic_expression',
      'decorated_expression',
      'define_expression',
      'dictionary_intrinsic_expression',
      'dictionary_type_specifier',
      'element_initializer',
      'empty_expression',
      'eval_expression',
      'field_initializer',
      'field_specifier',
      'function_call_expression',
      'generic_type_specifier',
      'inclusion_expression',
      'instanceof_expression',
      'isset_expression',
      'keyset_intrinsic_expression',
      'lambda_expression',
      'list_expression',
      'literal',
      'map_array_type_specifier',
      'member_selection_expression',
      'missing',
      'namespace_use_clause',
      'nullable_type_specifier',
      'object_creation_expression',
      'parameter_declaration',
      'parenthesized_expression',
      'pipe_variable',
      'postfix_unary_expression',
      'prefix_unary_expression',
      'property_declarator',
      'qualified_name',
      'safe_member_selection_expression',
      'scope_resolution_expression',
      'shape_expression',
      'shape_type_specifier',
      'simple_type_specifier',
      'static_declarator',
      'subscript_expression',
      'token:=',
      'token:XHP_category_name',
      'token:name',
      'token:noreturn',
      'token:variable',
      'trait_use_alias_item',
      'trait_use_precedence_item',
      'tuple_expression',
      'tuple_type_specifier',
      'type_constant',
      'type_parameter',
      'variable',
      'variadic_parameter',
      'varray_intrinsic_expression',
      'varray_type_specifier',
      'vector_array_type_specifier',
      'vector_intrinsic_expression',
      'vector_type_specifier',
      'where_constraint',
      'xhp_class_attribute',
      'xhp_expression',
      'xhp_simple_class_attribute',
    ],
    'list_item.list_separator' => keyset[
      'missing',
      'token:,',
      'token:;',
      'token:\\',
    ],
    'map_array_type_specifier.map_array_comma' => keyset[
      'token:,',
    ],
    'map_array_type_specifier.map_array_key' => keyset[
      'simple_type_specifier',
    ],
    'map_array_type_specifier.map_array_keyword' => keyset[
      'token:array',
    ],
    'map_array_type_specifier.map_array_left_angle' => keyset[
      'token:<',
    ],
    'map_array_type_specifier.map_array_right_angle' => keyset[
      'token:>',
    ],
    'map_array_type_specifier.map_array_value' => keyset[
      'generic_type_specifier',
      'missing',
      'nullable_type_specifier',
      'shape_type_specifier',
      'simple_type_specifier',
      'soft_type_specifier',
    ],
    'markup_section.markup_expression' => keyset[
      'expression_statement',
      'missing',
    ],
    'markup_section.markup_prefix' => keyset[
      'missing',
      'token:?>',
    ],
    'markup_section.markup_suffix' => keyset[
      'markup_suffix',
      'missing',
    ],
    'markup_section.markup_text' => keyset[
      'missing',
      'token:markup',
    ],
    'markup_suffix.markup_suffix_less_than_question' => keyset[
      'token:<?',
    ],
    'markup_suffix.markup_suffix_name' => keyset[
      'missing',
      'token:=',
      'token:name',
    ],
    'member_selection_expression.member_name' => keyset[
      'braced_expression',
      'prefix_unary_expression',
      'token:XHP_class_name',
      'token:name',
      'token:variable',
    ],
    'member_selection_expression.member_object' => keyset[
      'function_call_expression',
      'member_selection_expression',
      'parenthesized_expression',
      'pipe_variable',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'variable',
    ],
    'member_selection_expression.member_operator' => keyset[
      'token:->',
    ],
    'methodish_declaration.methodish_attribute' => keyset[
      'attribute_specification',
      'missing',
    ],
    'methodish_declaration.methodish_function_body' => keyset[
      'compound_statement',
      'error',
      'missing',
    ],
    'methodish_declaration.methodish_function_decl_header' => keyset[
      'function_declaration_header',
    ],
    'methodish_declaration.methodish_semicolon' => keyset[
      'missing',
      'token:;',
    ],
    'namespace_body.namespace_declarations' => keyset[
      'list',
      'missing',
    ],
    'namespace_body.namespace_left_brace' => keyset[
      'token:{',
    ],
    'namespace_body.namespace_right_brace' => keyset[
      'missing',
      'token:}',
    ],
    'namespace_declaration.namespace_body' => keyset[
      'namespace_body',
      'namespace_empty_body',
    ],
    'namespace_declaration.namespace_keyword' => keyset[
      'token:namespace',
    ],
    'namespace_declaration.namespace_name' => keyset[
      'missing',
      'qualified_name',
      'token:name',
    ],
    'namespace_empty_body.namespace_semicolon' => keyset[
      'token:;',
    ],
    'namespace_group_use_declaration.namespace_group_use_clauses' => keyset[
      'list',
    ],
    'namespace_group_use_declaration.namespace_group_use_keyword' => keyset[
      'token:use',
    ],
    'namespace_group_use_declaration.namespace_group_use_kind' => keyset[
      'missing',
      'token:const',
      'token:function',
      'token:namespace',
      'token:type',
    ],
    'namespace_group_use_declaration.namespace_group_use_left_brace' => keyset[
      'token:{',
    ],
    'namespace_group_use_declaration.namespace_group_use_prefix' => keyset[
      'qualified_name',
    ],
    'namespace_group_use_declaration.namespace_group_use_right_brace' => keyset[
      'missing',
      'token:}',
    ],
    'namespace_group_use_declaration.namespace_group_use_semicolon' => keyset[
      'missing',
      'token:;',
    ],
    'namespace_use_clause.namespace_use_alias' => keyset[
      'missing',
      'token:name',
    ],
    'namespace_use_clause.namespace_use_as' => keyset[
      'missing',
      'token:as',
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
    'namespace_use_declaration.namespace_use_clauses' => keyset[
      'list',
    ],
    'namespace_use_declaration.namespace_use_keyword' => keyset[
      'token:use',
    ],
    'namespace_use_declaration.namespace_use_kind' => keyset[
      'missing',
      'token:const',
      'token:function',
      'token:namespace',
      'token:type',
    ],
    'namespace_use_declaration.namespace_use_semicolon' => keyset[
      'token:;',
    ],
    'nullable_as_expression.nullable_as_left_operand' => keyset[
      'variable',
    ],
    'nullable_as_expression.nullable_as_operator' => keyset[
      'token:?as',
    ],
    'nullable_as_expression.nullable_as_right_operand' => keyset[
      'simple_type_specifier',
    ],
    'nullable_type_specifier.nullable_question' => keyset[
      'token:?',
    ],
    'nullable_type_specifier.nullable_type' => keyset[
      'closure_type_specifier',
      'dictionary_type_specifier',
      'generic_type_specifier',
      'keyset_type_specifier',
      'map_array_type_specifier',
      'shape_type_specifier',
      'simple_type_specifier',
      'tuple_type_specifier',
      'type_constant',
      'vector_array_type_specifier',
      'vector_type_specifier',
    ],
    'object_creation_expression.object_creation_new_keyword' => keyset[
      'token:new',
    ],
    'object_creation_expression.object_creation_object' => keyset[
      'anonymous_class',
      'constructor_call',
    ],
    'parameter_declaration.parameter_attribute' => keyset[
      'attribute_specification',
      'missing',
    ],
    'parameter_declaration.parameter_call_convention' => keyset[
      'missing',
      'token:inout',
    ],
    'parameter_declaration.parameter_default_value' => keyset[
      'missing',
      'simple_initializer',
    ],
    'parameter_declaration.parameter_name' => keyset[
      'decorated_expression',
      'missing',
      'token:variable',
    ],
    'parameter_declaration.parameter_type' => keyset[
      'classname_type_specifier',
      'closure_type_specifier',
      'darray_type_specifier',
      'dictionary_type_specifier',
      'error',
      'generic_type_specifier',
      'keyset_type_specifier',
      'map_array_type_specifier',
      'missing',
      'nullable_type_specifier',
      'shape_type_specifier',
      'simple_type_specifier',
      'soft_type_specifier',
      'tuple_type_specifier',
      'type_constant',
      'varray_type_specifier',
      'vector_array_type_specifier',
      'vector_type_specifier',
    ],
    'parameter_declaration.parameter_visibility' => keyset[
      'missing',
      'token:private',
      'token:protected',
      'token:public',
    ],
    'parenthesized_expression.parenthesized_expression_expression' => keyset[
      'anonymous_function',
      'array_intrinsic_expression',
      'binary_expression',
      'cast_expression',
      'collection_literal_expression',
      'conditional_expression',
      'empty_expression',
      'function_call_expression',
      'inclusion_expression',
      'instanceof_expression',
      'isset_expression',
      'lambda_expression',
      'literal',
      'member_selection_expression',
      'object_creation_expression',
      'parenthesized_expression',
      'postfix_unary_expression',
      'prefix_unary_expression',
      'qualified_name',
      'scope_resolution_expression',
      'subscript_expression',
      'token:?',
      'token:name',
      'variable',
      'xhp_expression',
      'yield_expression',
    ],
    'parenthesized_expression.parenthesized_expression_left_paren' => keyset[
      'token:(',
    ],
    'parenthesized_expression.parenthesized_expression_right_paren' => keyset[
      'missing',
      'token:)',
    ],
    'php7_anonymous_function.php7_anonymous_ampersand' => keyset[
      'missing',
    ],
    'php7_anonymous_function.php7_anonymous_async_keyword' => keyset[
      'missing',
    ],
    'php7_anonymous_function.php7_anonymous_attribute_spec' => keyset[
      'missing',
    ],
    'php7_anonymous_function.php7_anonymous_body' => keyset[
      'compound_statement',
    ],
    'php7_anonymous_function.php7_anonymous_colon' => keyset[
      'token::',
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
    'php7_anonymous_function.php7_anonymous_static_keyword' => keyset[
      'missing',
    ],
    'php7_anonymous_function.php7_anonymous_type' => keyset[
      'simple_type_specifier',
    ],
    'php7_anonymous_function.php7_anonymous_use' => keyset[
      'anonymous_function_use_clause',
    ],
    'postfix_unary_expression.postfix_unary_operand' => keyset[
      'member_selection_expression',
      'prefix_unary_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'variable',
    ],
    'postfix_unary_expression.postfix_unary_operator' => keyset[
      'token:++',
      'token:--',
    ],
    'prefix_unary_expression.prefix_unary_operand' => keyset[
      'anonymous_function',
      'array_intrinsic_expression',
      'binary_expression',
      'braced_expression',
      'cast_expression',
      'conditional_expression',
      'define_expression',
      'empty_expression',
      'eval_expression',
      'function_call_expression',
      'inclusion_expression',
      'instanceof_expression',
      'isset_expression',
      'literal',
      'member_selection_expression',
      'object_creation_expression',
      'parenthesized_expression',
      'pipe_variable',
      'postfix_unary_expression',
      'prefix_unary_expression',
      'safe_member_selection_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:end_of_file',
      'token:name',
      'token:variable',
      'variable',
    ],
    'prefix_unary_expression.prefix_unary_operator' => keyset[
      'token:!',
      'token:$',
      'token:&',
      'token:+',
      'token:++',
      'token:-',
      'token:--',
      'token:@',
      'token:await',
      'token:clone',
      'token:print',
      'token:suspend',
      'token:~',
    ],
    'property_declaration.property_attribute_spec' => keyset[
      'attribute_specification',
      'missing',
    ],
    'property_declaration.property_declarators' => keyset[
      'list',
    ],
    'property_declaration.property_modifiers' => keyset[
      'list',
      'token:var',
    ],
    'property_declaration.property_semicolon' => keyset[
      'token:;',
    ],
    'property_declaration.property_type' => keyset[
      'closure_type_specifier',
      'darray_type_specifier',
      'dictionary_type_specifier',
      'generic_type_specifier',
      'map_array_type_specifier',
      'missing',
      'nullable_type_specifier',
      'simple_type_specifier',
      'soft_type_specifier',
      'tuple_type_specifier',
      'type_constant',
      'varray_type_specifier',
      'vector_array_type_specifier',
      'vector_type_specifier',
    ],
    'property_declarator.property_initializer' => keyset[
      'missing',
      'simple_initializer',
    ],
    'property_declarator.property_name' => keyset[
      'token:variable',
    ],
    'qualified_name.qualified_name_parts' => keyset[
      'list',
    ],
    'require_clause.require_keyword' => keyset[
      'token:require',
    ],
    'require_clause.require_kind' => keyset[
      'token:extends',
      'token:implements',
    ],
    'require_clause.require_name' => keyset[
      'generic_type_specifier',
      'simple_type_specifier',
    ],
    'require_clause.require_semicolon' => keyset[
      'token:;',
    ],
    'return_statement.return_expression' => keyset[
      'anonymous_function',
      'array_creation_expression',
      'array_intrinsic_expression',
      'awaitable_creation_expression',
      'binary_expression',
      'cast_expression',
      'collection_literal_expression',
      'conditional_expression',
      'darray_intrinsic_expression',
      'dictionary_intrinsic_expression',
      'eval_expression',
      'function_call_expression',
      'function_call_with_type_arguments_expression',
      'instanceof_expression',
      'isset_expression',
      'keyset_intrinsic_expression',
      'lambda_expression',
      'literal',
      'member_selection_expression',
      'missing',
      'object_creation_expression',
      'parenthesized_expression',
      'postfix_unary_expression',
      'prefix_unary_expression',
      'qualified_name',
      'safe_member_selection_expression',
      'scope_resolution_expression',
      'shape_expression',
      'subscript_expression',
      'token:name',
      'tuple_expression',
      'variable',
      'varray_intrinsic_expression',
      'vector_intrinsic_expression',
      'xhp_expression',
      'yield_from_expression',
    ],
    'return_statement.return_keyword' => keyset[
      'token:return',
    ],
    'return_statement.return_semicolon' => keyset[
      'token:;',
    ],
    'safe_member_selection_expression.safe_member_name' => keyset[
      'prefix_unary_expression',
      'token:XHP_class_name',
      'token:name',
    ],
    'safe_member_selection_expression.safe_member_object' => keyset[
      'function_call_expression',
      'member_selection_expression',
      'prefix_unary_expression',
      'safe_member_selection_expression',
      'scope_resolution_expression',
      'variable',
    ],
    'safe_member_selection_expression.safe_member_operator' => keyset[
      'token:?->',
    ],
    'scope_resolution_expression.scope_resolution_name' => keyset[
      'braced_expression',
      'prefix_unary_expression',
      'token:class',
      'token:name',
      'token:variable',
    ],
    'scope_resolution_expression.scope_resolution_operator' => keyset[
      'token:::',
    ],
    'scope_resolution_expression.scope_resolution_qualifier' => keyset[
      'function_call_expression',
      'generic_type_specifier',
      'literal',
      'parenthesized_expression',
      'pipe_variable',
      'prefix_unary_expression',
      'qualified_name',
      'scope_resolution_expression',
      'simple_type_specifier',
      'token:XHP_class_name',
      'token:name',
      'token:parent',
      'token:self',
      'token:static',
      'variable',
    ],
    'script.script_declarations' => keyset[
      'list',
    ],
    'shape_expression.shape_expression_fields' => keyset[
      'list',
      'missing',
    ],
    'shape_expression.shape_expression_keyword' => keyset[
      'token:shape',
    ],
    'shape_expression.shape_expression_left_paren' => keyset[
      'token:(',
    ],
    'shape_expression.shape_expression_right_paren' => keyset[
      'token:)',
    ],
    'shape_type_specifier.shape_type_ellipsis' => keyset[
      'missing',
      'token:...',
    ],
    'shape_type_specifier.shape_type_fields' => keyset[
      'list',
      'missing',
    ],
    'shape_type_specifier.shape_type_keyword' => keyset[
      'token:shape',
    ],
    'shape_type_specifier.shape_type_left_paren' => keyset[
      'token:(',
    ],
    'shape_type_specifier.shape_type_right_paren' => keyset[
      'token:)',
    ],
    'simple_initializer.simple_initializer_equal' => keyset[
      'token:=',
    ],
    'simple_initializer.simple_initializer_value' => keyset[
      'array_creation_expression',
      'array_intrinsic_expression',
      'binary_expression',
      'collection_literal_expression',
      'conditional_expression',
      'darray_intrinsic_expression',
      'dictionary_intrinsic_expression',
      'function_call_expression',
      'keyset_intrinsic_expression',
      'literal',
      'parenthesized_expression',
      'prefix_unary_expression',
      'qualified_name',
      'scope_resolution_expression',
      'shape_expression',
      'subscript_expression',
      'token:name',
      'tuple_expression',
      'variable',
      'varray_intrinsic_expression',
      'vector_intrinsic_expression',
      'xhp_expression',
    ],
    'simple_type_specifier.simple_type_specifier' => keyset[
      'qualified_name',
      'token:XHP_class_name',
      'token:__construct',
      'token:array',
      'token:arraykey',
      'token:bool',
      'token:boolean',
      'token:darray',
      'token:dict',
      'token:double',
      'token:float',
      'token:int',
      'token:integer',
      'token:keyset',
      'token:mixed',
      'token:name',
      'token:noreturn',
      'token:num',
      'token:object',
      'token:parent',
      'token:real',
      'token:resource',
      'token:self',
      'token:string',
      'token:this',
      'token:var',
      'token:varray',
      'token:vec',
      'token:void',
    ],
    'soft_type_specifier.soft_at' => keyset[
      'token:@',
    ],
    'soft_type_specifier.soft_type' => keyset[
      'closure_type_specifier',
      'generic_type_specifier',
      'map_array_type_specifier',
      'nullable_type_specifier',
      'simple_type_specifier',
      'tuple_type_specifier',
    ],
    'static_declarator.static_initializer' => keyset[
      'missing',
      'simple_initializer',
    ],
    'static_declarator.static_name' => keyset[
      'token:variable',
    ],
    'subscript_expression.subscript_index' => keyset[
      'anonymous_function',
      'array_intrinsic_expression',
      'binary_expression',
      'cast_expression',
      'function_call_expression',
      'literal',
      'member_selection_expression',
      'missing',
      'object_creation_expression',
      'parenthesized_expression',
      'postfix_unary_expression',
      'prefix_unary_expression',
      'safe_member_selection_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:name',
      'variable',
    ],
    'subscript_expression.subscript_left_bracket' => keyset[
      'token:[',
      'token:{',
    ],
    'subscript_expression.subscript_receiver' => keyset[
      'array_creation_expression',
      'array_intrinsic_expression',
      'function_call_expression',
      'literal',
      'member_selection_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'safe_member_selection_expression',
      'scope_resolution_expression',
      'subscript_expression',
      'token:)',
      'token:name',
      'variable',
    ],
    'subscript_expression.subscript_right_bracket' => keyset[
      'missing',
      'token:]',
      'token:}',
    ],
    'switch_fallthrough.fallthrough_keyword' => keyset[
      'missing',
    ],
    'switch_fallthrough.fallthrough_semicolon' => keyset[
      'missing',
    ],
    'switch_section.switch_section_fallthrough' => keyset[
      'missing',
      'switch_fallthrough',
    ],
    'switch_section.switch_section_labels' => keyset[
      'list',
    ],
    'switch_section.switch_section_statements' => keyset[
      'list',
      'missing',
    ],
    'switch_statement.switch_expression' => keyset[
      'binary_expression',
      'function_call_expression',
      'literal',
      'member_selection_expression',
      'object_creation_expression',
      'prefix_unary_expression',
      'subscript_expression',
      'variable',
    ],
    'switch_statement.switch_keyword' => keyset[
      'token:switch',
    ],
    'switch_statement.switch_left_brace' => keyset[
      'token:{',
    ],
    'switch_statement.switch_left_paren' => keyset[
      'token:(',
    ],
    'switch_statement.switch_right_brace' => keyset[
      'token:}',
    ],
    'switch_statement.switch_right_paren' => keyset[
      'token:)',
    ],
    'switch_statement.switch_sections' => keyset[
      'list',
      'missing',
    ],
    'throw_statement.throw_expression' => keyset[
      'function_call_expression',
      'literal',
      'object_creation_expression',
      'parenthesized_expression',
      'variable',
    ],
    'throw_statement.throw_keyword' => keyset[
      'token:throw',
    ],
    'throw_statement.throw_semicolon' => keyset[
      'token:;',
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
    'trait_use_alias_item.trait_use_alias_item_aliased_name' => keyset[
      'missing',
      'simple_type_specifier',
    ],
    'trait_use_alias_item.trait_use_alias_item_aliasing_name' => keyset[
      'scope_resolution_expression',
      'simple_type_specifier',
    ],
    'trait_use_alias_item.trait_use_alias_item_keyword' => keyset[
      'token:as',
    ],
    'trait_use_alias_item.trait_use_alias_item_modifiers' => keyset[
      'list',
      'missing',
    ],
    'trait_use_conflict_resolution.trait_use_conflict_resolution_clauses' =>
      keyset[
        'list',
        'missing',
      ],
    'trait_use_conflict_resolution.trait_use_conflict_resolution_keyword' =>
      keyset[
        'token:use',
      ],
    'trait_use_conflict_resolution.trait_use_conflict_resolution_left_brace' =>
      keyset[
        'token:{',
      ],
    'trait_use_conflict_resolution.trait_use_conflict_resolution_names' =>
      keyset[
        'list',
      ],
    'trait_use_conflict_resolution.trait_use_conflict_resolution_right_brace' =>
      keyset[
        'token:}',
      ],
    'trait_use_precedence_item.trait_use_precedence_item_keyword' => keyset[
      'token:insteadof',
    ],
    'trait_use_precedence_item.trait_use_precedence_item_name' => keyset[
      'scope_resolution_expression',
    ],
    'trait_use_precedence_item.trait_use_precedence_item_removed_names' =>
      keyset[
        'list',
      ],
    'try_statement.try_catch_clauses' => keyset[
      'list',
      'missing',
    ],
    'try_statement.try_compound_statement' => keyset[
      'compound_statement',
    ],
    'try_statement.try_finally_clause' => keyset[
      'finally_clause',
      'missing',
    ],
    'try_statement.try_keyword' => keyset[
      'token:try',
    ],
    'tuple_expression.tuple_expression_items' => keyset[
      'list',
      'missing',
    ],
    'tuple_expression.tuple_expression_keyword' => keyset[
      'token:tuple',
    ],
    'tuple_expression.tuple_expression_left_paren' => keyset[
      'token:(',
    ],
    'tuple_expression.tuple_expression_right_paren' => keyset[
      'token:)',
    ],
    'tuple_type_specifier.tuple_left_paren' => keyset[
      'token:(',
    ],
    'tuple_type_specifier.tuple_right_paren' => keyset[
      'token:)',
    ],
    'tuple_type_specifier.tuple_types' => keyset[
      'list',
    ],
    'type_arguments.type_arguments_left_angle' => keyset[
      'token:<',
    ],
    'type_arguments.type_arguments_right_angle' => keyset[
      'missing',
      'token:>',
    ],
    'type_arguments.type_arguments_types' => keyset[
      'list',
    ],
    'type_const_declaration.type_const_abstract' => keyset[
      'missing',
      'token:abstract',
    ],
    'type_const_declaration.type_const_equal' => keyset[
      'missing',
      'token:=',
    ],
    'type_const_declaration.type_const_keyword' => keyset[
      'token:const',
    ],
    'type_const_declaration.type_const_name' => keyset[
      'token:name',
    ],
    'type_const_declaration.type_const_semicolon' => keyset[
      'token:;',
    ],
    'type_const_declaration.type_const_type_constraint' => keyset[
      'missing',
      'type_constraint',
    ],
    'type_const_declaration.type_const_type_keyword' => keyset[
      'token:type',
    ],
    'type_const_declaration.type_const_type_parameters' => keyset[
      'missing',
    ],
    'type_const_declaration.type_const_type_specifier' => keyset[
      'closure_type_specifier',
      'dictionary_type_specifier',
      'generic_type_specifier',
      'keyset_type_specifier',
      'missing',
      'nullable_type_specifier',
      'shape_type_specifier',
      'simple_type_specifier',
      'tuple_type_specifier',
      'type_constant',
      'vector_type_specifier',
    ],
    'type_constant.type_constant_left_type' => keyset[
      'token:name',
      'token:parent',
      'token:self',
      'token:this',
      'type_constant',
    ],
    'type_constant.type_constant_right_type' => keyset[
      'token:name',
    ],
    'type_constant.type_constant_separator' => keyset[
      'token:::',
    ],
    'type_constraint.constraint_keyword' => keyset[
      'token:as',
      'token:super',
    ],
    'type_constraint.constraint_type' => keyset[
      'classname_type_specifier',
      'closure_type_specifier',
      'dictionary_type_specifier',
      'generic_type_specifier',
      'keyset_type_specifier',
      'nullable_type_specifier',
      'shape_type_specifier',
      'simple_type_specifier',
      'type_constant',
      'vector_array_type_specifier',
    ],
    'type_parameter.type_constraints' => keyset[
      'list',
      'missing',
    ],
    'type_parameter.type_name' => keyset[
      'token:name',
    ],
    'type_parameter.type_variance' => keyset[
      'missing',
      'token:+',
      'token:-',
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
    'unset_statement.unset_keyword' => keyset[
      'token:unset',
    ],
    'unset_statement.unset_left_paren' => keyset[
      'token:(',
    ],
    'unset_statement.unset_right_paren' => keyset[
      'token:)',
    ],
    'unset_statement.unset_semicolon' => keyset[
      'token:;',
    ],
    'unset_statement.unset_variables' => keyset[
      'list',
    ],
    'using_statement_block_scoped.using_block_await_keyword' => keyset[
      'missing',
      'token:await',
    ],
    'using_statement_block_scoped.using_block_body' => keyset[
      'compound_statement',
    ],
    'using_statement_block_scoped.using_block_expressions' => keyset[
      'list',
    ],
    'using_statement_block_scoped.using_block_left_paren' => keyset[
      'token:(',
    ],
    'using_statement_block_scoped.using_block_right_paren' => keyset[
      'token:)',
    ],
    'using_statement_block_scoped.using_block_using_keyword' => keyset[
      'token:using',
    ],
    'using_statement_function_scoped.using_function_await_keyword' => keyset[
      'missing',
      'token:await',
    ],
    'using_statement_function_scoped.using_function_expression' => keyset[
      'binary_expression',
      'lambda_expression',
      'object_creation_expression',
      'parenthesized_expression',
      'prefix_unary_expression',
      'variable',
    ],
    'using_statement_function_scoped.using_function_semicolon' => keyset[
      'token:;',
    ],
    'using_statement_function_scoped.using_function_using_keyword' => keyset[
      'token:using',
    ],
    'variadic_parameter.variadic_parameter_call_convention' => keyset[
      'missing',
    ],
    'variadic_parameter.variadic_parameter_ellipsis' => keyset[
      'token:...',
    ],
    'variadic_parameter.variadic_parameter_type' => keyset[
      'closure_type_specifier',
      'missing',
      'simple_type_specifier',
      'tuple_type_specifier',
    ],
    'varray_intrinsic_expression.varray_intrinsic_explicit_type' => keyset[
      'missing',
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
    'varray_type_specifier.varray_keyword' => keyset[
      'token:varray',
    ],
    'varray_type_specifier.varray_left_angle' => keyset[
      'token:<',
    ],
    'varray_type_specifier.varray_right_angle' => keyset[
      'token:>',
    ],
    'varray_type_specifier.varray_trailing_comma' => keyset[
      'missing',
    ],
    'varray_type_specifier.varray_type' => keyset[
      'darray_type_specifier',
      'simple_type_specifier',
      'varray_type_specifier',
      'vector_array_type_specifier',
    ],
    'vector_array_type_specifier.vector_array_keyword' => keyset[
      'token:array',
    ],
    'vector_array_type_specifier.vector_array_left_angle' => keyset[
      'token:<',
    ],
    'vector_array_type_specifier.vector_array_right_angle' => keyset[
      'token:>',
    ],
    'vector_array_type_specifier.vector_array_type' => keyset[
      'darray_type_specifier',
      'generic_type_specifier',
      'nullable_type_specifier',
      'shape_type_specifier',
      'simple_type_specifier',
      'tuple_type_specifier',
      'varray_type_specifier',
      'vector_array_type_specifier',
    ],
    'vector_intrinsic_expression.vector_intrinsic_explicit_type' => keyset[
      'missing',
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
    'vector_type_specifier.vector_type_keyword' => keyset[
      'token:vec',
    ],
    'vector_type_specifier.vector_type_left_angle' => keyset[
      'token:<',
    ],
    'vector_type_specifier.vector_type_right_angle' => keyset[
      'token:>',
    ],
    'vector_type_specifier.vector_type_trailing_comma' => keyset[
      'missing',
    ],
    'vector_type_specifier.vector_type_type' => keyset[
      'classname_type_specifier',
      'closure_type_specifier',
      'nullable_type_specifier',
      'simple_type_specifier',
      'vector_type_specifier',
    ],
    'where_clause.where_clause_constraints' => keyset[
      'list',
    ],
    'where_clause.where_clause_keyword' => keyset[
      'token:where',
    ],
    'where_constraint.where_constraint_left_type' => keyset[
      'generic_type_specifier',
      'simple_type_specifier',
      'type_constant',
    ],
    'where_constraint.where_constraint_operator' => keyset[
      'token:=',
      'token:as',
      'token:super',
    ],
    'where_constraint.where_constraint_right_type' => keyset[
      'generic_type_specifier',
      'nullable_type_specifier',
      'simple_type_specifier',
      'type_constant',
    ],
    'while_statement.while_body' => keyset[
      'alternate_loop_statement',
      'compound_statement',
      'continue_statement',
      'echo_statement',
      'expression_statement',
    ],
    'while_statement.while_condition' => keyset[
      'binary_expression',
      'function_call_expression',
      'instanceof_expression',
      'isset_expression',
      'literal',
      'parenthesized_expression',
      'postfix_unary_expression',
      'prefix_unary_expression',
      'variable',
    ],
    'while_statement.while_keyword' => keyset[
      'token:while',
    ],
    'while_statement.while_left_paren' => keyset[
      'token:(',
    ],
    'while_statement.while_right_paren' => keyset[
      'token:)',
    ],
    'xhp_category_declaration.xhp_category_categories' => keyset[
      'list',
    ],
    'xhp_category_declaration.xhp_category_keyword' => keyset[
      'token:category',
    ],
    'xhp_category_declaration.xhp_category_semicolon' => keyset[
      'token:;',
    ],
    'xhp_class_attribute.xhp_attribute_decl_initializer' => keyset[
      'missing',
      'simple_initializer',
    ],
    'xhp_class_attribute.xhp_attribute_decl_name' => keyset[
      'token:XHP_element_name',
    ],
    'xhp_class_attribute.xhp_attribute_decl_required' => keyset[
      'missing',
      'xhp_required',
    ],
    'xhp_class_attribute.xhp_attribute_decl_type' => keyset[
      'generic_type_specifier',
      'map_array_type_specifier',
      'nullable_type_specifier',
      'simple_type_specifier',
      'vector_array_type_specifier',
      'xhp_enum_type',
    ],
    'xhp_class_attribute_declaration.xhp_attribute_attributes' => keyset[
      'list',
    ],
    'xhp_class_attribute_declaration.xhp_attribute_keyword' => keyset[
      'token:attribute',
    ],
    'xhp_class_attribute_declaration.xhp_attribute_semicolon' => keyset[
      'token:;',
    ],
    'xhp_close.xhp_close_left_angle' => keyset[
      'token:</',
      'token:end_of_file',
    ],
    'xhp_close.xhp_close_name' => keyset[
      'missing',
      'token:XHP_element_name',
    ],
    'xhp_close.xhp_close_right_angle' => keyset[
      'missing',
      'token:>',
    ],
    'xhp_enum_type.xhp_enum_keyword' => keyset[
      'token:enum',
    ],
    'xhp_enum_type.xhp_enum_left_brace' => keyset[
      'token:{',
    ],
    'xhp_enum_type.xhp_enum_optional' => keyset[
      'missing',
    ],
    'xhp_enum_type.xhp_enum_right_brace' => keyset[
      'token:}',
    ],
    'xhp_enum_type.xhp_enum_values' => keyset[
      'list',
    ],
    'xhp_expression.xhp_body' => keyset[
      'list',
      'missing',
    ],
    'xhp_expression.xhp_close' => keyset[
      'missing',
      'xhp_close',
    ],
    'xhp_expression.xhp_open' => keyset[
      'xhp_open',
    ],
    'xhp_open.xhp_open_attributes' => keyset[
      'list',
      'missing',
    ],
    'xhp_open.xhp_open_left_angle' => keyset[
      'token:<',
    ],
    'xhp_open.xhp_open_name' => keyset[
      'token:XHP_element_name',
    ],
    'xhp_open.xhp_open_right_angle' => keyset[
      'missing',
      'token:/>',
      'token:>',
    ],
    'xhp_required.xhp_required_at' => keyset[
      'token:@',
    ],
    'xhp_required.xhp_required_keyword' => keyset[
      'token:required',
    ],
    'xhp_simple_attribute.xhp_simple_attribute_equal' => keyset[
      'token:=',
    ],
    'xhp_simple_attribute.xhp_simple_attribute_expression' => keyset[
      'braced_expression',
      'token:XHP_string_literal',
    ],
    'xhp_simple_attribute.xhp_simple_attribute_name' => keyset[
      'token:XHP_element_name',
    ],
    'xhp_simple_class_attribute.xhp_simple_class_attribute_type' => keyset[
      'simple_type_specifier',
    ],
    'xhp_spread_attribute.xhp_spread_attribute_expression' => keyset[
      'variable',
      'xhp_expression',
    ],
    'xhp_spread_attribute.xhp_spread_attribute_left_brace' => keyset[
      'token:{',
    ],
    'xhp_spread_attribute.xhp_spread_attribute_right_brace' => keyset[
      'token:}',
    ],
    'xhp_spread_attribute.xhp_spread_attribute_spread_operator' => keyset[
      'token:...',
    ],
    'yield_expression.yield_keyword' => keyset[
      'token:yield',
    ],
    'yield_expression.yield_operand' => keyset[
      'anonymous_function',
      'binary_expression',
      'element_initializer',
      'function_call_expression',
      'lambda_expression',
      'literal',
      'member_selection_expression',
      'missing',
      'object_creation_expression',
      'parenthesized_expression',
      'postfix_unary_expression',
      'prefix_unary_expression',
      'subscript_expression',
      'token:break',
      'token:name',
      'tuple_expression',
      'variable',
    ],
    'yield_from_expression.yield_from_from_keyword' => keyset[
      'token:from',
    ],
    'yield_from_expression.yield_from_operand' => keyset[
      'array_creation_expression',
      'function_call_expression',
      'literal',
      'parenthesized_expression',
      'variable',
    ],
    'yield_from_expression.yield_from_yield_keyword' => keyset[
      'token:yield',
    ],
  ];
