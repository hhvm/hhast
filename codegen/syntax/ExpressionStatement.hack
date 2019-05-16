/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6b32957b6b1d2e5fe0e6cb9756a92939>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ExpressionStatement extends EditableNode implements IStatement {

  const string SYNTAX_KIND = 'expression_statement';

  private EditableNode $_expression;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $expression,
    EditableNode $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['expression_statement_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['expression_statement_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($expression, $semicolon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'expression' => $this->_expression,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $expression = $rewriter($this->_expression, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $expression === $this->_expression && $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($expression, $semicolon);
  }

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($value, $this->_semicolon);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @return AnonymousFunction | AsExpression | BinaryExpression |
   * CastExpression | ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EmptyExpression | EvalExpression |
   * FunctionCallExpression | HaltCompilerExpression | InclusionExpression |
   * InstanceofExpression | IsExpression | IssetExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | null |
   * ObjectCreationExpression | PostfixUnaryExpression | PrefixUnaryExpression
   * | SafeMemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression | XHPExpression | YieldExpression |
   * YieldFromExpression
   */
  <<__Memoize>>
  public function getExpression(): ?IExpression {
    if ($this->_expression->isMissing()) {
      return null;
    }
    return __Private\Wrap\wrap_IExpression($this->_expression);
  }

  /**
   * @return AnonymousFunction | AsExpression | BinaryExpression |
   * CastExpression | ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EmptyExpression | EvalExpression |
   * FunctionCallExpression | HaltCompilerExpression | InclusionExpression |
   * InstanceofExpression | IsExpression | IssetExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression |
   * SafeMemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression | XHPExpression | YieldExpression |
   * YieldFromExpression
   */
  public function getExpressionx(): IExpression {
    return TypeAssert\not_null($this->getExpression());
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_expression, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
