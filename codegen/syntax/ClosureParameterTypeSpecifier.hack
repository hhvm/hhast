/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<70b697e1f2358c33d27c3c7e49773fda>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ClosureParameterTypeSpecifier extends EditableNode {

  private EditableNode $_call_convention;
  private EditableNode $_type;

  public function __construct(
    EditableNode $call_convention,
    EditableNode $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_call_convention = $call_convention;
    $this->_type = $type;
    parent::__construct('closure_parameter_type_specifier', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $call_convention = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_parameter_call_convention'],
      $file,
      $offset,
      $source,
    );
    $offset += $call_convention->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['closure_parameter_type'],
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
    return new static($call_convention, $type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'call_convention' => $this->_call_convention,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $call_convention = $this->_call_convention->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    if (
      $call_convention === $this->_call_convention && $type === $this->_type
    ) {
      return $this;
    }
    return new static($call_convention, $type);
  }

  public function getCallConventionUNTYPED(): EditableNode {
    return $this->_call_convention;
  }

  public function withCallConvention(EditableNode $value): this {
    if ($value === $this->_call_convention) {
      return $this;
    }
    return new static($value, $this->_type);
  }

  public function hasCallConvention(): bool {
    return !$this->_call_convention->isMissing();
  }

  /**
   * @return null | InoutToken
   */
  public function getCallConvention(): ?InoutToken {
    if ($this->_call_convention->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(InoutToken::class, $this->_call_convention);
  }

  /**
   * @return InoutToken
   */
  public function getCallConventionx(): InoutToken {
    return TypeAssert\instance_of(InoutToken::class, $this->_call_convention);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_call_convention, $value);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | SoftTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | SoftTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant
   */
  public function getTypex(): EditableNode {
    return $this->getType();
  }
}
