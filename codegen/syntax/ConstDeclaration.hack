/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5e18f81b83c25278e45f05d5ada547dd>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ConstDeclaration extends Node implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'const_declaration';

  private ?OldAttributeSpecification $_attribute_spec;
  private ?NodeList<AbstractToken> $_modifiers;
  private ConstToken $_keyword;
  private ?ITypeSpecifier $_type_specifier;
  private NodeList<ListItem<ConstantDeclarator>> $_declarators;
  private SemicolonToken $_semicolon;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    ?NodeList<AbstractToken> $modifiers,
    ConstToken $keyword,
    ?ITypeSpecifier $type_specifier,
    NodeList<ListItem<ConstantDeclarator>> $declarators,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_modifiers = $modifiers;
    $this->_keyword = $keyword;
    $this->_type_specifier = $type_specifier;
    $this->_declarators = $declarators;
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
    $attribute_spec = Node::fromJSON(
      ($json['const_attribute_spec'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $modifiers = Node::fromJSON(
      ($json['const_modifiers'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<AbstractToken>',
    );
    $offset += $modifiers?->getWidth() ?? 0;
    $keyword = Node::fromJSON(
      ($json['const_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ConstToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $type_specifier = Node::fromJSON(
      ($json['const_type_specifier'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type_specifier?->getWidth() ?? 0;
    $declarators = Node::fromJSON(
      ($json['const_declarators']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ConstantDeclarator>>',
    );
    $declarators = $declarators as nonnull;
    $offset += $declarators->getWidth();
    $semicolon = Node::fromJSON(
      ($json['const_semicolon']) as dict<_, _>,
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
      $attribute_spec as ?OldAttributeSpecification,
      \HH\FIXME\UNSAFE_CAST<?NodeList<Node>, ?NodeList<AbstractToken>>(
        $modifiers as ?NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $keyword as ConstToken,
      $type_specifier as ?ITypeSpecifier,
      \HH\FIXME\UNSAFE_CAST<
        NodeList<Node>,
        NodeList<ListItem<ConstantDeclarator>>,
      >(
        $declarators as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $semicolon as SemicolonToken,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'modifiers' => $this->_modifiers,
      'keyword' => $this->_keyword,
      'type_specifier' => $this->_type_specifier,
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
    $modifiers = $this->_modifiers === null
      ? null
      : $rewriter($this->_modifiers, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $type_specifier = $this->_type_specifier === null
      ? null
      : $rewriter($this->_type_specifier, $parents);
    $declarators = $rewriter($this->_declarators, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $modifiers === $this->_modifiers &&
      $keyword === $this->_keyword &&
      $type_specifier === $this->_type_specifier &&
      $declarators === $this->_declarators &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $attribute_spec as ?OldAttributeSpecification,
      \HH\FIXME\UNSAFE_CAST<?NodeList<Node>, ?NodeList<AbstractToken>>(
        $modifiers as ?NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $keyword as ConstToken,
      $type_specifier as ?ITypeSpecifier,
      \HH\FIXME\UNSAFE_CAST<
        NodeList<Node>,
        NodeList<ListItem<ConstantDeclarator>>,
      >(
        $declarators as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $semicolon as SemicolonToken,
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
      $this->_keyword,
      $this->_type_specifier,
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

  public function withModifiers(?NodeList<AbstractToken> $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_keyword,
      $this->_type_specifier,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasModifiers(): bool {
    return $this->_modifiers !== null;
  }

  /**
   * @return NodeList<AbstractToken> | null
   */
  public function getModifiers(): ?NodeList<AbstractToken> {
    return $this->_modifiers;
  }

  /**
   * @return NodeList<AbstractToken>
   */
  public function getModifiersx(): NodeList<AbstractToken> {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ConstToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $value,
      $this->_type_specifier,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return ConstToken
   */
  public function getKeyword(): ConstToken {
    return TypeAssert\instance_of(ConstToken::class, $this->_keyword);
  }

  /**
   * @return ConstToken
   */
  public function getKeywordx(): ConstToken {
    return $this->getKeyword();
  }

  public function getTypeSpecifierUNTYPED(): ?Node {
    return $this->_type_specifier;
  }

  public function withTypeSpecifier(?ITypeSpecifier $value): this {
    if ($value === $this->_type_specifier) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_keyword,
      $value,
      $this->_declarators,
      $this->_semicolon,
    );
  }

  public function hasTypeSpecifier(): bool {
    return $this->_type_specifier !== null;
  }

  /**
   * @return ClassnameTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier |
   * null | NullableTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypeSpecifier(): ?ITypeSpecifier {
    return $this->_type_specifier;
  }

  /**
   * @return ClassnameTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypeSpecifierx(): ITypeSpecifier {
    return TypeAssert\not_null($this->getTypeSpecifier());
  }

  public function getDeclaratorsUNTYPED(): ?Node {
    return $this->_declarators;
  }

  public function withDeclarators(
    NodeList<ListItem<ConstantDeclarator>> $value,
  ): this {
    if ($value === $this->_declarators) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_modifiers,
      $this->_keyword,
      $this->_type_specifier,
      $value,
      $this->_semicolon,
    );
  }

  public function hasDeclarators(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<ConstantDeclarator>>
   */
  public function getDeclarators(): NodeList<ListItem<ConstantDeclarator>> {
    return TypeAssert\instance_of(NodeList::class, $this->_declarators);
  }

  /**
   * @return NodeList<ListItem<ConstantDeclarator>>
   */
  public function getDeclaratorsx(): NodeList<ListItem<ConstantDeclarator>> {
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
      $this->_keyword,
      $this->_type_specifier,
      $this->_declarators,
      $value,
    );
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
