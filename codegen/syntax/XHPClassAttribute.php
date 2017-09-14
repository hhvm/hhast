<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<af3d24a8111c6ffa85f00c948c47bc85>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPClassAttribute extends EditableSyntax {

  private EditableSyntax $_type;
  private EditableSyntax $_name;
  private EditableSyntax $_initializer;
  private EditableSyntax $_required;

  public function __construct(
    EditableSyntax $type,
    EditableSyntax $name,
    EditableSyntax $initializer,
    EditableSyntax $required,
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
    int $position,
    string $source,
  ): this {
    $type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $initializer = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_initializer'],
      $position,
      $source,
    );
    $position += $initializer->getWidth();
    $required = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_required'],
      $position,
      $source,
    );
    $position += $required->getWidth();
    return new self($type, $name, $initializer, $required);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'type' => $this->_type;
    yield 'name' => $this->_name;
    yield 'initializer' => $this->_initializer;
    yield 'required' => $this->_required;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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
    return new self($type, $name, $initializer, $required);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self($value, $this->_name, $this->_initializer, $this->_required);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @returns GenericTypeSpecifier | SimpleTypeSpecifier | XHPEnumType |
   * NullableTypeSpecifier | VectorArrayTypeSpecifier | MapArrayTypeSpecifier
   */
  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_type, $value, $this->_initializer, $this->_required);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns XHPElementNameToken
   */
  public function getName(): XHPElementNameToken {
    return TypeAssert::isInstanceOf(XHPElementNameToken::class, $this->_name);
  }

  public function getInitializerUNTYPED(): EditableSyntax {
    return $this->_initializer;
  }

  public function withInitializer(EditableSyntax $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new self($this->_type, $this->_name, $value, $this->_required);
  }

  public function hasInitializer(): bool {
    return !$this->_initializer->isMissing();
  }

  /**
   * @returns SimpleInitializer
   */
  public function getInitializer(): ?SimpleInitializer {
    if ($this->_initializer->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_initializer);
  }

  /**
   * @returns SimpleInitializer
   */
  public function getInitializerx(): SimpleInitializer {
    return TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_initializer);
  }

  public function getRequiredUNTYPED(): EditableSyntax {
    return $this->_required;
  }

  public function withRequired(EditableSyntax $value): this {
    if ($value === $this->_required) {
      return $this;
    }
    return new self($this->_type, $this->_name, $this->_initializer, $value);
  }

  public function hasRequired(): bool {
    return !$this->_required->isMissing();
  }

  /**
   * @returns XHPRequired
   */
  public function getRequired(): ?XHPRequired {
    if ($this->_required->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(XHPRequired::class, $this->_required);
  }

  /**
   * @returns XHPRequired
   */
  public function getRequiredx(): XHPRequired {
    return TypeAssert::isInstanceOf(XHPRequired::class, $this->_required);
  }
}
