/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d68806acc59f5d66b44ec0be517c2513>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPClassAttribute extends Node implements IXHPAttribute {

  const string SYNTAX_KIND = 'xhp_class_attribute';

  private Node $_type;
  private Node $_name;
  private Node $_initializer;
  private Node $_required;

  public function __construct(
    Node $type,
    Node $name,
    Node $initializer,
    Node $required,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_type = $type;
    $this->_name = $name;
    $this->_initializer = $initializer;
    $this->_required = $required;
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
      /* HH_FIXME[4110] */ $json['xhp_attribute_decl_type'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_attribute_decl_name'],
      $file,
      $offset,
      $source,
      'XHPElementNameToken',
    );
    $offset += $name->getWidth();
    $initializer = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_attribute_decl_initializer'],
      $file,
      $offset,
      $source,
      'SimpleInitializer',
    );
    $offset += $initializer->getWidth();
    $required = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_attribute_decl_required'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $required->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($type, $name, $initializer, $required, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'type' => $this->_type,
      'name' => $this->_name,
      'initializer' => $this->_initializer,
      'required' => $this->_required,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $type = $rewriter($this->_type, $parents);
    $name = $rewriter($this->_name, $parents);
    $initializer = $rewriter($this->_initializer, $parents);
    $required = $rewriter($this->_required, $parents);
    if (
      $type === $this->_type &&
      $name === $this->_name &&
      $initializer === $this->_initializer &&
      $required === $this->_required
    ) {
      return $this;
    }
    return new static($type, $name, $initializer, $required);
  }

  public function getTypeUNTYPED(): Node {
    return $this->_type;
  }

  public function withType(ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_name,
      $this->_initializer,
      $this->_required,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return GenericTypeSpecifier | MapArrayTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | VectorArrayTypeSpecifier |
   * XHPEnumType
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return GenericTypeSpecifier | MapArrayTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | VectorArrayTypeSpecifier |
   * XHPEnumType
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(XHPElementNameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_type,
      $value ?? Missing(),
      $this->_initializer,
      $this->_required,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return XHPElementNameToken
   */
  public function getName(): XHPElementNameToken {
    return TypeAssert\instance_of(XHPElementNameToken::class, $this->_name);
  }

  /**
   * @return XHPElementNameToken
   */
  public function getNamex(): XHPElementNameToken {
    return $this->getName();
  }

  public function getInitializerUNTYPED(): Node {
    return $this->_initializer;
  }

  public function withInitializer(?SimpleInitializer $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_name,
      $value ?? Missing(),
      $this->_required,
    );
  }

  public function hasInitializer(): bool {
    return !$this->_initializer->isMissing();
  }

  /**
   * @return null | SimpleInitializer
   */
  public function getInitializer(): ?SimpleInitializer {
    if ($this->_initializer->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      SimpleInitializer::class,
      $this->_initializer,
    );
  }

  /**
   * @return SimpleInitializer
   */
  public function getInitializerx(): SimpleInitializer {
    return TypeAssert\not_null($this->getInitializer());
  }

  public function getRequiredUNTYPED(): Node {
    return $this->_required;
  }

  public function withRequired(?Node $value): this {
    if ($value === $this->_required) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_name,
      $this->_initializer,
      $value ?? Missing(),
    );
  }

  public function hasRequired(): bool {
    return !$this->_required->isMissing();
  }

  /**
   * @return null | XHPLateinit | XHPRequired
   */
  public function getRequired(): ?Node {
    if ($this->_required->isMissing()) {
      return null;
    }
    return $this->_required;
  }

  /**
   * @return XHPLateinit | XHPRequired
   */
  public function getRequiredx(): Node {
    return TypeAssert\not_null($this->getRequired());
  }
}
