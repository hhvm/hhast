/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c41a0ed2923f8be72468eab84e3a555a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class YieldFromExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'yield_from_expression';

  private Node $_yield_keyword;
  private Node $_from_keyword;
  private Node $_operand;

  public function __construct(
    Node $yield_keyword,
    Node $from_keyword,
    Node $operand,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $yield_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['yield_from_yield_keyword'],
      $file,
      $offset,
      $source,
      'YieldToken',
    );
    $offset += $yield_keyword->getWidth();
    $from_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['yield_from_from_keyword'],
      $file,
      $offset,
      $source,
      'FromToken',
    );
    $offset += $from_keyword->getWidth();
    $operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['yield_from_operand'],
      $file,
      $offset,
      $source,
      'IExpression',
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'yield_keyword' => $this->_yield_keyword,
      'from_keyword' => $this->_from_keyword,
      'operand' => $this->_operand,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
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

  public function getYieldKeywordUNTYPED(): Node {
    return $this->_yield_keyword;
  }

  public function withYieldKeyword(YieldToken $value): this {
    if ($value === $this->_yield_keyword) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_from_keyword,
      $this->_operand,
    );
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

  public function getFromKeywordUNTYPED(): Node {
    return $this->_from_keyword;
  }

  public function withFromKeyword(FromToken $value): this {
    if ($value === $this->_from_keyword) {
      return $this;
    }
    return new static(
      $this->_yield_keyword,
      $value ?? Missing(),
      $this->_operand,
    );
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

  public function getOperandUNTYPED(): Node {
    return $this->_operand;
  }

  public function withOperand(IExpression $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new static(
      $this->_yield_keyword,
      $this->_from_keyword,
      $value ?? Missing(),
    );
  }

  public function hasOperand(): bool {
    return !$this->_operand->isMissing();
  }

  /**
   * @return ArrayCreationExpression | FunctionCallExpression |
   * LiteralExpression | ParenthesizedExpression | VariableExpression
   */
  public function getOperand(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_operand);
  }

  /**
   * @return ArrayCreationExpression | FunctionCallExpression |
   * LiteralExpression | ParenthesizedExpression | VariableExpression
   */
  public function getOperandx(): IExpression {
    return $this->getOperand();
  }
}
