/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9acbc1ae19b71c76301a7ceba4a58315>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class PropertyDeclarator extends Node {

  const string SYNTAX_KIND = 'property_declarator';

  private VariableToken $_name;
  private ?SimpleInitializer $_initializer;

  public function __construct(
    VariableToken $name,
    ?SimpleInitializer $initializer,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_initializer = $initializer;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $name = Node::fromJSON(
      ($json['property_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'VariableToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $initializer = Node::fromJSON(
      ($json['property_initializer'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
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
    return
      new static($name as VariableToken, $initializer as ?SimpleInitializer);
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(VariableToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_initializer);
  }

  public function hasName(): bool {
    return true;
  }

  /**
   * @return VariableToken
   */
  public function getName(): VariableToken {
    return TypeAssert\instance_of(VariableToken::class, $this->_name);
  }

  /**
   * @return VariableToken
   */
  public function getNamex(): VariableToken {
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
