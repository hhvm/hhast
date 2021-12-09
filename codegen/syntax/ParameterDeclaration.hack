/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1a479503fe3a347962036a518871ea84>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ParameterDeclaration
  extends Node
  implements IHasTypeHint, IHasAttributeSpec, IParameter {

  use AttributeAsAttributeSpecTrait;

  const string SYNTAX_KIND = 'parameter_declaration';

  private ?OldAttributeSpecification $_attribute;
  private ?Token $_visibility;
  private ?InoutToken $_call_convention;
  private ?ReadonlyToken $_readonly;
  private ?ITypeSpecifier $_type;
  private IExpression $_name;
  private ?SimpleInitializer $_default_value;

  public function __construct(
    ?OldAttributeSpecification $attribute,
    ?Token $visibility,
    ?InoutToken $call_convention,
    ?ReadonlyToken $readonly,
    ?ITypeSpecifier $type,
    IExpression $name,
    ?SimpleInitializer $default_value,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute = $attribute;
    $this->_visibility = $visibility;
    $this->_call_convention = $call_convention;
    $this->_readonly = $readonly;
    $this->_type = $type;
    $this->_name = $name;
    $this->_default_value = $default_value;
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
    $attribute = Node::fromJSON(
      ($json['parameter_attribute'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute?->getWidth() ?? 0;
    $visibility = Node::fromJSON(
      ($json['parameter_visibility'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $visibility?->getWidth() ?? 0;
    $call_convention = Node::fromJSON(
      ($json['parameter_call_convention'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'InoutToken',
    );
    $offset += $call_convention?->getWidth() ?? 0;
    $readonly = Node::fromJSON(
      ($json['parameter_readonly'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ReadonlyToken',
    );
    $offset += $readonly?->getWidth() ?? 0;
    $type = Node::fromJSON(
      ($json['parameter_type'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type?->getWidth() ?? 0;
    $name = Node::fromJSON(
      ($json['parameter_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $default_value = Node::fromJSON(
      ($json['parameter_default_value'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'SimpleInitializer',
    );
    $offset += $default_value?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $attribute,
      /* HH_IGNORE_ERROR[4110] */ $visibility,
      /* HH_IGNORE_ERROR[4110] */ $call_convention,
      /* HH_IGNORE_ERROR[4110] */ $readonly,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $default_value,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute' => $this->_attribute,
      'visibility' => $this->_visibility,
      'call_convention' => $this->_call_convention,
      'readonly' => $this->_readonly,
      'type' => $this->_type,
      'name' => $this->_name,
      'default_value' => $this->_default_value,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute = $this->_attribute === null
      ? null
      : $rewriter($this->_attribute, $parents);
    $visibility = $this->_visibility === null
      ? null
      : $rewriter($this->_visibility, $parents);
    $call_convention = $this->_call_convention === null
      ? null
      : $rewriter($this->_call_convention, $parents);
    $readonly =
      $this->_readonly === null ? null : $rewriter($this->_readonly, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $name = $rewriter($this->_name, $parents);
    $default_value = $this->_default_value === null
      ? null
      : $rewriter($this->_default_value, $parents);
    if (
      $attribute === $this->_attribute &&
      $visibility === $this->_visibility &&
      $call_convention === $this->_call_convention &&
      $readonly === $this->_readonly &&
      $type === $this->_type &&
      $name === $this->_name &&
      $default_value === $this->_default_value
    ) {
      return $this;
    }
    return new static(
      $attribute as ?OldAttributeSpecification,
      $visibility as ?Token,
      $call_convention as ?InoutToken,
      $readonly as ?ReadonlyToken,
      $type as ?ITypeSpecifier,
      $name as IExpression,
      $default_value as ?SimpleInitializer,
    );
  }

  <<__Override>>
  public function getAttributeUNTYPED(): ?Node {
    return $this->_attribute;
  }

  public function withAttribute(?OldAttributeSpecification $value): this {
    if ($value === $this->_attribute) {
      return $this;
    }
    return new static(
      $value,
      $this->_visibility,
      $this->_call_convention,
      $this->_readonly,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  <<__Override>>
  public function hasAttribute(): bool {
    return $this->_attribute !== null;
  }

  /**
   * @return null | OldAttributeSpecification
   */
  <<__Override>>
  public function getAttribute(): ?OldAttributeSpecification {
    return $this->_attribute;
  }

  /**
   * @return OldAttributeSpecification
   */
  <<__Override>>
  public function getAttributex(): OldAttributeSpecification {
    return TypeAssert\not_null($this->getAttribute());
  }

  public function getVisibilityUNTYPED(): ?Node {
    return $this->_visibility;
  }

  public function withVisibility(?Token $value): this {
    if ($value === $this->_visibility) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $value,
      $this->_call_convention,
      $this->_readonly,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasVisibility(): bool {
    return $this->_visibility !== null;
  }

  /**
   * @return null | PrivateToken | ProtectedToken | PublicToken
   */
  public function getVisibility(): ?Token {
    return $this->_visibility;
  }

  /**
   * @return PrivateToken | ProtectedToken | PublicToken
   */
  public function getVisibilityx(): Token {
    return TypeAssert\not_null($this->getVisibility());
  }

  public function getCallConventionUNTYPED(): ?Node {
    return $this->_call_convention;
  }

  public function withCallConvention(?InoutToken $value): this {
    if ($value === $this->_call_convention) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_visibility,
      $value,
      $this->_readonly,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
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

  public function withReadonly(?ReadonlyToken $value): this {
    if ($value === $this->_readonly) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_visibility,
      $this->_call_convention,
      $value,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasReadonly(): bool {
    return $this->_readonly !== null;
  }

  /**
   * @return null | ReadonlyToken
   */
  public function getReadonly(): ?ReadonlyToken {
    return $this->_readonly;
  }

  /**
   * @return ReadonlyToken
   */
  public function getReadonlyx(): ReadonlyToken {
    return TypeAssert\not_null($this->getReadonly());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_visibility,
      $this->_call_convention,
      $this->_readonly,
      $value,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DarrayTypeSpecifier | DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | LikeTypeSpecifier | null | NullableTypeSpecifier |
   * ShapeTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getType(): ?ITypeSpecifier {
    return $this->_type;
  }

  /**
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DarrayTypeSpecifier | DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | LikeTypeSpecifier | NullableTypeSpecifier |
   * ShapeTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return TypeAssert\not_null($this->getType());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(IExpression $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_visibility,
      $this->_call_convention,
      $this->_readonly,
      $this->_type,
      $value,
      $this->_default_value,
    );
  }

  public function hasName(): bool {
    return true;
  }

  /**
   * @return DecoratedExpression | VariableToken
   */
  public function getName(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_name);
  }

  /**
   * @return DecoratedExpression | VariableToken
   */
  public function getNamex(): IExpression {
    return $this->getName();
  }

  public function getDefaultValueUNTYPED(): ?Node {
    return $this->_default_value;
  }

  public function withDefaultValue(?SimpleInitializer $value): this {
    if ($value === $this->_default_value) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_visibility,
      $this->_call_convention,
      $this->_readonly,
      $this->_type,
      $this->_name,
      $value,
    );
  }

  public function hasDefaultValue(): bool {
    return $this->_default_value !== null;
  }

  /**
   * @return null | SimpleInitializer
   */
  public function getDefaultValue(): ?SimpleInitializer {
    return $this->_default_value;
  }

  /**
   * @return SimpleInitializer
   */
  public function getDefaultValuex(): SimpleInitializer {
    return TypeAssert\not_null($this->getDefaultValue());
  }
}
