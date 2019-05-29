/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6be609978c4644de520955a43f28f6f9>>
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
  ): this {
    $offset = $initial_offset;
    $await_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_function_await_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $await_keyword->getWidth();
    $using_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_function_using_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $using_keyword->getWidth();
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_function_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['using_function_semicolon'],
      $file,
      $offset,
      $source,
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

  public function withAwaitKeyword(Node $value): this {
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

  public function withUsingKeyword(Node $value): this {
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

  public function withExpression(Node $value): this {
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
    return !$this->_expression->isMissing();
  }

  /**
   * @return BinaryExpression | LambdaExpression | ObjectCreationExpression |
   * ParenthesizedExpression | PrefixUnaryExpression
   */
  <<__Memoize>>
  public function getExpression(): IExpression {
    return __Private\Wrap\wrap_IExpression($this->_expression);
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

  public function withSemicolon(Node $value): this {
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
