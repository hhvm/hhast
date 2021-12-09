/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<76fe66240618fb18aa4c5590f281ef51>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class XHPChildrenDeclaration
  extends Node
  implements IClassBodyDeclaration, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'xhp_children_declaration';

  private ChildrenToken $_keyword;
  private Node $_expression;
  private SemicolonToken $_semicolon;

  public function __construct(
    ChildrenToken $keyword,
    Node $expression,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_expression = $expression;
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
      ($json['xhp_children_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ChildrenToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $expression = Node::fromJSON(
      ($json['xhp_children_expression']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $expression = $expression as nonnull;
    $offset += $expression->getWidth();
    $semicolon = Node::fromJSON(
      ($json['xhp_children_semicolon']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $expression,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
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
    $keyword = $rewriter($this->_keyword, $parents);
    $expression = $rewriter($this->_expression, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $expression === $this->_expression &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $keyword as ChildrenToken,
      $expression as Node,
      $semicolon as SemicolonToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ChildrenToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_expression, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return ChildrenToken
   */
  public function getKeyword(): ChildrenToken {
    return TypeAssert\instance_of(ChildrenToken::class, $this->_keyword);
  }

  /**
   * @return ChildrenToken
   */
  public function getKeywordx(): ChildrenToken {
    return $this->getKeyword();
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasExpression(): bool {
    return true;
  }

  /**
   * @return EmptyToken | XHPChildrenParenthesizedList
   */
  public function getExpression(): Node {
    return $this->_expression;
  }

  /**
   * @return EmptyToken | XHPChildrenParenthesizedList
   */
  public function getExpressionx(): Node {
    return $this->getExpression();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_expression, $value);
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
