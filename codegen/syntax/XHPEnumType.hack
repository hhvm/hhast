/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fb3b6fbf9d930f1b9b8ab5178ace8e0f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class XHPEnumType extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'xhp_enum_type';

  private ?TildeToken $_like;
  private EnumToken $_keyword;
  private LeftBraceToken $_left_brace;
  private NodeList<ListItem<LiteralExpression>> $_values;
  private RightBraceToken $_right_brace;

  public function __construct(
    ?TildeToken $like,
    EnumToken $keyword,
    LeftBraceToken $left_brace,
    NodeList<ListItem<LiteralExpression>> $values,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_like = $like;
    $this->_keyword = $keyword;
    $this->_left_brace = $left_brace;
    $this->_values = $values;
    $this->_right_brace = $right_brace;
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
    $like = Node::fromJSON(
      ($json['xhp_enum_like'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'TildeToken',
    );
    $offset += $like?->getWidth() ?? 0;
    $keyword = Node::fromJSON(
      ($json['xhp_enum_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EnumToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_brace = Node::fromJSON(
      ($json['xhp_enum_left_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $values = Node::fromJSON(
      ($json['xhp_enum_values']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<LiteralExpression>>',
    );
    $values = $values as nonnull;
    $offset += $values->getWidth();
    $right_brace = Node::fromJSON(
      ($json['xhp_enum_right_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $right_brace = $right_brace as nonnull;
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $like,
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $values,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'like' => $this->_like,
      'keyword' => $this->_keyword,
      'left_brace' => $this->_left_brace,
      'values' => $this->_values,
      'right_brace' => $this->_right_brace,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $like = $this->_like === null ? null : $rewriter($this->_like, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $values = $rewriter($this->_values, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $like === $this->_like &&
      $keyword === $this->_keyword &&
      $left_brace === $this->_left_brace &&
      $values === $this->_values &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $like as ?TildeToken,
      $keyword as EnumToken,
      $left_brace as LeftBraceToken,
      /* HH_FIXME[4110] NodeList<ListItem<LiteralExpression>> may not be enforceable */ $values,
      $right_brace as RightBraceToken,
    );
  }

  public function getLikeUNTYPED(): ?Node {
    return $this->_like;
  }

  public function withLike(?TildeToken $value): this {
    if ($value === $this->_like) {
      return $this;
    }
    return new static(
      $value,
      $this->_keyword,
      $this->_left_brace,
      $this->_values,
      $this->_right_brace,
    );
  }

  public function hasLike(): bool {
    return $this->_like !== null;
  }

  /**
   * @return null | TildeToken
   */
  public function getLike(): ?TildeToken {
    return $this->_like;
  }

  /**
   * @return TildeToken
   */
  public function getLikex(): TildeToken {
    return TypeAssert\not_null($this->getLike());
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(EnumToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_like,
      $value,
      $this->_left_brace,
      $this->_values,
      $this->_right_brace,
    );
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return EnumToken
   */
  public function getKeyword(): EnumToken {
    return TypeAssert\instance_of(EnumToken::class, $this->_keyword);
  }

  /**
   * @return EnumToken
   */
  public function getKeywordx(): EnumToken {
    return $this->getKeyword();
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_like,
      $this->_keyword,
      $value,
      $this->_values,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return true;
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getValuesUNTYPED(): ?Node {
    return $this->_values;
  }

  public function withValues(
    NodeList<ListItem<LiteralExpression>> $value,
  ): this {
    if ($value === $this->_values) {
      return $this;
    }
    return new static(
      $this->_like,
      $this->_keyword,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasValues(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<LiteralExpression>>
   */
  public function getValues(): NodeList<ListItem<LiteralExpression>> {
    return TypeAssert\instance_of(NodeList::class, $this->_values);
  }

  /**
   * @return NodeList<ListItem<LiteralExpression>>
   */
  public function getValuesx(): NodeList<ListItem<LiteralExpression>> {
    return $this->getValues();
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_like,
      $this->_keyword,
      $this->_left_brace,
      $this->_values,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return true;
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
