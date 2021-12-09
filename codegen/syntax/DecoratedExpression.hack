/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<06fb91fe5add4ec33b22a0175ea83cab>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class DecoratedExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'decorated_expression';

  private Token $_decorator;
  private IExpression $_expression;

  public function __construct(
    Token $decorator,
    IExpression $expression,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_decorator = $decorator;
    $this->_expression = $expression;
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
    $decorator = Node::fromJSON(
      ($json['decorated_expression_decorator']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Token',
    );
    $decorator = $decorator as nonnull;
    $offset += $decorator->getWidth();
    $expression = Node::fromJSON(
      ($json['decorated_expression_expression']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $expression = $expression as nonnull;
    $offset += $expression->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $decorator,
      /* HH_IGNORE_ERROR[4110] */ $expression,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'decorator' => $this->_decorator,
      'expression' => $this->_expression,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $decorator = $rewriter($this->_decorator, $parents);
    $expression = $rewriter($this->_expression, $parents);
    if (
      $decorator === $this->_decorator && $expression === $this->_expression
    ) {
      return $this;
    }
    return new static($decorator as Token, $expression as IExpression);
  }

  public function getDecoratorUNTYPED(): ?Node {
    return $this->_decorator;
  }

  public function withDecorator(Token $value): this {
    if ($value === $this->_decorator) {
      return $this;
    }
    return new static($value, $this->_expression);
  }

  public function hasDecorator(): bool {
    return true;
  }

  /**
   * @return DotDotDotToken | InoutToken
   */
  public function getDecorator(): Token {
    return TypeAssert\instance_of(Token::class, $this->_decorator);
  }

  /**
   * @return DotDotDotToken | InoutToken
   */
  public function getDecoratorx(): Token {
    return $this->getDecorator();
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(IExpression $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_decorator, $value);
  }

  public function hasExpression(): bool {
    return true;
  }

  /**
   * @return FunctionCallExpression | ScopeResolutionExpression |
   * SubscriptExpression | VariableToken | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getExpression(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_expression);
  }

  /**
   * @return FunctionCallExpression | ScopeResolutionExpression |
   * SubscriptExpression | VariableToken | VariableExpression |
   * VarrayIntrinsicExpression | VectorIntrinsicExpression
   */
  public function getExpressionx(): IExpression {
    return $this->getExpression();
  }
}
