<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7aafb8bc2d36a63169ebae787f279f96>>
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
  ) {
    parent::__construct('closure_parameter_type_specifier');
    $this->_call_convention = $call_convention;
    $this->_type = $type;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
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
    return new static($call_convention, $type);
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
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
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
   * @returns Missing | InoutToken
   */
  public function getCallConvention(): ?InoutToken {
    if ($this->_call_convention->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(InoutToken::class, $this->_call_convention);
  }

  /**
   * @returns InoutToken
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
   * @returns SimpleTypeSpecifier | NullableTypeSpecifier |
   * GenericTypeSpecifier | SoftTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }
}
