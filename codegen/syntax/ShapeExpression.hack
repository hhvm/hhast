/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e2f537dfcdd880dcdf5158f501b642fa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ShapeExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'shape_expression';

  private ShapeToken $_keyword;
  private LeftParenToken $_left_paren;
  private ?NodeList<ListItem<FieldInitializer>> $_fields;
  private RightParenToken $_right_paren;

  public function __construct(
    ShapeToken $keyword,
    LeftParenToken $left_paren,
    ?NodeList<ListItem<FieldInitializer>> $fields,
    RightParenToken $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_fields = $fields;
    $this->_right_paren = $right_paren;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['shape_expression_keyword'],
      $file,
      $offset,
      $source,
      'ShapeToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['shape_expression_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $fields = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['shape_expression_fields'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<FieldInitializer>>',
    );
    $offset += $fields?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['shape_expression_right_paren'],
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
    $fields = $this->_fields === null
      ? null
      : $rewriter($this->_fields, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $fields === $this->_fields &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $fields,
      /* HH_FIXME[4110] use `as` */ $right_paren,
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
      $this->_right_paren,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
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
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return $this->_left_paren !== null;
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

  public function withFields(
    ?NodeList<ListItem<FieldInitializer>> $value,
  ): this {
    if ($value === $this->_fields) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function hasFields(): bool {
    return $this->_fields !== null;
  }

  /**
   * @return NodeList<ListItem<FieldInitializer>> | null
   */
  public function getFields(): ?NodeList<ListItem<FieldInitializer>> {
    return $this->_fields;
  }

  /**
   * @return NodeList<ListItem<FieldInitializer>>
   */
  public function getFieldsx(): NodeList<ListItem<FieldInitializer>> {
    return TypeAssert\not_null($this->getFields());
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
      $value,
    );
  }

  public function hasRightParen(): bool {
    return $this->_right_paren !== null;
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
