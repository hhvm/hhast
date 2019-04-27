/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ba29b47ea3fe31ca623022efef3d1840>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class EchoStatement extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_expressions;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $expressions,
    EditableNode $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_expressions = $expressions;
    $this->_semicolon = $semicolon;
    parent::__construct('echo_statement', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['echo_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $expressions = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['echo_expressions'],
      $file,
      $offset,
      $source,
    );
    $offset += $expressions->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['echo_semicolon'],
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'expressions' => $this->_expressions,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $expressions = $this->_expressions->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $expressions === $this->_expressions &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($keyword, $expressions, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
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

  public function getExpressionsUNTYPED(): EditableNode {
    return $this->_expressions;
  }

  public function withExpressions(EditableNode $value): this {
    if ($value === $this->_expressions) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasExpressions(): bool {
    return !$this->_expressions->isMissing();
  }

  /**
   * @return EditableList<EditableNode> | EditableList<BinaryExpression> |
   * EditableList<CastExpression> | EditableList<ConditionalExpression> |
   * EditableList<EmptyExpression> | EditableList<FunctionCallExpression> |
   * EditableList<IssetExpression> | EditableList<LiteralExpression> |
   * EditableList<MemberSelectionExpression> | EditableList<?EditableNode> |
   * EditableList<ObjectCreationExpression> |
   * EditableList<ParenthesizedExpression> |
   * EditableList<PipeVariableExpression> |
   * EditableList<PostfixUnaryExpression> | EditableList<PrefixUnaryExpression>
   * | EditableList<QualifiedName> | EditableList<ScopeResolutionExpression> |
   * EditableList<SubscriptExpression> | EditableList<NameToken> |
   * EditableList<VariableExpression> | EditableList<XHPExpression>
   */
  public function getExpressions(): EditableList<?EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_expressions);
  }

  /**
   * @return EditableList<EditableNode> | EditableList<BinaryExpression> |
   * EditableList<CastExpression> | EditableList<ConditionalExpression> |
   * EditableList<EmptyExpression> | EditableList<FunctionCallExpression> |
   * EditableList<IssetExpression> | EditableList<LiteralExpression> |
   * EditableList<MemberSelectionExpression> | EditableList<?EditableNode> |
   * EditableList<ObjectCreationExpression> |
   * EditableList<ParenthesizedExpression> |
   * EditableList<PipeVariableExpression> |
   * EditableList<PostfixUnaryExpression> | EditableList<PrefixUnaryExpression>
   * | EditableList<QualifiedName> | EditableList<ScopeResolutionExpression> |
   * EditableList<SubscriptExpression> | EditableList<NameToken> |
   * EditableList<VariableExpression> | EditableList<XHPExpression>
   */
  public function getExpressionsx(): EditableList<?EditableNode> {
    return $this->getExpressions();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_expressions, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @return null | SemicolonToken
   */
  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
