/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<16714f1f7a5d88e8d45b6b736e61bc5c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class SoftTypeSpecifier extends EditableNode implements ITypeSpecifier {

  private EditableNode $_at;
  private EditableNode $_type;

  public function __construct(
    EditableNode $at,
    EditableNode $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_at = $at;
    $this->_type = $type;
    parent::__construct('soft_type_specifier', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $at = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['soft_at'],
      $file,
      $offset,
      $source,
    );
    $offset += $at->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['soft_type'],
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
    return new static($at, $type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'at' => $this->_at,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $at = $rewriter($this->_at, $parents);
    $type = $rewriter($this->_type, $parents);
    if ($at === $this->_at && $type === $this->_type) {
      return $this;
    }
    return new static($at, $type);
  }

  public function getAtUNTYPED(): EditableNode {
    return $this->_at;
  }

  public function withAt(EditableNode $value): this {
    if ($value === $this->_at) {
      return $this;
    }
    return new static($value, $this->_type);
  }

  public function hasAt(): bool {
    return !$this->_at->isMissing();
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

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_at, $value);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier |
   * MapArrayTypeSpecifier | NullableTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier |
   * MapArrayTypeSpecifier | NullableTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }
}
