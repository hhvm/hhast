/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<91f93b6ec5f12d0c97c142e8af19d139>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $name = Node::fromJSON(
      ($json['enumerator_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $equal = Node::fromJSON(
      ($json['enumerator_equal']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $equal = $equal as nonnull;
    $offset += $equal->getWidth();
    $value = Node::fromJSON(
      ($json['enumerator_value']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $value = $value as nonnull;
    $offset += $value->getWidth();
    $semicolon = Node::fromJSON(
      ($json['enumerator_semicolon']) as dict<_, _>,
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
      $name as NameToken,
      $equal as EqualToken,
      $value as IExpression,
      $semicolon as SemicolonToken,
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
    return true;
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
    return true;
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
    return true;
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
    return true;
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
