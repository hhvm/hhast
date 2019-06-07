/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0d8d6db37d832ce5c35db9b7f65aa977>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class LikeTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'like_type_specifier';

  private Node $_tilde;
  private Node $_type;

  public function __construct(
    Node $tilde,
    Node $type,
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
    $offset += $tilde->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['like_type'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($tilde, $type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'tilde' => $this->_tilde,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $tilde = $rewriter($this->_tilde, $parents);
    $type = $rewriter($this->_type, $parents);
    if ($tilde === $this->_tilde && $type === $this->_type) {
      return $this;
    }
    return new static($tilde, $type);
  }

  public function getTildeUNTYPED(): Node {
    return $this->_tilde;
  }

  public function withTilde(Node $value): this {
    if ($value === $this->_tilde) {
      return $this;
    }
    return new static($value, $this->_type);
  }

  public function hasTilde(): bool {
    return !$this->_tilde->isMissing();
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

  public function getTypeUNTYPED(): Node {
    return $this->_type;
  }

  public function withType(Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_tilde, $value);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return ClosureTypeSpecifier | DictionaryTypeSpecifier |
   * GenericTypeSpecifier | LikeTypeSpecifier | SimpleTypeSpecifier |
   * TypeConstant
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | DictionaryTypeSpecifier |
   * GenericTypeSpecifier | LikeTypeSpecifier | SimpleTypeSpecifier |
   * TypeConstant
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }
}
