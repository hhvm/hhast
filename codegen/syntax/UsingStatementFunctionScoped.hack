/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0276421e32f5e273b9a92e9584f6d672>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class UsingStatementFunctionScoped extends Node implements IStatement {

  const string SYNTAX_KIND = 'using_statement_function_scoped';

  private ?AwaitToken $_await_keyword;
  private UsingToken $_using_keyword;
  private IExpression $_expression;
  private SemicolonToken $_semicolon;

  public function __construct(
    ?AwaitToken $await_keyword,
    UsingToken $using_keyword,
    IExpression $expression,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_await_keyword = $await_keyword;
    $this->_using_keyword = $using_keyword;
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
    $await_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_function_await_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'AwaitToken',
    );
    $offset += $await_keyword?->getWidth() ?? 0;
    $using_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_function_using_keyword'],
      $file,
      $offset,
      $source,
      'UsingToken',
    );
    $using_keyword = $using_keyword as nonnull;
    $offset += $using_keyword->getWidth();
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_function_expression'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $expression = $expression as nonnull;
    $offset += $expression->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_function_semicolon'],
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
      /* HH_IGNORE_ERROR[4110] */ $await_keyword,
      /* HH_IGNORE_ERROR[4110] */ $using_keyword,
      /* HH_IGNORE_ERROR[4110] */ $expression,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'await_keyword' => $this->_await_keyword,
      'using_keyword' => $this->_using_keyword,
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
    $await_keyword = $this->_await_keyword === null
      ? null
      : $rewriter($this->_await_keyword, $parents);
    $using_keyword = $rewriter($this->_using_keyword, $parents);
    $expression = $rewriter($this->_expression, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $await_keyword === $this->_await_keyword &&
      $using_keyword === $this->_using_keyword &&
      $expression === $this->_expression &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $await_keyword,
      /* HH_FIXME[4110] use `as` */ $using_keyword,
      /* HH_FIXME[4110] use `as` */ $expression,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getAwaitKeywordUNTYPED(): ?Node {
    return $this->_await_keyword;
  }

  public function withAwaitKeyword(?AwaitToken $value): this {
    if ($value === $this->_await_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_using_keyword,
      $this->_expression,
      $this->_semicolon,
    );
  }

  public function hasAwaitKeyword(): bool {
    return $this->_await_keyword !== null;
  }

  /**
   * @return null | AwaitToken
   */
  public function getAwaitKeyword(): ?AwaitToken {
    return $this->_await_keyword;
  }

  /**
   * @return AwaitToken
   */
  public function getAwaitKeywordx(): AwaitToken {
    return TypeAssert\not_null($this->getAwaitKeyword());
  }

  public function getUsingKeywordUNTYPED(): ?Node {
    return $this->_using_keyword;
  }

  public function withUsingKeyword(UsingToken $value): this {
    if ($value === $this->_using_keyword) {
      return $this;
    }
    return new static(
      $this->_await_keyword,
      $value,
      $this->_expression,
      $this->_semicolon,
    );
  }

  public function hasUsingKeyword(): bool {
    return $this->_using_keyword !== null;
  }

  /**
   * @return UsingToken
   */
  public function getUsingKeyword(): UsingToken {
    return TypeAssert\instance_of(UsingToken::class, $this->_using_keyword);
  }

  /**
   * @return UsingToken
   */
  public function getUsingKeywordx(): UsingToken {
    return $this->getUsingKeyword();
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(IExpression $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static(
      $this->_await_keyword,
      $this->_using_keyword,
      $value,
      $this->_semicolon,
    );
  }

  public function hasExpression(): bool {
    return $this->_expression !== null;
  }

  /**
   * @return BinaryExpression | LambdaExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression
   */
  public function getExpression(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_expression);
  }

  /**
   * @return BinaryExpression | LambdaExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression
   */
  public function getExpressionx(): IExpression {
    return $this->getExpression();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_await_keyword,
      $this->_using_keyword,
      $this->_expression,
      $value,
    );
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
