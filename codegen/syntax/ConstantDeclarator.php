<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3a36aad88db5e74a8e3993fba6416292>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ConstantDeclarator extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_initializer;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $initializer,
  ) {
    parent::__construct('constant_declarator');
    $this->_name = $name;
    $this->_initializer = $initializer;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['constant_declarator_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $initializer = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['constant_declarator_initializer'],
      $position,
      $source,
    );
    $position += $initializer->width();
    return new self($name, $initializer);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'initializer' => $this->_initializer;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $initializer = $this->_initializer->rewrite($rewriter, $child_parents);
    if ($name === $this->_name && $initializer === $this->_initializer) {
      $node = $this;
    } else {
      $node = new self($name, $initializer);
    }
    return $rewriter($node, $parents);
  }

  public function name(): NameToken {
    return $this->namex();
  }

  public function namex(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($value, $this->_initializer);
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
    return new self($this->_name, $value);
  }
}
