/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<494718cbcbf4862c3c3409151aad7ac4>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ConstantDeclarator extends Node {

  const string SYNTAX_KIND = 'constant_declarator';

  private NameToken $_name;
  private ?SimpleInitializer $_initializer;

  public function __construct(
    NameToken $name,
    ?SimpleInitializer $initializer,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_initializer = $initializer;
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
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['constant_declarator_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $initializer = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['constant_declarator_initializer'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'SimpleInitializer',
    );
    $offset += $initializer?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $initializer,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'initializer' => $this->_initializer,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $rewriter($this->_name, $parents);
    $initializer = $this->_initializer === null
      ? null
      : $rewriter($this->_initializer, $parents);
    if ($name === $this->_name && $initializer === $this->_initializer) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $initializer,
    );
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(NameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_initializer);
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

  public function getInitializerUNTYPED(): ?Node {
    return $this->_initializer;
  }

  public function withInitializer(?SimpleInitializer $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new static($this->_name, $value);
  }

  public function hasInitializer(): bool {
    return $this->_initializer !== null;
  }

  /**
   * @return null | SimpleInitializer
   */
  public function getInitializer(): ?SimpleInitializer {
    return $this->_initializer;
  }

  /**
   * @return SimpleInitializer
   */
  public function getInitializerx(): SimpleInitializer {
    return TypeAssert\not_null($this->getInitializer());
  }
}
