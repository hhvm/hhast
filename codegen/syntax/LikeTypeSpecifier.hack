/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f1761edb31e703830d44b3450dea0489>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class LikeTypeSpecifier extends EditableNode {

  private EditableNode $_tilde;
  private EditableNode $_type;

  public function __construct(
    EditableNode $tilde,
    EditableNode $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_tilde = $tilde;
    $this->_type = $type;
    parent::__construct('like_type_specifier', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $tilde = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['like_tilde'],
      $file,
      $offset,
      $source,
    );
    $offset += $tilde->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['like_type'],
      $file,
      $offset,
      $source,
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'tilde' => $this->_tilde,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $tilde = $rewriter($this->_tilde, $parents);
    $type = $rewriter($this->_type, $parents);
    if ($tilde === $this->_tilde && $type === $this->_type) {
      return $this;
    }
    return new static($tilde, $type);
  }

  public function getTildeUNTYPED(): EditableNode {
    return $this->_tilde;
  }

  public function withTilde(EditableNode $value): this {
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

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_tilde, $value);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getTypex(): EditableNode {
    return $this->getType();
  }
}
