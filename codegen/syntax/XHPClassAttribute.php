<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fd033f8de6409e2ed7f6a5e807a1a164>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPClassAttribute extends EditableNode {

  private EditableNode $_type;
  private EditableNode $_name;
  private EditableNode $_initializer;
  private EditableNode $_required;

  public function __construct(
    EditableNode $type,
    EditableNode $name,
    EditableNode $initializer,
    EditableNode $required,
  ) {
    parent::__construct('xhp_class_attribute');
    $this->_type = $type;
    $this->_name = $name;
    $this->_initializer = $initializer;
    $this->_required = $required;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $initializer = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_initializer'],
      $file,
      $offset,
      $source,
    );
    $offset += $initializer->getWidth();
    $required = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_required'],
      $file,
      $offset,
      $source,
    );
    $offset += $required->getWidth();
    return new static($type, $name, $initializer, $required);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'type' => $this->_type,
      'name' => $this->_name,
      'initializer' => $this->_initializer,
      'required' => $this->_required,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $type = $this->_type->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $initializer = $this->_initializer->rewrite($rewriter, $parents);
    $required = $this->_required->rewrite($rewriter, $parents);
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

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return
      new static($value, $this->_name, $this->_initializer, $this->_required);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return GenericTypeSpecifier | MapArrayTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | VectorArrayTypeSpecifier |
   * XHPEnumType
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return GenericTypeSpecifier | MapArrayTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | VectorArrayTypeSpecifier |
   * XHPEnumType
   */
  public function getTypex(): EditableNode {
    return $this->getType();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return
      new static($this->_type, $value, $this->_initializer, $this->_required);
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

  public function getInitializerUNTYPED(): EditableNode {
    return $this->_initializer;
  }

  public function withInitializer(EditableNode $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new static($this->_type, $this->_name, $value, $this->_required);
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
    return
      TypeAssert\instance_of(SimpleInitializer::class, $this->_initializer);
  }

  /**
   * @return SimpleInitializer
   */
  public function getInitializerx(): SimpleInitializer {
    return
      TypeAssert\instance_of(SimpleInitializer::class, $this->_initializer);
  }

  public function getRequiredUNTYPED(): EditableNode {
    return $this->_required;
  }

  public function withRequired(EditableNode $value): this {
    if ($value === $this->_required) {
      return $this;
    }
    return new static($this->_type, $this->_name, $this->_initializer, $value);
  }

  public function hasRequired(): bool {
    return !$this->_required->isMissing();
  }

  /**
   * @return null | XHPRequired
   */
  public function getRequired(): ?XHPRequired {
    if ($this->_required->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(XHPRequired::class, $this->_required);
  }

  /**
   * @return XHPRequired
   */
  public function getRequiredx(): XHPRequired {
    return TypeAssert\instance_of(XHPRequired::class, $this->_required);
  }
}
