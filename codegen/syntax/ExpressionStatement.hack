/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<183fc024c2e2add2713bed04996b3474>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ExpressionStatement extends EditableNode {

  private EditableNode $_expression;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $expression,
    EditableNode $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
    parent::__construct('expression_statement', $source_ref);
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
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
   * CastExpression | CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * EmptyExpression | EvalExpression | FunctionCallExpression |
   * HaltCompilerExpression | InclusionExpression | InstanceofExpression |
   * IsExpression | IssetExpression | LambdaExpression | LiteralExpression |
   * MemberSelectionExpression | null | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * QualifiedName | SafeMemberSelectionExpression | ScopeResolutionExpression
   * | SubscriptExpression | RightParenToken | CommaToken | DotDotDotToken |
   * ColonToken | LessThanToken | EqualGreaterThanToken |
   * QuestionGreaterThanToken | ConstToken | ErrorTokenToken | NameToken |
   * UseToken | RightBraceToken | VariableExpression |
   * VarrayIntrinsicExpression | XHPExpression | YieldExpression |
   * YieldFromExpression
   */
  public function getExpression(): ?EditableNode {
    if ($this->_expression->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }

  /**
   * @return AnonymousFunction | AsExpression | BinaryExpression |
   * CastExpression | CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression |
   * EmptyExpression | EvalExpression | FunctionCallExpression |
   * HaltCompilerExpression | InclusionExpression | InstanceofExpression |
   * IsExpression | IssetExpression | LambdaExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * QualifiedName | SafeMemberSelectionExpression | ScopeResolutionExpression
   * | SubscriptExpression | RightParenToken | CommaToken | DotDotDotToken |
   * ColonToken | LessThanToken | EqualGreaterThanToken |
   * QuestionGreaterThanToken | ConstToken | ErrorTokenToken | NameToken |
   * UseToken | RightBraceToken | VariableExpression |
   * VarrayIntrinsicExpression | XHPExpression | YieldExpression |
   * YieldFromExpression
   */
  public function getExpressionx(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
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
   * @return null | SemicolonToken
   */
  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
