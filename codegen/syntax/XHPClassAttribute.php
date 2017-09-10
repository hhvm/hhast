<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4f71b0422c0434be407e7de75f03dbec>>
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

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $initializer = $this->_initializer->rewrite($rewriter, $child_parents);
    $required = $this->_required->rewrite($rewriter, $child_parents);
    if (
      $type === $this->_type &&
      $name === $this->_name &&
      $initializer === $this->_initializer &&
      $required === $this->_required
    ) {
      $node = $this;
    } else {
      $node = new self($type, $name, $initializer, $required);
    }
    return $rewriter($node, $parents);
  }

  public function type(): EditableSyntax {
    return $this->typex();
  }

  public function typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return
      new self($value, $this->_name, $this->_initializer, $this->_required);
  }

  public function name(): XHPElementNameToken {
    return $this->namex();
  }

  public function namex(): XHPElementNameToken {
    return TypeAssert::isInstanceOf(XHPElementNameToken::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return
      new self($this->_type, $value, $this->_initializer, $this->_required);
  }

  public function initializer(): ?SimpleInitializer {
    return $this->_initializer->is_missing()
      ? null
      : TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_initializer);
  }

  public function initializerx(): SimpleInitializer {
    return
      TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_initializer);
  }

  public function raw_initializer(): EditableSyntax {
    return $this->_initializer;
  }

  public function with_initializer(EditableSyntax $value): this {
    return new self($this->_type, $this->_name, $value, $this->_required);
  }

  public function required(): ?XHPRequired {
    return $this->_required->is_missing()
      ? null
      : TypeAssert::isInstanceOf(XHPRequired::class, $this->_required);
  }

  public function requiredx(): XHPRequired {
    return TypeAssert::isInstanceOf(XHPRequired::class, $this->_required);
  }

  public function raw_required(): EditableSyntax {
    return $this->_required;
  }

  public function with_required(EditableSyntax $value): this {
    return new self($this->_type, $this->_name, $this->_initializer, $value);
  }
}
