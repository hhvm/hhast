<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<75b90a93f54f2f0f467dfdec6d73d127>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class StaticDeclarator extends EditableNode {

  private EditableNode $_name;
  private EditableNode $_initializer;

  public function __construct(EditableNode $name, EditableNode $initializer) {
    parent::__construct('static_declarator');
    $this->_name = $name;
    $this->_initializer = $initializer;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['static_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $initializer = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['static_initializer'],
      $position,
      $source,
    );
    $position += $initializer->getWidth();
    return new self($name, $initializer);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict['name' => $this->_name, 'initializer' => $this->_initializer];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $initializer = $this->_initializer->rewrite($rewriter, $parents);
    if ($name === $this->_name && $initializer === $this->_initializer) {
      return $this;
    }
    return new self($name, $initializer);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($value, $this->_initializer);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns VariableToken | Missing
   */
  public function getName(): ?VariableToken {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(VariableToken::class, $this->_name);
  }

  /**
   * @returns VariableToken
   */
  public function getNamex(): VariableToken {
    return TypeAssert\instance_of(VariableToken::class, $this->_name);
  }

  public function getInitializerUNTYPED(): EditableNode {
    return $this->_initializer;
  }

  public function withInitializer(EditableNode $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new self($this->_name, $value);
  }

  public function hasInitializer(): bool {
    return !$this->_initializer->isMissing();
  }

  /**
   * @returns Missing | SimpleInitializer
   */
  public function getInitializer(): ?SimpleInitializer {
    if ($this->_initializer->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(SimpleInitializer::class, $this->_initializer);
  }

  /**
   * @returns SimpleInitializer
   */
  public function getInitializerx(): SimpleInitializer {
    return
      TypeAssert\instance_of(SimpleInitializer::class, $this->_initializer);
  }
}
