/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<495da4597cdf5cd7940e68966f534ff5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      ($json['yield_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'YieldToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $operand = Node::fromJSON(
      ($json['yield_operand'] ?? dict['kind' => 'missing']) as dict<_, _>,
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
    $operand =
      $this->_operand === null ? null : $rewriter($this->_operand, $parents);
    if ($keyword === $this->_keyword && $operand === $this->_operand) {
      return $this;
    }
    return new static($keyword as YieldToken, $operand as ?Node);
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
    return true;
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
   * MemberSelectionExpression | null | ParenthesizedExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression | ScopeResolutionExpression
   * | SubscriptExpression | NameToken | TupleExpression | VariableExpression
   */
  public function getOperand(): ?Node {
    return $this->_operand;
  }

  /**
   * @return AnonymousFunction | BinaryExpression | ElementInitializer |
   * FunctionCallExpression | LambdaExpression | LiteralExpression |
   * MemberSelectionExpression | ParenthesizedExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression | ScopeResolutionExpression
   * | SubscriptExpression | NameToken | TupleExpression | VariableExpression
   */
  public function getOperandx(): Node {
    return TypeAssert\not_null($this->getOperand());
  }
}
