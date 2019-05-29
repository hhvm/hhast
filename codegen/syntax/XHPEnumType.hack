/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<eb95839d2506fbef98cd817372ffe1da>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPEnumType extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'xhp_enum_type';

  private Node $_optional;
  private Node $_keyword;
  private Node $_left_brace;
  private Node $_values;
  private Node $_right_brace;

  public function __construct(
    Node $optional,
    Node $keyword,
    Node $left_brace,
    Node $values,
    Node $right_brace,
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
  ): this {
    $offset = $initial_offset;
    $optional = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_enum_optional'],
      $file,
      $offset,
      $source,
    );
    $offset += $optional->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_enum_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_enum_left_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_brace->getWidth();
    $values = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_enum_values'],
      $file,
      $offset,
      $source,
    );
    $offset += $values->getWidth();
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_enum_right_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $optional,
      $keyword,
      $left_brace,
      $values,
      $right_brace,
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
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $optional = $rewriter($this->_optional, $parents);
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
    return new static($optional, $keyword, $left_brace, $values, $right_brace);
  }

  public function getOptionalUNTYPED(): Node {
    return $this->_optional;
  }

  public function withOptional(Node $value): this {
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
    return !$this->_optional->isMissing();
  }

  /**
   * @return null
   */
  public function getOptional(): ?Node {
    if ($this->_optional->isMissing()) {
      return null;
    }
    return $this->_optional;
  }

  /**
   * @return
   */
  public function getOptionalx(): Node {
    return TypeAssert\not_null($this->getOptional());
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
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
    return !$this->_keyword->isMissing();
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

  public function getLeftBraceUNTYPED(): Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(Node $value): this {
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
    return !$this->_left_brace->isMissing();
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

  public function getValuesUNTYPED(): Node {
    return $this->_values;
  }

  public function withValues(Node $value): this {
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
    return !$this->_values->isMissing();
  }

  /**
   * @return NodeList<LiteralExpression>
   */
  public function getValues(): NodeList<LiteralExpression> {
    return TypeAssert\instance_of(NodeList::class, $this->_values);
  }

  /**
   * @return NodeList<LiteralExpression>
   */
  public function getValuesx(): NodeList<LiteralExpression> {
    return $this->getValues();
  }

  public function getRightBraceUNTYPED(): Node {
    return $this->_right_brace;
  }

  public function withRightBrace(Node $value): this {
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
    return !$this->_right_brace->isMissing();
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
