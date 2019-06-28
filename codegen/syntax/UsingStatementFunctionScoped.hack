/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<348e2a073efdfc51f2a116242e67ba7d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class UsingStatementFunctionScoped extends Node implements IStatement {

  const string SYNTAX_KIND = 'using_statement_function_scoped';

  private Node $_await_keyword;
  private Node $_using_keyword;
  private Node $_expression;
  private Node $_semicolon;

  public function __construct(
    Node $await_keyword,
    Node $using_keyword,
    Node $expression,
    Node $semicolon,
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
      /* HH_FIXME[4110] */ $json['using_function_await_keyword'],
      $file,
      $offset,
      $source,
      'AwaitToken',
    );
    $offset += $await_keyword->getWidth();
    $using_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_function_using_keyword'],
      $file,
      $offset,
      $source,
      'UsingToken',
    );
    $offset += $using_keyword->getWidth();
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_function_expression'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $expression->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_function_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $await_keyword,
      $using_keyword,
      $expression,
      $semicolon,
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
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $await_keyword = $rewriter($this->_await_keyword, $parents);
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
    return new static($await_keyword, $using_keyword, $expression, $semicolon);
  }

  public function getAwaitKeywordUNTYPED(): Node {
    return $this->_await_keyword;
  }

  public function withAwaitKeyword(?AwaitToken $value): this {
    if ($value === $this->_await_keyword) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_using_keyword,
      $this->_expression,
      $this->_semicolon,
    );
  }

  public function hasAwaitKeyword(): bool {
    return !$this->_await_keyword->isMissing();
  }

  /**
   * @return null | AwaitToken
   */
  public function getAwaitKeyword(): ?AwaitToken {
    if ($this->_await_keyword->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(AwaitToken::class, $this->_await_keyword);
  }

  /**
   * @return AwaitToken
   */
  public function getAwaitKeywordx(): AwaitToken {
    return TypeAssert\not_null($this->getAwaitKeyword());
  }

  public function getUsingKeywordUNTYPED(): Node {
    return $this->_using_keyword;
  }

  public function withUsingKeyword(UsingToken $value): this {
    if ($value === $this->_using_keyword) {
      return $this;
    }
    return new static(
      $this->_await_keyword,
      $value ?? Missing(),
      $this->_expression,
      $this->_semicolon,
    );
  }

  public function hasUsingKeyword(): bool {
    return !$this->_using_keyword->isMissing();
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

  public function getExpressionUNTYPED(): Node {
    return $this->_expression;
  }

  public function withExpression(IExpression $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static(
      $this->_await_keyword,
      $this->_using_keyword,
      $value ?? Missing(),
      $this->_semicolon,
    );
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
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

  public function getSemicolonUNTYPED(): Node {
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
      $value ?? Missing(),
    );
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
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
