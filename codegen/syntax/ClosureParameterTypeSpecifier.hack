/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9e491d253ebc710bc5a17115de48d6ac>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ClosureParameterTypeSpecifier
  extends Node
  implements ITypeSpecifier {

  const string SYNTAX_KIND = 'closure_parameter_type_specifier';

  private ?InoutToken $_call_convention;
  private ITypeSpecifier $_type;

  public function __construct(
    ?InoutToken $call_convention,
    ITypeSpecifier $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_call_convention = $call_convention;
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
    $call_convention = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_parameter_call_convention'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'InoutToken',
    );
    $offset += $call_convention?->getWidth() ?? 0;
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['closure_parameter_type'],
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
      /* HH_IGNORE_ERROR[4110] */ $call_convention,
      /* HH_IGNORE_ERROR[4110] */ $type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'call_convention' => $this->_call_convention,
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
    $call_convention = $this->_call_convention === null
      ? null
      : $rewriter($this->_call_convention, $parents);
    $type = $rewriter($this->_type, $parents);
    if (
      $call_convention === $this->_call_convention && $type === $this->_type
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $call_convention,
      /* HH_FIXME[4110] use `as` */ $type,
    );
  }

  public function getCallConventionUNTYPED(): ?Node {
    return $this->_call_convention;
  }

  public function withCallConvention(?InoutToken $value): this {
    if ($value === $this->_call_convention) {
      return $this;
    }
    return new static($value, $this->_type);
  }

  public function hasCallConvention(): bool {
    return $this->_call_convention !== null;
  }

  /**
   * @return null | InoutToken
   */
  public function getCallConvention(): ?InoutToken {
    return $this->_call_convention;
  }

  /**
   * @return InoutToken
   */
  public function getCallConventionx(): InoutToken {
    return TypeAssert\not_null($this->getCallConvention());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_call_convention, $value);
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return AttributizedSpecifier | ClosureTypeSpecifier |
   * GenericTypeSpecifier | NullableTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return AttributizedSpecifier | ClosureTypeSpecifier |
   * GenericTypeSpecifier | NullableTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | TypeConstant
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }
}
