/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<39c51bb03d107b2a32c4e197c50f39ab>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class Enumerator extends Node {

  const string SYNTAX_KIND = 'enumerator';

  private NameToken $_name;
  private EqualToken $_equal;
  private IExpression $_value;
  private SemicolonToken $_semicolon;

  public function __construct(
    NameToken $name,
    EqualToken $equal,
    IExpression $value,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_equal = $equal;
    $this->_value = $value;
    $this->_semicolon = $semicolon;
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
      /* HH_FIXME[4110] */ $json['enumerator_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enumerator_equal'],
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $equal = $equal as nonnull;
    $offset += $equal->getWidth();
    $value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enumerator_value'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $value = $value as nonnull;
    $offset += $value->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enumerator_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $equal,
      /* HH_IGNORE_ERROR[4110] */ $value,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'equal' => $this->_equal,
      'value' => $this->_value,
      'semicolon' => $this->_semicolon,
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
    $equal = $rewriter($this->_equal, $parents);
    $value = $rewriter($this->_value, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $name === $this->_name &&
      $equal === $this->_equal &&
      $value === $this->_value &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $equal,
      /* HH_FIXME[4110] use `as` */ $value,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(NameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_equal, $this->_value, $this->_semicolon);
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

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(EqualToken $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static($this->_name, $value, $this->_value, $this->_semicolon);
  }

  public function hasEqual(): bool {
    return $this->_equal !== null;
  }

  /**
   * @return EqualToken
   */
  public function getEqual(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  /**
   * @return EqualToken
   */
  public function getEqualx(): EqualToken {
    return $this->getEqual();
  }

  public function getValueUNTYPED(): ?Node {
    return $this->_value;
  }

  public function withValue(IExpression $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new static($this->_name, $this->_equal, $value, $this->_semicolon);
  }

  public function hasValue(): bool {
    return $this->_value !== null;
  }

  /**
   * @return BinaryExpression | LiteralExpression | ScopeResolutionExpression |
   * NameToken
   */
  public function getValue(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_value);
  }

  /**
   * @return BinaryExpression | LiteralExpression | ScopeResolutionExpression |
   * NameToken
   */
  public function getValuex(): IExpression {
    return $this->getValue();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_name, $this->_equal, $this->_value, $value);
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
