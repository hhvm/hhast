/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b8fca9ad0c8a9654d0f5ab8fcf0f39bf>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class YieldExpression extends EditableNode implements IExpression {

  private EditableNode $_keyword;
  private EditableNode $_operand;

  public function __construct(
    EditableNode $keyword,
    EditableNode $operand,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_operand = $operand;
    parent::__construct('yield_expression', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['yield_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $operand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['yield_operand'],
      $file,
      $offset,
      $source,
    );
    $offset += $operand->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($keyword, $operand, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'operand' => $this->_operand,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $operand = $rewriter($this->_operand, $parents);
    if ($keyword === $this->_keyword && $operand === $this->_operand) {
      return $this;
    }
    return new static($keyword, $operand);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_operand);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return YieldToken
   */
  public function getKeyword(): YieldToken {
    return TypeAssert\instance_of(YieldToken::class, $this->_keyword);
  }

  /**
   * @return YieldToken
   */
  public function getKeywordx(): YieldToken {
    return $this->getKeyword();
  }

  public function getOperandUNTYPED(): EditableNode {
    return $this->_operand;
  }

  public function withOperand(EditableNode $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasOperand(): bool {
    return !$this->_operand->isMissing();
  }

  /**
   * @return AnonymousFunction | ArrayIntrinsicExpression | BinaryExpression |
   * ElementInitializer | FunctionCallExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | null |
   * ObjectCreationExpression | ParenthesizedExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression | ScopeResolutionExpression
   * | SubscriptExpression | BreakToken | NameToken | TupleExpression |
   * VariableExpression
   */
  public function getOperand(): ?EditableNode {
    if ($this->_operand->isMissing()) {
      return null;
    }
    return $this->_operand;
  }

  /**
   * @return AnonymousFunction | ArrayIntrinsicExpression | BinaryExpression |
   * ElementInitializer | FunctionCallExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | BreakToken | NameToken |
   * TupleExpression | VariableExpression
   */
  public function getOperandx(): EditableNode {
    return TypeAssert\not_null($this->getOperand());
  }
}
