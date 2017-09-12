<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f45c3a68e07bd3692a4c32aac0319d76>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class StaticDeclarator extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_initializer;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $initializer,
  ) {
    parent::__construct('static_declarator');
    $this->_name = $name;
    $this->_initializer = $initializer;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['static_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $initializer = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['static_initializer'],
      $position,
      $source,
    );
    $position += $initializer->width();
    return new self($name, $initializer);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'initializer' => $this->_initializer;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $initializer = $this->_initializer->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $initializer === $this->_initializer
    ) {
      return $this;
    }
    return new self($name, $initializer);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($value, $this->_initializer);
  }

  public function hasName(): bool {
    return !$this->_name->is_missing();
  }

  public function getName(): ?VariableToken {
    if ($this->_name->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(VariableToken::class, $this->_name);
  }

  public function getNamex(): VariableToken {
    return TypeAssert::isInstanceOf(VariableToken::class, $this->_name);
  }

  public function getInitializerUNTYPED(): EditableSyntax {
    return $this->_initializer;
  }

  public function withInitializer(EditableSyntax $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new self($this->_name, $value);
  }

  public function hasInitializer(): bool {
    return !$this->_initializer->is_missing();
  }

  public function getInitializer(): ?SimpleInitializer {
    if ($this->_initializer->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_initializer);
  }

  public function getInitializerx(): SimpleInitializer {
    return TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_initializer);
  }
}
