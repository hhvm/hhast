/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<49b2045c7d6bc20d1fcc1b8ae20c73af>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ClosureParameterTypeSpecifier
  extends Node
  implements ITypeSpecifier {

  const string SYNTAX_KIND = 'closure_parameter_type_specifier';

  private ?InoutToken $_call_convention;
  private ?Node $_readonly;
  private ITypeSpecifier $_type;

  public function __construct(
    ?InoutToken $call_convention,
    ?Node $readonly,
    ITypeSpecifier $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_call_convention = $call_convention;
    $this->_readonly = $readonly;
    $this->_type = $type;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $call_convention = Node::fromJSON(
      ($json['closure_parameter_call_convention'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'InoutToken',
    );
    $offset += $call_convention?->getWidth() ?? 0;
    $readonly = Node::fromJSON(
      ($json['closure_parameter_readonly'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $readonly?->getWidth() ?? 0;
    $type = Node::fromJSON(
      ($json['closure_parameter_type']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $readonly,
      /* HH_IGNORE_ERROR[4110] */ $type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'call_convention' => $this->_call_convention,
      'readonly' => $this->_readonly,
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
    $readonly =
      $this->_readonly === null ? null : $rewriter($this->_readonly, $parents);
    $type = $rewriter($this->_type, $parents);
    if (
      $call_convention === $this->_call_convention &&
      $readonly === $this->_readonly &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new static(
      $call_convention as ?InoutToken,
      $readonly as ?Node,
      $type as ITypeSpecifier,
    );
  }

  public function getCallConventionUNTYPED(): ?Node {
    return $this->_call_convention;
  }

  public function withCallConvention(?InoutToken $value): this {
    if ($value === $this->_call_convention) {
      return $this;
    }
    return new static($value, $this->_readonly, $this->_type);
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

  public function getReadonlyUNTYPED(): ?Node {
    return $this->_readonly;
  }

  public function withReadonly(?Node $value): this {
    if ($value === $this->_readonly) {
      return $this;
    }
    return new static($this->_call_convention, $value, $this->_type);
  }

  public function hasReadonly(): bool {
    return $this->_readonly !== null;
  }

  /**
   * @return null
   */
  public function getReadonly(): ?Node {
    return $this->_readonly;
  }

  /**
   * @return
   */
  public function getReadonlyx(): Node {
    return TypeAssert\not_null($this->getReadonly());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_call_convention, $this->_readonly, $value);
  }

  public function hasType(): bool {
    return true;
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
