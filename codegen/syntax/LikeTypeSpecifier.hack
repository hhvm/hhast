/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<16db13c51805cd02efe9300803ececc8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class LikeTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'like_type_specifier';

  private TildeToken $_tilde;
  private ITypeSpecifier $_type;

  public function __construct(
    TildeToken $tilde,
    ITypeSpecifier $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_tilde = $tilde;
    $this->_type = $type;
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
    $tilde = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['like_tilde'],
      $file,
      $offset,
      $source,
      'TildeToken',
    );
    $tilde = $tilde as nonnull;
    $offset += $tilde->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['like_type'],
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
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $tilde,
      /* HH_IGNORE_ERROR[4110] */ $type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'tilde' => $this->_tilde,
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
    $tilde = $rewriter($this->_tilde, $parents);
    $type = $rewriter($this->_type, $parents);
    if ($tilde === $this->_tilde && $type === $this->_type) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $tilde,
      /* HH_FIXME[4110] use `as` */ $type,
    );
  }

  public function getTildeUNTYPED(): ?Node {
    return $this->_tilde;
  }

  public function withTilde(TildeToken $value): this {
    if ($value === $this->_tilde) {
      return $this;
    }
    return new static($value, $this->_type);
  }

  public function hasTilde(): bool {
    return $this->_tilde !== null;
  }

  /**
   * @return TildeToken
   */
  public function getTilde(): TildeToken {
    return TypeAssert\instance_of(TildeToken::class, $this->_tilde);
  }

  /**
   * @return TildeToken
   */
  public function getTildex(): TildeToken {
    return $this->getTilde();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_tilde, $value);
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | LikeTypeSpecifier |
   * SimpleTypeSpecifier | TypeConstant | VarrayTypeSpecifier |
   * VectorTypeSpecifier
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | LikeTypeSpecifier |
   * SimpleTypeSpecifier | TypeConstant | VarrayTypeSpecifier |
   * VectorTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }
}
