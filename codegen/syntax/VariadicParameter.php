<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<63ca3eb889597fd2f6c629df43488f0c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class VariadicParameter extends EditableNode {

  private EditableNode $_call_convention;
  private EditableNode $_type;
  private EditableNode $_ellipsis;

  public function __construct(
    EditableNode $call_convention,
    EditableNode $type,
    EditableNode $ellipsis,
  ) {
    parent::__construct('variadic_parameter');
    $this->_call_convention = $call_convention;
    $this->_type = $type;
    $this->_ellipsis = $ellipsis;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $call_convention = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['variadic_parameter_call_convention'],
      $file,
      $offset,
      $source,
    );
    $offset += $call_convention->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['variadic_parameter_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $ellipsis = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['variadic_parameter_ellipsis'],
      $file,
      $offset,
      $source,
    );
    $offset += $ellipsis->getWidth();
    return new static($call_convention, $type, $ellipsis);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'call_convention' => $this->_call_convention,
      'type' => $this->_type,
      'ellipsis' => $this->_ellipsis,
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
    $ellipsis = $this->_ellipsis->rewrite($rewriter, $parents);
    if (
      $call_convention === $this->_call_convention &&
      $type === $this->_type &&
      $ellipsis === $this->_ellipsis
    ) {
      return $this;
    }
    return new static($call_convention, $type, $ellipsis);
  }

  public function getCallConventionUNTYPED(): EditableNode {
    return $this->_call_convention;
  }

  public function withCallConvention(EditableNode $value): this {
    if ($value === $this->_call_convention) {
      return $this;
    }
    return new static($value, $this->_type, $this->_ellipsis);
  }

  public function hasCallConvention(): bool {
    return !$this->_call_convention->isMissing();
  }

  /**
   * @returns Missing
   */
  public function getCallConvention(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_call_convention);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_call_convention, $value, $this->_ellipsis);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @returns ClosureTypeSpecifier | Missing | SimpleTypeSpecifier |
   * TupleTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  public function getEllipsisUNTYPED(): EditableNode {
    return $this->_ellipsis;
  }

  public function withEllipsis(EditableNode $value): this {
    if ($value === $this->_ellipsis) {
      return $this;
    }
    return new static($this->_call_convention, $this->_type, $value);
  }

  public function hasEllipsis(): bool {
    return !$this->_ellipsis->isMissing();
  }

  /**
   * @returns DotDotDotToken
   */
  public function getEllipsis(): DotDotDotToken {
    return TypeAssert\instance_of(DotDotDotToken::class, $this->_ellipsis);
  }
}
