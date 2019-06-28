/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<333d1c15c9a2546154f0de3ec6c863c4>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TupleTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'tuple_type_specifier';

  private Node $_left_paren;
  private Node $_types;
  private Node $_right_paren;

  public function __construct(
    Node $left_paren,
    Node $types,
    Node $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_paren = $left_paren;
    $this->_types = $types;
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
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $offset += $left_paren->getWidth();
    $types = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_types'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ITypeSpecifier>>',
    );
    $offset += $types->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $offset += $right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_paren, $types, $right_paren, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_paren' => $this->_left_paren,
      'types' => $this->_types,
      'right_paren' => $this->_right_paren,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_paren = $rewriter($this->_left_paren, $parents);
    $types = $rewriter($this->_types, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $types === $this->_types &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static($left_paren, $types, $right_paren);
  }

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static($value ?? Missing(), $this->_types, $this->_right_paren);
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
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

  public function getTypesUNTYPED(): Node {
    return $this->_types;
  }

  public function withTypes(NodeList<ListItem<ITypeSpecifier>> $value): this {
    if ($value === $this->_types) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $value ?? Missing(),
      $this->_right_paren,
    );
  }

  public function hasTypes(): bool {
    return !$this->_types->isMissing();
  }

  /**
   * @return NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> |
   * NodeList<ListItem<TupleTypeSpecifier>> |
   * NodeList<ListItem<VectorArrayTypeSpecifier>> |
   * NodeList<ListItem<VectorTypeSpecifier>>
   */
  public function getTypes(): NodeList<ListItem<ITypeSpecifier>> {
    return TypeAssert\instance_of(NodeList::class, $this->_types);
  }

  /**
   * @return NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> |
   * NodeList<ListItem<TupleTypeSpecifier>> |
   * NodeList<ListItem<VectorArrayTypeSpecifier>> |
   * NodeList<ListItem<VectorTypeSpecifier>>
   */
  public function getTypesx(): NodeList<ListItem<ITypeSpecifier>> {
    return $this->getTypes();
  }

  public function getRightParenUNTYPED(): Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static($this->_left_paren, $this->_types, $value ?? Missing());
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
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
