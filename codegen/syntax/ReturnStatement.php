<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<72caba01628f62e7a2e769d369c3cc9c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ReturnStatement extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_expression;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $expression,
    EditableNode $semicolon,
  ) {
    parent::__construct('return_statement');
    $this->_keyword = $keyword;
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['return_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['return_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['return_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new static($keyword, $expression, $semicolon);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'expression' => $this->_expression,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $expression === $this->_expression &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($keyword, $expression, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_expression, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns ReturnToken
   */
  public function getKeyword(): ReturnToken {
    return TypeAssert\instance_of(ReturnToken::class, $this->_keyword);
  }

  /**
   * @returns ReturnToken
   */
  public function getKeywordx(): ReturnToken {
    return $this->getKeyword();
  }

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @returns AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | AwaitableCreationExpression | BinaryExpression
   * | CastExpression | CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression | EvalExpression
   * | FunctionCallExpression | FunctionCallWithTypeArgumentsExpression |
   * InstanceofExpression | IssetExpression | KeysetIntrinsicExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression | Missing
   * | ObjectCreationExpression | ParenthesizedExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression | QualifiedName |
   * SafeMemberSelectionExpression | ScopeResolutionExpression |
   * ShapeExpression | SubscriptExpression | NameToken | TupleExpression |
   * VariableExpression | VarrayIntrinsicExpression | VectorIntrinsicExpression
   * | XHPExpression | YieldFromExpression
   */
  public function getExpression(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }

  /**
   * @returns AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | AwaitableCreationExpression | BinaryExpression
   * | CastExpression | CollectionLiteralExpression | ConditionalExpression |
   * DarrayIntrinsicExpression | DictionaryIntrinsicExpression | EvalExpression
   * | FunctionCallExpression | FunctionCallWithTypeArgumentsExpression |
   * InstanceofExpression | IssetExpression | KeysetIntrinsicExpression |
   * LambdaExpression | LiteralExpression | MemberSelectionExpression | Missing
   * | ObjectCreationExpression | ParenthesizedExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression | QualifiedName |
   * SafeMemberSelectionExpression | ScopeResolutionExpression |
   * ShapeExpression | SubscriptExpression | NameToken | TupleExpression |
   * VariableExpression | VarrayIntrinsicExpression | VectorIntrinsicExpression
   * | XHPExpression | YieldFromExpression
   */
  public function getExpressionx(): EditableNode {
    return $this->getExpression();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_expression, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
