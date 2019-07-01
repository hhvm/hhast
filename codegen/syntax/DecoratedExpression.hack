/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<586d7b8e1f4e8a8fad6bf6ea820231c7>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class DecoratedExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'decorated_expression';

  private Node $_decorator;
  private Node $_expression;

  public function __construct(
    Node $decorator,
    Node $expression,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_decorator = $decorator;
    $this->_expression = $expression;
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
    $decorator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['decorated_expression_decorator'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $decorator->getWidth();
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['decorated_expression_expression'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $expression->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($decorator, $expression, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'decorator' => $this->_decorator,
      'expression' => $this->_expression,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
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
    return new static($decorator, $expression);
  }

  public function getDecoratorUNTYPED(): Node {
    return $this->_decorator;
  }

  public function withDecorator(Node $value): this {
    if ($value === $this->_decorator) {
      return $this;
    }
    return new static($value, $this->_expression);
  }

  public function hasDecorator(): bool {
    return !$this->_decorator->isMissing();
  }

  /**
   * @return AmpersandToken | DotDotDotToken | InoutToken
   */
  public function getDecorator(): Token {
    return TypeAssert\instance_of(Token::class, $this->_decorator);
  }

  /**
   * @return AmpersandToken | DotDotDotToken | InoutToken
   */
  public function getDecoratorx(): Token {
    return $this->getDecorator();
  }

  public function getExpressionUNTYPED(): Node {
    return $this->_expression;
  }

  public function withExpression(Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_decorator, $value);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * FunctionCallExpression | ScopeResolutionExpression | SubscriptExpression |
   * VariableToken | VariableExpression
   */
  public function getExpression(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_expression);
  }

  /**
   * @return ArrayCreationExpression | ArrayIntrinsicExpression |
   * FunctionCallExpression | ScopeResolutionExpression | SubscriptExpression |
   * VariableToken | VariableExpression
   */
  public function getExpressionx(): IExpression {
    return $this->getExpression();
  }
}
