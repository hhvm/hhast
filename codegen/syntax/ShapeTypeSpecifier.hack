/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e47048bc8ef421cedc2cdff0e9d5c88b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ShapeTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'shape_type_specifier';

  private ShapeToken $_keyword;
  private LeftParenToken $_left_paren;
  private ?NodeList<ListItem<FieldSpecifier>> $_fields;
  private ?DotDotDotToken $_ellipsis;
  private RightParenToken $_right_paren;

  public function __construct(
    ShapeToken $keyword,
    LeftParenToken $left_paren,
    ?NodeList<ListItem<FieldSpecifier>> $fields,
    ?DotDotDotToken $ellipsis,
    RightParenToken $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_fields = $fields;
    $this->_ellipsis = $ellipsis;
    $this->_right_paren = $right_paren;
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
      ($json['shape_type_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ShapeToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      ($json['shape_type_left_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $fields = Node::fromJSON(
      ($json['shape_type_fields'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<FieldSpecifier>>',
    );
    $offset += $fields?->getWidth() ?? 0;
    $ellipsis = Node::fromJSON(
      ($json['shape_type_ellipsis'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'DotDotDotToken',
    );
    $offset += $ellipsis?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      ($json['shape_type_right_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $fields,
      /* HH_IGNORE_ERROR[4110] */ $ellipsis,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'fields' => $this->_fields,
      'ellipsis' => $this->_ellipsis,
      'right_paren' => $this->_right_paren,
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
    $left_paren = $rewriter($this->_left_paren, $parents);
    $fields =
      $this->_fields === null ? null : $rewriter($this->_fields, $parents);
    $ellipsis =
      $this->_ellipsis === null ? null : $rewriter($this->_ellipsis, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $fields === $this->_fields &&
      $ellipsis === $this->_ellipsis &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static(
      $keyword as ShapeToken,
      $left_paren as LeftParenToken,
      /* HH_FIXME[4110] ?NodeList<ListItem<FieldSpecifier>> may not be enforceable */ $fields,
      $ellipsis as ?DotDotDotToken,
      $right_paren as RightParenToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ShapeToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_fields,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return ShapeToken
   */
  public function getKeyword(): ShapeToken {
    return TypeAssert\instance_of(ShapeToken::class, $this->_keyword);
  }

  /**
   * @return ShapeToken
   */
  public function getKeywordx(): ShapeToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_fields,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return true;
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return $this->getLeftParen();
  }

  public function getFieldsUNTYPED(): ?Node {
    return $this->_fields;
  }

  public function withFields(?NodeList<ListItem<FieldSpecifier>> $value): this {
    if ($value === $this->_fields) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function hasFields(): bool {
    return $this->_fields !== null;
  }

  /**
   * @return NodeList<ListItem<FieldSpecifier>> | null
   */
  public function getFields(): ?NodeList<ListItem<FieldSpecifier>> {
    return $this->_fields;
  }

  /**
   * @return NodeList<ListItem<FieldSpecifier>>
   */
  public function getFieldsx(): NodeList<ListItem<FieldSpecifier>> {
    return TypeAssert\not_null($this->getFields());
  }

  public function getEllipsisUNTYPED(): ?Node {
    return $this->_ellipsis;
  }

  public function withEllipsis(?DotDotDotToken $value): this {
    if ($value === $this->_ellipsis) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_fields,
      $value,
      $this->_right_paren,
    );
  }

  public function hasEllipsis(): bool {
    return $this->_ellipsis !== null;
  }

  /**
   * @return null | DotDotDotToken
   */
  public function getEllipsis(): ?DotDotDotToken {
    return $this->_ellipsis;
  }

  /**
   * @return DotDotDotToken
   */
  public function getEllipsisx(): DotDotDotToken {
    return TypeAssert\not_null($this->getEllipsis());
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_fields,
      $this->_ellipsis,
      $value,
    );
  }

  public function hasRightParen(): bool {
    return true;
  }

  /**
   * @return RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return $this->getRightParen();
  }
}
