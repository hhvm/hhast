/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f912ef90d54f7aa0e03762d0c4ce4c3e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class EchoStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'echo_statement';

  private Node $_keyword;
  private Node $_expressions;
  private Node $_semicolon;

  public function __construct(
    Node $keyword,
    Node $expressions,
    Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_expressions = $expressions;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['echo_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $expressions = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['echo_expressions'],
      $file,
      $offset,
      $source,
    );
    $offset += $expressions->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['echo_semicolon'],
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
    return new static($keyword, $expressions, $semicolon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'expressions' => $this->_expressions,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $expressions = $rewriter($this->_expressions, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $expressions === $this->_expressions &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($keyword, $expressions, $semicolon);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_expressions, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return EchoToken
   */
  public function getKeyword(): EchoToken {
    return TypeAssert\instance_of(EchoToken::class, $this->_keyword);
  }

  /**
   * @return EchoToken
   */
  public function getKeywordx(): EchoToken {
    return $this->getKeyword();
  }

  public function getExpressionsUNTYPED(): Node {
    return $this->_expressions;
  }

  public function withExpressions(Node $value): this {
    if ($value === $this->_expressions) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasExpressions(): bool {
    return !$this->_expressions->isMissing();
  }

  /**
   * @return NodeList<IExpression> | NodeList<BinaryExpression> |
   * NodeList<CastExpression> | NodeList<ConditionalExpression> |
   * NodeList<FunctionCallExpression> | NodeList<IssetExpression> |
   * NodeList<LiteralExpression> | NodeList<MemberSelectionExpression> |
   * NodeList<ObjectCreationExpression> | NodeList<ParenthesizedExpression> |
   * NodeList<PostfixUnaryExpression> | NodeList<PrefixUnaryExpression> |
   * NodeList<QualifiedName> | NodeList<ScopeResolutionExpression> |
   * NodeList<SubscriptExpression> | NodeList<NameToken> |
   * NodeList<VariableExpression> | NodeList<XHPExpression>
   */
  public function getExpressions(): NodeList<IExpression> {
    return TypeAssert\instance_of(NodeList::class, $this->_expressions);
  }

  /**
   * @return NodeList<IExpression> | NodeList<BinaryExpression> |
   * NodeList<CastExpression> | NodeList<ConditionalExpression> |
   * NodeList<FunctionCallExpression> | NodeList<IssetExpression> |
   * NodeList<LiteralExpression> | NodeList<MemberSelectionExpression> |
   * NodeList<ObjectCreationExpression> | NodeList<ParenthesizedExpression> |
   * NodeList<PostfixUnaryExpression> | NodeList<PrefixUnaryExpression> |
   * NodeList<QualifiedName> | NodeList<ScopeResolutionExpression> |
   * NodeList<SubscriptExpression> | NodeList<NameToken> |
   * NodeList<VariableExpression> | NodeList<XHPExpression>
   */
  public function getExpressionsx(): NodeList<IExpression> {
    return $this->getExpressions();
  }

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_expressions, $value);
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
