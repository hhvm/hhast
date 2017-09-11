<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<24e890c2aeae6fbac82324697e80c693>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $initializer = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_initializer'],
      $position,
      $source,
    );
    $position += $initializer->width();
    $required = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_decl_required'],
      $position,
      $source,
    );
    $position += $required->width();
    return new self($type, $name, $initializer, $required);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'type' => $this->_type;
    yield 'name' => $this->_name;
    yield 'initializer' => $this->_initializer;
    yield 'required' => $this->_required;
  }

  public function rewrite_children(
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

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self($value, $this->_name, $this->_initializer, $this->_required);
  }

  public function type(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_type, $value, $this->_initializer, $this->_required);
  }

  public function name(): XHPElementNameToken {
    return TypeAssert::isInstanceOf(XHPElementNameToken::class, $this->_name);
  }

  public function raw_initializer(): EditableSyntax {
    return $this->_initializer;
  }

  public function with_initializer(EditableSyntax $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new self($this->_type, $this->_name, $value, $this->_required);
  }

  public function initializer(): ?SimpleInitializer {
    if ($this->_initializer->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_initializer);
  }

  public function initializerx(): SimpleInitializer {
    return TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_initializer);
  }

  public function raw_required(): EditableSyntax {
    return $this->_required;
  }

  public function with_required(EditableSyntax $value): this {
    if ($value === $this->_required) {
      return $this;
    }
    return new self($this->_type, $this->_name, $this->_initializer, $value);
  }

  public function required(): ?XHPRequired {
    if ($this->_required->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(XHPRequired::class, $this->_required);
  }

  public function requiredx(): XHPRequired {
    return TypeAssert::isInstanceOf(XHPRequired::class, $this->_required);
  }
}
