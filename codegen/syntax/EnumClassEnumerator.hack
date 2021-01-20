/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2db2005ab2528841d010265bb515d310>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class EnumClassEnumerator extends Node {

  const string SYNTAX_KIND = 'enum_class_enumerator';

  private ISimpleCreationSpecifier $_type;
  private NameToken $_name;
  private EqualToken $_equal;
  private ObjectCreationExpression $_initial_value;
  private SemicolonToken $_semicolon;

  public function __construct(
    ISimpleCreationSpecifier $type,
    NameToken $name,
    EqualToken $equal,
    ObjectCreationExpression $initial_value,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_type = $type;
    $this->_name = $name;
    $this->_equal = $equal;
    $this->_initial_value = $initial_value;
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
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_type'],
      $file,
      $offset,
      $source,
      'ISimpleCreationSpecifier',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_equal'],
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $equal = $equal as nonnull;
    $offset += $equal->getWidth();
    $initial_value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_initial_value'],
      $file,
      $offset,
      $source,
      'ObjectCreationExpression',
    );
    $initial_value = $initial_value as nonnull;
    $offset += $initial_value->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_semicolon'],
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
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $equal,
      /* HH_IGNORE_ERROR[4110] */ $initial_value,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'type' => $this->_type,
      'name' => $this->_name,
      'equal' => $this->_equal,
      'initial_value' => $this->_initial_value,
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
    $type = $rewriter($this->_type, $parents);
    $name = $rewriter($this->_name, $parents);
    $equal = $rewriter($this->_equal, $parents);
    $initial_value = $rewriter($this->_initial_value, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $type === $this->_type &&
      $name === $this->_name &&
      $equal === $this->_equal &&
      $initial_value === $this->_initial_value &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $equal,
      /* HH_FIXME[4110] use `as` */ $initial_value,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(ISimpleCreationSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $value,
      $this->_name,
      $this->_equal,
      $this->_initial_value,
      $this->_semicolon,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getType(): ISimpleCreationSpecifier {
    return TypeAssert\instance_of(
      ISimpleCreationSpecifier::class,
      $this->_type,
    );
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
      $this->_type,
      $value,
      $this->_equal,
      $this->_initial_value,
      $this->_semicolon,
    );
  }

  public function hasName(): bool {
    return $this->_name !== null;
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

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(EqualToken $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_name,
      $value,
      $this->_initial_value,
      $this->_semicolon,
    );
  }

  public function hasEqual(): bool {
    return $this->_equal !== null;
  }

  /**
   * @return EqualToken
   */
  public function getEqual(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  /**
   * @return EqualToken
   */
  public function getEqualx(): EqualToken {
    return $this->getEqual();
  }

  public function getInitialValueUNTYPED(): ?Node {
    return $this->_initial_value;
  }

  public function withInitialValue(ObjectCreationExpression $value): this {
    if ($value === $this->_initial_value) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_name,
      $this->_equal,
      $value,
      $this->_semicolon,
    );
  }

  public function hasInitialValue(): bool {
    return $this->_initial_value !== null;
  }

  /**
   * @return ObjectCreationExpression
   */
  public function getInitialValue(): ObjectCreationExpression {
    return TypeAssert\instance_of(
      ObjectCreationExpression::class,
      $this->_initial_value,
    );
  }

  /**
   * @return ObjectCreationExpression
   */
  public function getInitialValuex(): ObjectCreationExpression {
    return $this->getInitialValue();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_name,
      $this->_equal,
      $this->_initial_value,
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
