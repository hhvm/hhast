/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<21a99c3796cce11f1184dea97d1d5881>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PropertyDeclaration
  extends Node
  implements IClassBodyDeclaration, IHasTypeHint, IHasAttributeSpec {

  const string SYNTAX_KIND = 'property_declaration';

  private ?OldAttributeSpecification $_attribute_spec;
  private NodeList<Token> $_modifiers;
  private ?ITypeSpecifier $_type;
  private NodeList<ListItem<PropertyDeclarator>> $_declarators;
  private SemicolonToken $_semicolon;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    NodeList<Token> $modifiers,
    ?ITypeSpecifier $type,
    NodeList<ListItem<PropertyDeclarator>> $declarators,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_modifiers = $modifiers;
    $this->_type = $type;
    $this->_declarators = $declarators;
    $this->_semicolon = $semicolon;
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
    $attribute_spec = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['property_attribute_spec'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $modifiers = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['property_modifiers'],
      $file,
      $offset,
      $source,
      'NodeList<Token>',
    );
    $modifiers = $modifiers as nonnull;
    $offset += $modifiers->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['property_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type?->getWidth() ?? 0;
    $declarators = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['property_declarators'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<PropertyDeclarator>>',
    );
    $declarators = $declarators as nonnull;
    $offset += $declarators->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['property_semicolon'],
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
      /* HH_IGNORE_ERROR[4110] */ $attribute_spec,
      /* HH_IGNORE_ERROR[4110] */ $modifiers,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $declarators,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'modifiers' => $this->_modifiers,
      'type' => $this->_type,
      'declarators' => $this->_declarators,
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
    $attribute_spec = $this->_attribute_spec === null
      ? null
      : $rewriter($this->_attribute_spec, $parents);
    $modifiers = $rewriter($this->_modifiers, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $declarators = $rewriter($this->_declarators, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $modifiers === $this->_modifiers &&
      $type === $this->_type &&
      $declarators === $this->_declarators &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $attribute_spec,
      /* HH_FIXME[4110] use `as` */ $modifiers,
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $declarators,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?OldAttributeSpecification $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value,
      $this->_modifiers,
      $this->_type,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasAttributeSpec(): bool {
    return $this->_attribute_spec !== null;
  }

  /**
   * @return null | OldAttributeSpecification
   */
  public function getAttributeSpec(): ?OldAttributeSpecification {
    return $this->_attribute_spec;
  }

  /**
   * @return OldAttributeSpecification
   */
  public function getAttributeSpecx(): OldAttributeSpecification {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getModifiersUNTYPED(): ?Node {
    return $this->_modifiers;
  }

  public function withModifiers(NodeList<Token> $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_type,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasModifiers(): bool {
    return $this->_modifiers !== null;
  }

  /**
   * @return NodeList<PrivateToken> | NodeList<Token> |
   * NodeList<ProtectedToken> | NodeList<PublicToken> | NodeList<StaticToken>
   */
  public function getModifiers(): NodeList<Token> {
    return TypeAssert\instance_of(NodeList::class, $this->_modifiers);
  }

  /**
   * @return NodeList<PrivateToken> | NodeList<Token> |
   * NodeList<ProtectedToken> | NodeList<PublicToken> | NodeList<StaticToken>
   */
  public function getModifiersx(): NodeList<Token> {
    return $this->getModifiers();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $value,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | LikeTypeSpecifier | null
   * | NullableTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getType(): ?ITypeSpecifier {
    return $this->_type;
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | LikeTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return TypeAssert\not_null($this->getType());
  }

  public function getDeclaratorsUNTYPED(): ?Node {
    return $this->_declarators;
  }

  public function withDeclarators(
    NodeList<ListItem<PropertyDeclarator>> $value,
  ): this {
    if ($value === $this->_declarators) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_type,
      $value,
      $this->_semicolon,
    );
  }

  public function hasDeclarators(): bool {
    return $this->_declarators !== null;
  }

  /**
   * @return NodeList<ListItem<PropertyDeclarator>>
   */
  public function getDeclarators(): NodeList<ListItem<PropertyDeclarator>> {
    return TypeAssert\instance_of(NodeList::class, $this->_declarators);
  }

  /**
   * @return NodeList<ListItem<PropertyDeclarator>>
   */
  public function getDeclaratorsx(): NodeList<ListItem<PropertyDeclarator>> {
    return $this->getDeclarators();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_type,
      $this->_declarators,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
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
