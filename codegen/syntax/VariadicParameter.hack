/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f6213107e58ce2e561b07b1c25f4d787>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class VariadicParameter
  extends EditableNode
  implements IHasTypeHint, IParameter, ITypeSpecifier {

  const string SYNTAX_KIND = 'variadic_parameter';

  private EditableNode $_call_convention;
  private EditableNode $_type;
  private EditableNode $_ellipsis;

  public function __construct(
    EditableNode $call_convention,
    EditableNode $type,
    EditableNode $ellipsis,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_call_convention = $call_convention;
    $this->_type = $type;
    $this->_ellipsis = $ellipsis;
    parent::__construct($source_ref);
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($call_convention, $type, $ellipsis, $source_ref);
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $call_convention = $rewriter($this->_call_convention, $parents);
    $type = $rewriter($this->_type, $parents);
    $ellipsis = $rewriter($this->_ellipsis, $parents);
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
   * @return null
   */
  public function getCallConvention(): ?EditableNode {
    if ($this->_call_convention->isMissing()) {
      return null;
    }
    return $this->_call_convention;
  }

  /**
   * @return
   */
  public function getCallConventionx(): EditableNode {
    return TypeAssert\not_null($this->getCallConvention());
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
   * @return ClosureTypeSpecifier | null | SimpleTypeSpecifier |
   * TupleTypeSpecifier
   */
  public function getType(): ?ITypeSpecifier {
    if ($this->_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return TypeAssert\not_null($this->getType());
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
   * @return DotDotDotToken
   */
  public function getEllipsis(): DotDotDotToken {
    return TypeAssert\instance_of(DotDotDotToken::class, $this->_ellipsis);
  }

  /**
   * @return DotDotDotToken
   */
  public function getEllipsisx(): DotDotDotToken {
    return $this->getEllipsis();
  }
}
