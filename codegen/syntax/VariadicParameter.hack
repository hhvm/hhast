/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<31548ed0cbd5823c1aa1f727b8f939c6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class VariadicParameter
  extends Node
  implements IHasTypeHint, IParameter, ITypeSpecifier {

  const string SYNTAX_KIND = 'variadic_parameter';

  private ?Node $_call_convention;
  private ?ITypeSpecifier $_type;
  private DotDotDotToken $_ellipsis;

  public function __construct(
    ?Node $call_convention,
    ?ITypeSpecifier $type,
    DotDotDotToken $ellipsis,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $call_convention = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['variadic_parameter_call_convention'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $call_convention?->getWidth() ?? 0;
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['variadic_parameter_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type?->getWidth() ?? 0;
    $ellipsis = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['variadic_parameter_ellipsis'],
      $file,
      $offset,
      $source,
      'DotDotDotToken',
    );
    $ellipsis = $ellipsis as nonnull;
    $offset += $ellipsis->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $call_convention,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $ellipsis,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'call_convention' => $this->_call_convention,
      'type' => $this->_type,
      'ellipsis' => $this->_ellipsis,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $call_convention = $this->_call_convention === null
      ? null
      : $rewriter($this->_call_convention, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $ellipsis = $rewriter($this->_ellipsis, $parents);
    if (
      $call_convention === $this->_call_convention &&
      $type === $this->_type &&
      $ellipsis === $this->_ellipsis
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $call_convention,
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $ellipsis,
    );
  }

  public function getCallConventionUNTYPED(): ?Node {
    return $this->_call_convention;
  }

  public function withCallConvention(?Node $value): this {
    if ($value === $this->_call_convention) {
      return $this;
    }
    return new static($value, $this->_type, $this->_ellipsis);
  }

  public function hasCallConvention(): bool {
    return $this->_call_convention !== null;
  }

  /**
   * @return null
   */
  public function getCallConvention(): ?Node {
    return $this->_call_convention;
  }

  /**
   * @return
   */
  public function getCallConventionx(): Node {
    return TypeAssert\not_null($this->getCallConvention());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_call_convention, $value, $this->_ellipsis);
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return ClosureTypeSpecifier | null | SimpleTypeSpecifier |
   * TupleTypeSpecifier
   */
  public function getType(): ?ITypeSpecifier {
    return $this->_type;
  }

  /**
   * @return ClosureTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return TypeAssert\not_null($this->getType());
  }

  public function getEllipsisUNTYPED(): ?Node {
    return $this->_ellipsis;
  }

  public function withEllipsis(DotDotDotToken $value): this {
    if ($value === $this->_ellipsis) {
      return $this;
    }
    return new static($this->_call_convention, $this->_type, $value);
  }

  public function hasEllipsis(): bool {
    return $this->_ellipsis !== null;
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
