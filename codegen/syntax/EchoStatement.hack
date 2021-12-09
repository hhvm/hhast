/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<512bea22bc4609af55ed732b9923be21>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class EchoStatement extends Node implements IStatement {

  const string SYNTAX_KIND = 'echo_statement';

  private EchoToken $_keyword;
  private NodeList<ListItem<IExpression>> $_expressions;
  private SemicolonToken $_semicolon;

  public function __construct(
    EchoToken $keyword,
    NodeList<ListItem<IExpression>> $expressions,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_expressions = $expressions;
    $this->_semicolon = $semicolon;
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
      ($json['echo_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EchoToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $expressions = Node::fromJSON(
      ($json['echo_expressions']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $expressions = $expressions as nonnull;
    $offset += $expressions->getWidth();
    $semicolon = Node::fromJSON(
      ($json['echo_semicolon']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $expressions,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'expressions' => $this->_expressions,
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
    return new static(
      $keyword as EchoToken,
      /* HH_FIXME[4110] NodeList<ListItem<IExpression>> may not be enforceable */ $expressions,
      $semicolon as SemicolonToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(EchoToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_expressions, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return true;
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

  public function getExpressionsUNTYPED(): ?Node {
    return $this->_expressions;
  }

  public function withExpressions(
    NodeList<ListItem<IExpression>> $value,
  ): this {
    if ($value === $this->_expressions) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasExpressions(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<IExpression>> | NodeList<ListItem<CastExpression>> |
   * NodeList<ListItem<ConditionalExpression>> |
   * NodeList<ListItem<EnumClassLabelExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ParenthesizedExpression>> |
   * NodeList<ListItem<PostfixUnaryExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<QualifiedName>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<SubscriptExpression>> | NodeList<ListItem<NameToken>> |
   * NodeList<ListItem<VariableExpression>> | NodeList<ListItem<XHPExpression>>
   */
  public function getExpressions(): NodeList<ListItem<IExpression>> {
    return TypeAssert\instance_of(NodeList::class, $this->_expressions);
  }

  /**
   * @return NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<IExpression>> | NodeList<ListItem<CastExpression>> |
   * NodeList<ListItem<ConditionalExpression>> |
   * NodeList<ListItem<EnumClassLabelExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ParenthesizedExpression>> |
   * NodeList<ListItem<PostfixUnaryExpression>> |
   * NodeList<ListItem<PrefixUnaryExpression>> |
   * NodeList<ListItem<QualifiedName>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<SubscriptExpression>> | NodeList<ListItem<NameToken>> |
   * NodeList<ListItem<VariableExpression>> | NodeList<ListItem<XHPExpression>>
   */
  public function getExpressionsx(): NodeList<ListItem<IExpression>> {
    return $this->getExpressions();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_expressions, $value);
  }

  public function hasSemicolon(): bool {
    return true;
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
