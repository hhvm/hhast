<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6810c80ae1cc0ed52bb8b0acf280827a>>
 */
namespace Facebook\HHAST\__Private;
use namespace Facebook\HHAST;

function editable_token_from_data(
  string $token_kind,
  HHAST\EditableSyntax $leading,
  HHAST\EditableSyntax $trailing,
  string $token_text,
): HHAST\EditableToken {
  switch ($token_kind) {
    case 'end_of_file':
      return new HHAST\EndOfFileToken($leading, $trailing);
    case 'abstract':
      return new HHAST\AbstractToken($leading, $trailing);
    case 'and':
      return new HHAST\AndToken($leading, $trailing);
    case 'array':
      return new HHAST\ArrayToken($leading, $trailing);
    case 'arraykey':
      return new HHAST\ArraykeyToken($leading, $trailing);
    case 'as':
      return new HHAST\AsToken($leading, $trailing);
    case 'async':
      return new HHAST\AsyncToken($leading, $trailing);
    case 'attribute':
      return new HHAST\AttributeToken($leading, $trailing);
    case 'await':
      return new HHAST\AwaitToken($leading, $trailing);
    case 'bool':
      return new HHAST\BoolToken($leading, $trailing);
    case 'break':
      return new HHAST\BreakToken($leading, $trailing);
    case 'case':
      return new HHAST\CaseToken($leading, $trailing);
    case 'catch':
      return new HHAST\CatchToken($leading, $trailing);
    case 'category':
      return new HHAST\CategoryToken($leading, $trailing);
    case 'children':
      return new HHAST\ChildrenToken($leading, $trailing);
    case 'class':
      return new HHAST\ClassToken($leading, $trailing);
    case 'classname':
      return new HHAST\ClassnameToken($leading, $trailing);
    case 'clone':
      return new HHAST\CloneToken($leading, $trailing);
    case 'const':
      return new HHAST\ConstToken($leading, $trailing);
    case 'construct':
      return new HHAST\ConstructToken($leading, $trailing);
    case 'continue':
      return new HHAST\ContinueToken($leading, $trailing);
    case 'coroutine':
      return new HHAST\CoroutineToken($leading, $trailing);
    case 'darray':
      return new HHAST\DarrayToken($leading, $trailing);
    case 'default':
      return new HHAST\DefaultToken($leading, $trailing);
    case 'define':
      return new HHAST\DefineToken($leading, $trailing);
    case 'destruct':
      return new HHAST\DestructToken($leading, $trailing);
    case 'dict':
      return new HHAST\DictToken($leading, $trailing);
    case 'do':
      return new HHAST\DoToken($leading, $trailing);
    case 'double':
      return new HHAST\DoubleToken($leading, $trailing);
    case 'echo':
      return new HHAST\EchoToken($leading, $trailing);
    case 'else':
      return new HHAST\ElseToken($leading, $trailing);
    case 'elseif':
      return new HHAST\ElseifToken($leading, $trailing);
    case 'empty':
      return new HHAST\EmptyToken($leading, $trailing);
    case 'enum':
      return new HHAST\EnumToken($leading, $trailing);
    case 'eval':
      return new HHAST\EvalToken($leading, $trailing);
    case 'extends':
      return new HHAST\ExtendsToken($leading, $trailing);
    case 'fallthrough':
      return new HHAST\FallthroughToken($leading, $trailing);
    case 'float':
      return new HHAST\FloatToken($leading, $trailing);
    case 'final':
      return new HHAST\FinalToken($leading, $trailing);
    case 'finally':
      return new HHAST\FinallyToken($leading, $trailing);
    case 'for':
      return new HHAST\ForToken($leading, $trailing);
    case 'foreach':
      return new HHAST\ForeachToken($leading, $trailing);
    case 'function':
      return new HHAST\FunctionToken($leading, $trailing);
    case 'global':
      return new HHAST\GlobalToken($leading, $trailing);
    case 'goto':
      return new HHAST\GotoToken($leading, $trailing);
    case 'if':
      return new HHAST\IfToken($leading, $trailing);
    case 'implements':
      return new HHAST\ImplementsToken($leading, $trailing);
    case 'include':
      return new HHAST\IncludeToken($leading, $trailing);
    case 'include_once':
      return new HHAST\Include_onceToken($leading, $trailing);
    case 'instanceof':
      return new HHAST\InstanceofToken($leading, $trailing);
    case 'insteadof':
      return new HHAST\InsteadofToken($leading, $trailing);
    case 'int':
      return new HHAST\IntToken($leading, $trailing);
    case 'interface':
      return new HHAST\InterfaceToken($leading, $trailing);
    case 'isset':
      return new HHAST\IssetToken($leading, $trailing);
    case 'keyset':
      return new HHAST\KeysetToken($leading, $trailing);
    case 'list':
      return new HHAST\ListToken($leading, $trailing);
    case 'mixed':
      return new HHAST\MixedToken($leading, $trailing);
    case 'namespace':
      return new HHAST\NamespaceToken($leading, $trailing);
    case 'new':
      return new HHAST\NewToken($leading, $trailing);
    case 'newtype':
      return new HHAST\NewtypeToken($leading, $trailing);
    case 'noreturn':
      return new HHAST\NoreturnToken($leading, $trailing);
    case 'num':
      return new HHAST\NumToken($leading, $trailing);
    case 'object':
      return new HHAST\ObjectToken($leading, $trailing);
    case 'or':
      return new HHAST\OrToken($leading, $trailing);
    case 'parent':
      return new HHAST\ParentToken($leading, $trailing);
    case 'print':
      return new HHAST\PrintToken($leading, $trailing);
    case 'private':
      return new HHAST\PrivateToken($leading, $trailing);
    case 'protected':
      return new HHAST\ProtectedToken($leading, $trailing);
    case 'public':
      return new HHAST\PublicToken($leading, $trailing);
    case 'require':
      return new HHAST\RequireToken($leading, $trailing);
    case 'require_once':
      return new HHAST\Require_onceToken($leading, $trailing);
    case 'required':
      return new HHAST\RequiredToken($leading, $trailing);
    case 'resource':
      return new HHAST\ResourceToken($leading, $trailing);
    case 'return':
      return new HHAST\ReturnToken($leading, $trailing);
    case 'self':
      return new HHAST\SelfToken($leading, $trailing);
    case 'shape':
      return new HHAST\ShapeToken($leading, $trailing);
    case 'static':
      return new HHAST\StaticToken($leading, $trailing);
    case 'string':
      return new HHAST\StringToken($leading, $trailing);
    case 'super':
      return new HHAST\SuperToken($leading, $trailing);
    case 'suspend':
      return new HHAST\SuspendToken($leading, $trailing);
    case 'switch':
      return new HHAST\SwitchToken($leading, $trailing);
    case 'this':
      return new HHAST\ThisToken($leading, $trailing);
    case 'throw':
      return new HHAST\ThrowToken($leading, $trailing);
    case 'trait':
      return new HHAST\TraitToken($leading, $trailing);
    case 'try':
      return new HHAST\TryToken($leading, $trailing);
    case 'tuple':
      return new HHAST\TupleToken($leading, $trailing);
    case 'type':
      return new HHAST\TypeToken($leading, $trailing);
    case 'unset':
      return new HHAST\UnsetToken($leading, $trailing);
    case 'use':
      return new HHAST\UseToken($leading, $trailing);
    case 'var':
      return new HHAST\VarToken($leading, $trailing);
    case 'varray':
      return new HHAST\VarrayToken($leading, $trailing);
    case 'vec':
      return new HHAST\VecToken($leading, $trailing);
    case 'void':
      return new HHAST\VoidToken($leading, $trailing);
    case 'where':
      return new HHAST\WhereToken($leading, $trailing);
    case 'while':
      return new HHAST\WhileToken($leading, $trailing);
    case 'xor':
      return new HHAST\XorToken($leading, $trailing);
    case 'yield':
      return new HHAST\YieldToken($leading, $trailing);
    case 'left_bracket':
      return new HHAST\LeftBracketToken($leading, $trailing);
    case 'right_bracket':
      return new HHAST\RightBracketToken($leading, $trailing);
    case 'left_paren':
      return new HHAST\LeftParenToken($leading, $trailing);
    case 'right_paren':
      return new HHAST\RightParenToken($leading, $trailing);
    case 'left_brace':
      return new HHAST\LeftBraceToken($leading, $trailing);
    case 'right_brace':
      return new HHAST\RightBraceToken($leading, $trailing);
    case 'dot':
      return new HHAST\DotToken($leading, $trailing);
    case 'minus_greater_than':
      return new HHAST\MinusGreaterThanToken($leading, $trailing);
    case 'plus_plus':
      return new HHAST\PlusPlusToken($leading, $trailing);
    case 'minus_minus':
      return new HHAST\MinusMinusToken($leading, $trailing);
    case 'star_star':
      return new HHAST\StarStarToken($leading, $trailing);
    case 'star':
      return new HHAST\StarToken($leading, $trailing);
    case 'plus':
      return new HHAST\PlusToken($leading, $trailing);
    case 'minus':
      return new HHAST\MinusToken($leading, $trailing);
    case 'tilde':
      return new HHAST\TildeToken($leading, $trailing);
    case 'exclamation':
      return new HHAST\ExclamationToken($leading, $trailing);
    case 'dollar':
      return new HHAST\DollarToken($leading, $trailing);
    case 'slash':
      return new HHAST\SlashToken($leading, $trailing);
    case 'percent':
      return new HHAST\PercentToken($leading, $trailing);
    case 'less_than_greater_than':
      return new HHAST\LessThanGreaterThanToken($leading, $trailing);
    case 'less_than_equal_greater_than':
      return new HHAST\LessThanEqualGreaterThanToken($leading, $trailing);
    case 'less_than_less_than':
      return new HHAST\LessThanLessThanToken($leading, $trailing);
    case 'greater_than_greater_than':
      return new HHAST\GreaterThanGreaterThanToken($leading, $trailing);
    case 'less_than':
      return new HHAST\LessThanToken($leading, $trailing);
    case 'greater_than':
      return new HHAST\GreaterThanToken($leading, $trailing);
    case 'less_than_equal':
      return new HHAST\LessThanEqualToken($leading, $trailing);
    case 'greater_than_equal':
      return new HHAST\GreaterThanEqualToken($leading, $trailing);
    case 'equal_equal':
      return new HHAST\EqualEqualToken($leading, $trailing);
    case 'equal_equal_equal':
      return new HHAST\EqualEqualEqualToken($leading, $trailing);
    case 'exclamation_equal':
      return new HHAST\ExclamationEqualToken($leading, $trailing);
    case 'exclamation_equal_equal':
      return new HHAST\ExclamationEqualEqualToken($leading, $trailing);
    case 'carat':
      return new HHAST\CaratToken($leading, $trailing);
    case 'bar':
      return new HHAST\BarToken($leading, $trailing);
    case 'ampersand':
      return new HHAST\AmpersandToken($leading, $trailing);
    case 'ampersand_ampersand':
      return new HHAST\AmpersandAmpersandToken($leading, $trailing);
    case 'bar_bar':
      return new HHAST\BarBarToken($leading, $trailing);
    case 'question':
      return new HHAST\QuestionToken($leading, $trailing);
    case 'question_question':
      return new HHAST\QuestionQuestionToken($leading, $trailing);
    case 'colon':
      return new HHAST\ColonToken($leading, $trailing);
    case 'semicolon':
      return new HHAST\SemicolonToken($leading, $trailing);
    case 'equal':
      return new HHAST\EqualToken($leading, $trailing);
    case 'star_star_equal':
      return new HHAST\StarStarEqualToken($leading, $trailing);
    case 'star_equal':
      return new HHAST\StarEqualToken($leading, $trailing);
    case 'slash_equal':
      return new HHAST\SlashEqualToken($leading, $trailing);
    case 'percent_equal':
      return new HHAST\PercentEqualToken($leading, $trailing);
    case 'plus_equal':
      return new HHAST\PlusEqualToken($leading, $trailing);
    case 'minus_equal':
      return new HHAST\MinusEqualToken($leading, $trailing);
    case 'dot_equal':
      return new HHAST\DotEqualToken($leading, $trailing);
    case 'less_than_less_than_equal':
      return new HHAST\LessThanLessThanEqualToken($leading, $trailing);
    case 'greater_than_greater_than_equal':
      return new HHAST\GreaterThanGreaterThanEqualToken($leading, $trailing);
    case 'ampersand_equal':
      return new HHAST\AmpersandEqualToken($leading, $trailing);
    case 'carat_equal':
      return new HHAST\CaratEqualToken($leading, $trailing);
    case 'bar_equal':
      return new HHAST\BarEqualToken($leading, $trailing);
    case 'comma':
      return new HHAST\CommaToken($leading, $trailing);
    case 'at':
      return new HHAST\AtToken($leading, $trailing);
    case 'colon_colon':
      return new HHAST\ColonColonToken($leading, $trailing);
    case 'equal_greater_than':
      return new HHAST\EqualGreaterThanToken($leading, $trailing);
    case 'equal_equal_greater_than':
      return new HHAST\EqualEqualGreaterThanToken($leading, $trailing);
    case 'question_minus_greater_than':
      return new HHAST\QuestionMinusGreaterThanToken($leading, $trailing);
    case 'dot_dot_dot':
      return new HHAST\DotDotDotToken($leading, $trailing);
    case 'dollar_dollar':
      return new HHAST\DollarDollarToken($leading, $trailing);
    case 'bar_greater_than':
      return new HHAST\BarGreaterThanToken($leading, $trailing);
    case 'null_literal':
      return new HHAST\NullLiteralToken($leading, $trailing);
    case 'slash_greater_than':
      return new HHAST\SlashGreaterThanToken($leading, $trailing);
    case 'less_than_slash':
      return new HHAST\LessThanSlashToken($leading, $trailing);
    case 'less_than_question':
      return new HHAST\LessThanQuestionToken($leading, $trailing);
    case 'question_greater_than':
      return new HHAST\QuestionGreaterThanToken($leading, $trailing);
    case 'error_token':
      return new HHAST\ErrorTokenToken($leading, $trailing, $token_text);
    case 'name':
      return new HHAST\NameToken($leading, $trailing, $token_text);
    case 'qualified_name':
      return new HHAST\QualifiedNameToken($leading, $trailing, $token_text);
    case 'variable':
      return new HHAST\VariableToken($leading, $trailing, $token_text);
    case 'namespace_prefix':
      return new HHAST\NamespacePrefixToken($leading, $trailing, $token_text);
    case 'decimal_literal':
      return new HHAST\DecimalLiteralToken($leading, $trailing, $token_text);
    case 'octal_literal':
      return new HHAST\OctalLiteralToken($leading, $trailing, $token_text);
    case 'hexadecimal_literal':
      return new HHAST\HexadecimalLiteralToken($leading, $trailing, $token_text);
    case 'binary_literal':
      return new HHAST\BinaryLiteralToken($leading, $trailing, $token_text);
    case 'floating_literal':
      return new HHAST\FloatingLiteralToken($leading, $trailing, $token_text);
    case 'execution_string':
      return new HHAST\ExecutionStringToken($leading, $trailing, $token_text);
    case 'single_quoted_string_literal':
      return new HHAST\SingleQuotedStringLiteralToken($leading, $trailing, $token_text);
    case 'double_quoted_string_literal':
      return new HHAST\DoubleQuotedStringLiteralToken($leading, $trailing, $token_text);
    case 'double_quoted_string_literal_head':
      return new HHAST\DoubleQuotedStringLiteralHeadToken($leading, $trailing, $token_text);
    case 'string_literal_body':
      return new HHAST\StringLiteralBodyToken($leading, $trailing, $token_text);
    case 'double_quoted_string_literal_tail':
      return new HHAST\DoubleQuotedStringLiteralTailToken($leading, $trailing, $token_text);
    case 'heredoc_string_literal':
      return new HHAST\HeredocStringLiteralToken($leading, $trailing, $token_text);
    case 'heredoc_string_literal_head':
      return new HHAST\HeredocStringLiteralHeadToken($leading, $trailing, $token_text);
    case 'heredoc_string_literal_tail':
      return new HHAST\HeredocStringLiteralTailToken($leading, $trailing, $token_text);
    case 'nowdoc_string_literal':
      return new HHAST\NowdocStringLiteralToken($leading, $trailing, $token_text);
    case 'boolean_literal':
      return new HHAST\BooleanLiteralToken($leading, $trailing, $token_text);
    case 'XHP_category_name':
      return new HHAST\XHPCategoryNameToken($leading, $trailing, $token_text);
    case 'XHP_element_name':
      return new HHAST\XHPElementNameToken($leading, $trailing, $token_text);
    case 'XHP_class_name':
      return new HHAST\XHPClassNameToken($leading, $trailing, $token_text);
    case 'XHP_string_literal':
      return new HHAST\XHPStringLiteralToken($leading, $trailing, $token_text);
    case 'XHP_body':
      return new HHAST\XHPBodyToken($leading, $trailing, $token_text);
    case 'XHP_comment':
      return new HHAST\XHPCommentToken($leading, $trailing, $token_text);
    case 'markup':
      return new HHAST\MarkupToken($leading, $trailing, $token_text);
    default:
      throw new \Exception('unexpected token kind: '.$token_kind);
  }
}
