/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7e2219614b95335300e5e1d597486717>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class EnumClassEnumerator extends Node {

  const string SYNTAX_KIND = 'enum_class_enumerator';

  private ?Node $_modifiers;
  private ISimpleCreationSpecifier $_type;
  private NameToken $_name;
  private SimpleInitializer $_initializer;
  private SemicolonToken $_semicolon;

  public function __construct(
    ?Node $modifiers,
    ISimpleCreationSpecifier $type,
    NameToken $name,
    SimpleInitializer $initializer,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_modifiers = $modifiers;
    $this->_type = $type;
    $this->_name = $name;
    $this->_initializer = $initializer;
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
    $modifiers = Node::fromJSON(
      ($json['enum_class_enumerator_modifiers'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $modifiers?->getWidth() ?? 0;
    $type = Node::fromJSON(
      ($json['enum_class_enumerator_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ISimpleCreationSpecifier',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $name = Node::fromJSON(
      ($json['enum_class_enumerator_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $initializer = Node::fromJSON(
      ($json['enum_class_enumerator_initializer']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'SimpleInitializer',
    );
    $initializer = $initializer as nonnull;
    $offset += $initializer->getWidth();
    $semicolon = Node::fromJSON(
      ($json['enum_class_enumerator_semicolon']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $modifiers,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $initializer,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'modifiers' => $this->_modifiers,
      'type' => $this->_type,
      'name' => $this->_name,
      'initializer' => $this->_initializer,
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
    $modifiers = $this->_modifiers === null
      ? null
      : $rewriter($this->_modifiers, $parents);
    $type = $rewriter($this->_type, $parents);
    $name = $rewriter($this->_name, $parents);
    $initializer = $rewriter($this->_initializer, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $modifiers === $this->_modifiers &&
      $type === $this->_type &&
      $name === $this->_name &&
      $initializer === $this->_initializer &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $modifiers as ?Node,
      $type as ISimpleCreationSpecifier,
      $name as NameToken,
      $initializer as SimpleInitializer,
      $semicolon as SemicolonToken,
    );
  }

  public function getModifiersUNTYPED(): ?Node {
    return $this->_modifiers;
  }

  public function withModifiers(?Node $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $value,
      $this->_type,
      $this->_name,
      $this->_initializer,
      $this->_semicolon,
    );
  }

  public function hasModifiers(): bool {
    return $this->_modifiers !== null;
  }

  /**
   * @return null
   */
  public function getModifiers(): ?Node {
    return $this->_modifiers;
  }

  /**
   * @return
   */
  public function getModifiersx(): Node {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(ISimpleCreationSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $value,
      $this->_name,
      $this->_initializer,
      $this->_semicolon,
    );
  }

  public function hasType(): bool {
    return true;
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getType(): ISimpleCreationSpecifier {
    return
      TypeAssert\instance_of(ISimpleCreationSpecifier::class, $this->_type);
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getTypex(): ISimpleCreationSpecifier {
    return $this->getType();
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(NameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_type,
      $value,
      $this->_initializer,
      $this->_semicolon,
    );
  }

  public function hasName(): bool {
    return true;
  }

  /**
   * @return NameToken
   */
  public function getName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  /**
   * @return NameToken
   */
  public function getNamex(): NameToken {
    return $this->getName();
  }

  public function getInitializerUNTYPED(): ?Node {
    return $this->_initializer;
  }

  public function withInitializer(SimpleInitializer $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_type,
      $this->_name,
      $value,
      $this->_semicolon,
    );
  }

  public function hasInitializer(): bool {
    return true;
  }

  /**
   * @return SimpleInitializer
   */
  public function getInitializer(): SimpleInitializer {
    return
      TypeAssert\instance_of(SimpleInitializer::class, $this->_initializer);
  }

  /**
   * @return SimpleInitializer
   */
  public function getInitializerx(): SimpleInitializer {
    return $this->getInitializer();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_type,
      $this->_name,
      $this->_initializer,
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
