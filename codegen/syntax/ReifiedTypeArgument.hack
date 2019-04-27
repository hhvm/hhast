/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a6a45e933e68bdd246d8384c195ca458>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ReifiedTypeArgument extends EditableNode {

  private EditableNode $_reified;
  private EditableNode $_type;

  public function __construct(
    EditableNode $reified,
    EditableNode $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_reified = $reified;
    $this->_type = $type;
    parent::__construct('reified_type_argument', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $reified = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['reified_type_argument_reified'],
      $file,
      $offset,
      $source,
    );
    $offset += $reified->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['reified_type_argument_type'],
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
    return new static($reified, $type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'reified' => $this->_reified,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $reified = $this->_reified->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    if ($reified === $this->_reified && $type === $this->_type) {
      return $this;
    }
    return new static($reified, $type);
  }

  public function getReifiedUNTYPED(): EditableNode {
    return $this->_reified;
  }

  public function withReified(EditableNode $value): this {
    if ($value === $this->_reified) {
      return $this;
    }
    return new static($value, $this->_type);
  }

  public function hasReified(): bool {
    return !$this->_reified->isMissing();
  }

  /**
   * @return ReifyToken
   */
  public function getReified(): ReifyToken {
    return TypeAssert\instance_of(ReifyToken::class, $this->_reified);
  }

  /**
   * @return ReifyToken
   */
  public function getReifiedx(): ReifyToken {
    return $this->getReified();
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_reified, $value);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getType(): SimpleTypeSpecifier {
    return TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_type);
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getTypex(): SimpleTypeSpecifier {
    return $this->getType();
  }
}
