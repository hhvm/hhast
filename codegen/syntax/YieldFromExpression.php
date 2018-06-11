<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<00647d20bf77b9010554b131680a31a1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class YieldFromExpression extends EditableNode {

  private EditableNode $_yield_keyword;
  private EditableNode $_from_keyword;
  private EditableNode $_operand;

  public function __construct(
    EditableNode $yield_keyword,
    EditableNode $from_keyword,
    EditableNode $operand,
  ) {
    parent::__construct('yield_from_expression');
    $this->_yield_keyword = $yield_keyword;
    $this->_from_keyword = $from_keyword;
    $this->_operand = $operand;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $yield_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['yield_from_yield_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $yield_keyword->getWidth();
    $from_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['yield_from_from_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $from_keyword->getWidth();
    $operand = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['yield_from_operand'],
      $file,
      $offset,
      $source,
    );
    $offset += $operand->getWidth();
    return new static($yield_keyword, $from_keyword, $operand);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'yield_keyword' => $this->_yield_keyword,
      'from_keyword' => $this->_from_keyword,
      'operand' => $this->_operand,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $yield_keyword = $this->_yield_keyword->rewrite($rewriter, $parents);
    $from_keyword = $this->_from_keyword->rewrite($rewriter, $parents);
    $operand = $this->_operand->rewrite($rewriter, $parents);
    if (
      $yield_keyword === $this->_yield_keyword &&
      $from_keyword === $this->_from_keyword &&
      $operand === $this->_operand
    ) {
      return $this;
    }
    return new static($yield_keyword, $from_keyword, $operand);
  }

  public function getYieldKeywordUNTYPED(): EditableNode {
    return $this->_yield_keyword;
  }

  public function withYieldKeyword(EditableNode $value): this {
    if ($value === $this->_yield_keyword) {
      return $this;
    }
    return new static($value, $this->_from_keyword, $this->_operand);
  }

  public function hasYieldKeyword(): bool {
    return !$this->_yield_keyword->isMissing();
  }

  /**
   * @returns YieldToken
   */
  public function getYieldKeyword(): YieldToken {
    return TypeAssert\instance_of(YieldToken::class, $this->_yield_keyword);
  }

  /**
   * @returns YieldToken
   */
  public function getYieldKeywordx(): YieldToken {
    return $this->getYieldKeyword();
  }

  public function getFromKeywordUNTYPED(): EditableNode {
    return $this->_from_keyword;
  }

  public function withFromKeyword(EditableNode $value): this {
    if ($value === $this->_from_keyword) {
      return $this;
    }
    return new static($this->_yield_keyword, $value, $this->_operand);
  }

  public function hasFromKeyword(): bool {
    return !$this->_from_keyword->isMissing();
  }

  /**
   * @returns FromToken
   */
  public function getFromKeyword(): FromToken {
    return TypeAssert\instance_of(FromToken::class, $this->_from_keyword);
  }

  /**
   * @returns FromToken
   */
  public function getFromKeywordx(): FromToken {
    return $this->getFromKeyword();
  }

  public function getOperandUNTYPED(): EditableNode {
    return $this->_operand;
  }

  public function withOperand(EditableNode $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new static($this->_yield_keyword, $this->_from_keyword, $value);
  }

  public function hasOperand(): bool {
    return !$this->_operand->isMissing();
  }

  /**
   * @returns ArrayCreationExpression | FunctionCallExpression |
   * LiteralExpression | ParenthesizedExpression | VariableExpression
   */
  public function getOperand(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_operand);
  }

  /**
   * @returns ArrayCreationExpression | FunctionCallExpression |
   * LiteralExpression | ParenthesizedExpression | VariableExpression
   */
  public function getOperandx(): EditableNode {
    return $this->getOperand();
  }
}
