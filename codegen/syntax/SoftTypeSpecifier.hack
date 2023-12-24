/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d5dc294c3de1d5c24a3b70a2da82dbe1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class SoftTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'soft_type_specifier';

  private AtToken $_at;
  private ITypeSpecifier $_type;

  public function __construct(
    AtToken $at,
    ITypeSpecifier $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_at = $at;
    $this->_type = $type;
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
    $at = Node::fromJSON(
      ($json['soft_at']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'AtToken',
    );
    $at = $at as nonnull;
    $offset += $at->getWidth();
    $type = Node::fromJSON(
      ($json['soft_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($at as AtToken, $type as ITypeSpecifier, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'at' => $this->_at,
      'type' => $this->_type,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $at = $rewriter($this->_at, $parents);
    $type = $rewriter($this->_type, $parents);
    if ($at === $this->_at && $type === $this->_type) {
      return $this;
    }
    return new static($at as AtToken, $type as ITypeSpecifier);
  }

  public function getAtUNTYPED(): ?Node {
    return $this->_at;
  }

  public function withAt(AtToken $value): this {
    if ($value === $this->_at) {
      return $this;
    }
    return new static($value, $this->_type);
  }

  public function hasAt(): bool {
    return true;
  }

  /**
   * @return AtToken
   */
  public function getAt(): AtToken {
    return TypeAssert\instance_of(AtToken::class, $this->_at);
  }

  /**
   * @return AtToken
   */
  public function getAtx(): AtToken {
    return $this->getAt();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_at, $value);
  }

  public function hasType(): bool {
    return true;
  }

  /**
   * @return LikeTypeSpecifier | SimpleTypeSpecifier
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return LikeTypeSpecifier | SimpleTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }
}
