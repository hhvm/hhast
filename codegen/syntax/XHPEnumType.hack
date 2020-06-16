/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<00d5d2eed9fc63e982508618460ef1c6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class XHPEnumType extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'xhp_enum_type';

  private ?Node $_optional;
  private EnumToken $_keyword;
  private LeftBraceToken $_left_brace;
  private NodeList<ListItem<LiteralExpression>> $_values;
  private RightBraceToken $_right_brace;

  public function __construct(
    ?Node $optional,
    EnumToken $keyword,
    LeftBraceToken $left_brace,
    NodeList<ListItem<LiteralExpression>> $values,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_optional = $optional;
    $this->_keyword = $keyword;
    $this->_left_brace = $left_brace;
    $this->_values = $values;
    $this->_right_brace = $right_brace;
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
    $optional = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_enum_optional'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $optional?->getWidth() ?? 0;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_enum_keyword'],
      $file,
      $offset,
      $source,
      'EnumToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_enum_left_brace'],
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $values = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_enum_values'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<LiteralExpression>>',
    );
    $values = $values as nonnull;
    $offset += $values->getWidth();
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_enum_right_brace'],
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
      /* HH_IGNORE_ERROR[4110] */ $optional,
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
      'optional' => $this->_optional,
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
    $optional = $this->_optional === null
      ? null
      : $rewriter($this->_optional, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $values = $rewriter($this->_values, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $optional === $this->_optional &&
      $keyword === $this->_keyword &&
      $left_brace === $this->_left_brace &&
      $values === $this->_values &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $optional,
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_brace,
      /* HH_FIXME[4110] use `as` */ $values,
      /* HH_FIXME[4110] use `as` */ $right_brace,
    );
  }

  public function getOptionalUNTYPED(): ?Node {
    return $this->_optional;
  }

  public function withOptional(?Node $value): this {
    if ($value === $this->_optional) {
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

  public function hasOptional(): bool {
    return $this->_optional !== null;
  }

  /**
   * @return null
   */
  public function getOptional(): ?Node {
    return $this->_optional;
  }

  /**
   * @return
   */
  public function getOptionalx(): Node {
    return TypeAssert\not_null($this->getOptional());
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(EnumToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_optional,
      $value,
      $this->_left_brace,
      $this->_values,
      $this->_right_brace,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
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
      $this->_optional,
      $this->_keyword,
      $value,
      $this->_values,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return $this->_left_brace !== null;
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
      $this->_optional,
      $this->_keyword,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasValues(): bool {
    return $this->_values !== null;
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
      $this->_optional,
      $this->_keyword,
      $this->_left_brace,
      $this->_values,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return $this->_right_brace !== null;
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
