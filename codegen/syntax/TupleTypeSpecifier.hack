/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3947ee3d62b6e180ddfe96f9161ac54b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class TupleTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'tuple_type_specifier';

  private LeftParenToken $_left_paren;
  private NodeList<ListItem<ITypeSpecifier>> $_types;
  private RightParenToken $_right_paren;

  public function __construct(
    LeftParenToken $left_paren,
    NodeList<ListItem<ITypeSpecifier>> $types,
    RightParenToken $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_paren = $left_paren;
    $this->_types = $types;
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
    $left_paren = Node::fromJSON(
      ($json['tuple_left_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $types = Node::fromJSON(
      ($json['tuple_types']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ITypeSpecifier>>',
    );
    $types = $types as nonnull;
    $offset += $types->getWidth();
    $right_paren = Node::fromJSON(
      ($json['tuple_right_paren']) as dict<_, _>,
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
      $left_paren as LeftParenToken,
      \HH\FIXME\UNSAFE_CAST<NodeList<Node>, NodeList<ListItem<ITypeSpecifier>>>(
        $types as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_paren as RightParenToken,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_paren' => $this->_left_paren,
      'types' => $this->_types,
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
    return new static(
      $left_paren as LeftParenToken,
      \HH\FIXME\UNSAFE_CAST<NodeList<Node>, NodeList<ListItem<ITypeSpecifier>>>(
        $types as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_paren as RightParenToken,
    );
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static($value, $this->_types, $this->_right_paren);
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

  public function getTypesUNTYPED(): ?Node {
    return $this->_types;
  }

  public function withTypes(NodeList<ListItem<ITypeSpecifier>> $value): this {
    if ($value === $this->_types) {
      return $this;
    }
    return new static($this->_left_paren, $value, $this->_right_paren);
  }

  public function hasTypes(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<GenericTypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> |
   * NodeList<ListItem<TupleTypeSpecifier>> | NodeList<ListItem<TypeConstant>>
   * | NodeList<ListItem<VarrayTypeSpecifier>> |
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
   * NodeList<ListItem<TupleTypeSpecifier>> | NodeList<ListItem<TypeConstant>>
   * | NodeList<ListItem<VarrayTypeSpecifier>> |
   * NodeList<ListItem<VectorTypeSpecifier>>
   */
  public function getTypesx(): NodeList<ListItem<ITypeSpecifier>> {
    return $this->getTypes();
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static($this->_left_paren, $this->_types, $value);
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
