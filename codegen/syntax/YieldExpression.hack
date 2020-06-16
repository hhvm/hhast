/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b30e03e6056cbb999206710b8693ebdb>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class YieldExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'yield_expression';

  private YieldToken $_keyword;
  private ?Node $_operand;

  public function __construct(
    YieldToken $keyword,
    ?Node $operand,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['yield_keyword'],
      $file,
      $offset,
      $source,
      'YieldToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $operand = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['yield_operand'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $operand?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $operand,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'operand' => $this->_operand,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $operand = $this->_operand === null
      ? null
      : $rewriter($this->_operand, $parents);
    if ($keyword === $this->_keyword && $operand === $this->_operand) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $operand,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(YieldToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_operand);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
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

  public function getOperandUNTYPED(): ?Node {
    return $this->_operand;
  }

  public function withOperand(?Node $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasOperand(): bool {
    return $this->_operand !== null;
  }

  /**
   * @return AnonymousFunction | BinaryExpression | ElementInitializer |
   * FunctionCallExpression | LambdaExpression | LiteralExpression |
   * MemberSelectionExpression | null | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | BreakToken | NameToken |
   * TupleExpression | VariableExpression
   */
  public function getOperand(): ?Node {
    return $this->_operand;
  }

  /**
   * @return AnonymousFunction | BinaryExpression | ElementInitializer |
   * FunctionCallExpression | LambdaExpression | LiteralExpression |
   * MemberSelectionExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PostfixUnaryExpression | PrefixUnaryExpression |
   * ScopeResolutionExpression | SubscriptExpression | BreakToken | NameToken |
   * TupleExpression | VariableExpression
   */
  public function getOperandx(): Node {
    return TypeAssert\not_null($this->getOperand());
  }
}
