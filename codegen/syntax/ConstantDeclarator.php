<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<90d8f605f355fa62ac87a060c9d06f74>>
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

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['constant_declarator_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $initializer = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['constant_declarator_initializer'],
      $position,
      $source,
    );
    $position += $initializer->getWidth();
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
    return !$this->_name->isMissing();
  }

  public function getName(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
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
    return !$this->_initializer->isMissing();
  }

  public function getInitializer(): ?SimpleInitializer {
    if ($this->_initializer->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_initializer);
  }

  public function getInitializerx(): SimpleInitializer {
    return TypeAssert::isInstanceOf(SimpleInitializer::class, $this->_initializer);
  }
}
