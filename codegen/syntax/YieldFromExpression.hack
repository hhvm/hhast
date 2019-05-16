/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<64c01b98eb0e1a3bb0a27ffbcc18f233>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class YieldFromExpression
  extends EditableNode
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'yield_from_expression';

  private EditableNode $_yield_keyword;
  private EditableNode $_from_keyword;
  private EditableNode $_operand;

  public function __construct(
    EditableNode $yield_keyword,
    EditableNode $from_keyword,
    EditableNode $operand,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_yield_keyword = $yield_keyword;
    $this->_from_keyword = $from_keyword;
    $this->_operand = $operand;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($yield_keyword, $from_keyword, $operand, $source_ref);
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $yield_keyword = $rewriter($this->_yield_keyword, $parents);
    $from_keyword = $rewriter($this->_from_keyword, $parents);
    $operand = $rewriter($this->_operand, $parents);
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
   * @return YieldToken
   */
  public function getYieldKeyword(): YieldToken {
    return TypeAssert\instance_of(YieldToken::class, $this->_yield_keyword);
  }

  /**
   * @return YieldToken
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
   * @return FromToken
   */
  public function getFromKeyword(): FromToken {
    return TypeAssert\instance_of(FromToken::class, $this->_from_keyword);
  }

  /**
   * @return FromToken
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
   * @return ArrayCreationExpression | FunctionCallExpression |
   * LiteralExpression | ParenthesizedExpression | VariableExpression
   */
  <<__Memoize>>
  public function getOperand(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_operand);
  }

  /**
   * @return ArrayCreationExpression | FunctionCallExpression |
   * LiteralExpression | ParenthesizedExpression | VariableExpression
   */
  public function getOperandx(): IExpression {
    return $this->getOperand();
  }
}
