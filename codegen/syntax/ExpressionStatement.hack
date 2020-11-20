/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f5fb760cb9145f340a0bff31e14861c2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ExpressionStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'expression_statement';

  private ?IExpression $_expression;
  private SemicolonToken $_semicolon;

  public function __construct(
    ?IExpression $expression,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
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
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['expression_statement_expression'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $expression?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['expression_statement_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $expression,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'expression' => $this->_expression,
      'semicolon' => $this->_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $expression = $this->_expression === null
      ? null
      : $rewriter($this->_expression, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $expression === $this->_expression && $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $expression,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(?IExpression $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($value, $this->_semicolon);
  }

  public function hasExpression(): bool {
    return $this->_expression !== null;
  }

  /**
   * @return AnonymousFunction | AsExpression | BinaryExpression |
   * CastExpression | ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EvalExpression | FunctionCallExpression |
   * InclusionExpression | IsExpression | IssetExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | null |
   * ObjectCreationExpression | PostfixUnaryExpression | PrefixUnaryExpression
   * | SafeMemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression | XHPExpression | YieldExpression
   */
  public function getExpression(): ?IExpression {
    return $this->_expression;
  }

  /**
   * @return AnonymousFunction | AsExpression | BinaryExpression |
   * CastExpression | ConditionalExpression | DarrayIntrinsicExpression |
   * DictionaryIntrinsicExpression | EvalExpression | FunctionCallExpression |
   * InclusionExpression | IsExpression | IssetExpression | LambdaExpression |
   * LiteralExpression | MemberSelectionExpression | ObjectCreationExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression |
   * SafeMemberSelectionExpression | ScopeResolutionExpression |
   * SubscriptExpression | NameToken | VariableExpression |
   * VarrayIntrinsicExpression | XHPExpression | YieldExpression
   */
  public function getExpressionx(): IExpression {
    return TypeAssert\not_null($this->getExpression());
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_expression, $value);
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
