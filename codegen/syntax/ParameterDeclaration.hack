/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<84690cfa1ca19e80952ff2a96e858c41>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
abstract class ParameterDeclarationGeneratedBase
  extends Node
  implements IHasTypeHint, IHasAttributeSpec, IParameter {

  const string SYNTAX_KIND = 'parameter_declaration';

  private Node $_attribute;
  private Node $_visibility;
  private Node $_call_convention;
  private Node $_type;
  private Node $_name;
  private Node $_default_value;

  public function __construct(
    Node $attribute,
    Node $visibility,
    Node $call_convention,
    Node $type,
    Node $name,
    Node $default_value,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute = $attribute;
    $this->_visibility = $visibility;
    $this->_call_convention = $call_convention;
    $this->_type = $type;
    $this->_name = $name;
    $this->_default_value = $default_value;
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
    $attribute = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['parameter_attribute'],
      $file,
      $offset,
      $source,
      'AttributeSpecification',
    );
    $offset += $attribute->getWidth();
    $visibility = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['parameter_visibility'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $visibility->getWidth();
    $call_convention = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['parameter_call_convention'],
      $file,
      $offset,
      $source,
      'InoutToken',
    );
    $offset += $call_convention->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['parameter_type'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['parameter_name'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $name->getWidth();
    $default_value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['parameter_default_value'],
      $file,
      $offset,
      $source,
      'SimpleInitializer',
    );
    $offset += $default_value->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $attribute,
      $visibility,
      $call_convention,
      $type,
      $name,
      $default_value,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute' => $this->_attribute,
      'visibility' => $this->_visibility,
      'call_convention' => $this->_call_convention,
      'type' => $this->_type,
      'name' => $this->_name,
      'default_value' => $this->_default_value,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute = $rewriter($this->_attribute, $parents);
    $visibility = $rewriter($this->_visibility, $parents);
    $call_convention = $rewriter($this->_call_convention, $parents);
    $type = $rewriter($this->_type, $parents);
    $name = $rewriter($this->_name, $parents);
    $default_value = $rewriter($this->_default_value, $parents);
    if (
      $attribute === $this->_attribute &&
      $visibility === $this->_visibility &&
      $call_convention === $this->_call_convention &&
      $type === $this->_type &&
      $name === $this->_name &&
      $default_value === $this->_default_value
    ) {
      return $this;
    }
    return new static(
      $attribute,
      $visibility,
      $call_convention,
      $type,
      $name,
      $default_value,
    );
  }

  public function getAttributeUNTYPED(): Node {
    return $this->_attribute;
  }

  public function withAttribute(?AttributeSpecification $value): this {
    if ($value === $this->_attribute) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_visibility,
      $this->_call_convention,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasAttribute(): bool {
    return !$this->_attribute->isMissing();
  }

  /**
   * @return AttributeSpecification | null
   */
  public function getAttribute(): ?AttributeSpecification {
    if ($this->_attribute->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute,
    );
  }

  /**
   * @return AttributeSpecification
   */
  public function getAttributex(): AttributeSpecification {
    return TypeAssert\not_null($this->getAttribute());
  }

  public function getVisibilityUNTYPED(): Node {
    return $this->_visibility;
  }

  public function withVisibility(?Token $value): this {
    if ($value === $this->_visibility) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $value ?? Missing(),
      $this->_call_convention,
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasVisibility(): bool {
    return !$this->_visibility->isMissing();
  }

  /**
   * @return null | PrivateToken | ProtectedToken | PublicToken
   */
  public function getVisibility(): ?Token {
    if ($this->_visibility->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(Token::class, $this->_visibility);
  }

  /**
   * @return PrivateToken | ProtectedToken | PublicToken
   */
  public function getVisibilityx(): Token {
    return TypeAssert\not_null($this->getVisibility());
  }

  public function getCallConventionUNTYPED(): Node {
    return $this->_call_convention;
  }

  public function withCallConvention(?InoutToken $value): this {
    if ($value === $this->_call_convention) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_visibility,
      $value ?? Missing(),
      $this->_type,
      $this->_name,
      $this->_default_value,
    );
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
    return TypeAssert\not_null($this->getCallConvention());
  }

  public function getTypeUNTYPED(): Node {
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
      $value ?? Missing(),
      $this->_name,
      $this->_default_value,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DarrayTypeSpecifier | DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | LikeTypeSpecifier | MapArrayTypeSpecifier | null |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * SoftTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorArrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getType(): ?ITypeSpecifier {
    if ($this->_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClassnameTypeSpecifier | ClosureTypeSpecifier |
   * DarrayTypeSpecifier | DictionaryTypeSpecifier | GenericTypeSpecifier |
   * KeysetTypeSpecifier | LikeTypeSpecifier | MapArrayTypeSpecifier |
   * NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * SoftTypeSpecifier | TupleTypeSpecifier | TypeConstant |
   * VarrayTypeSpecifier | VectorArrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return TypeAssert\not_null($this->getType());
  }

  public function getNameUNTYPED(): Node {
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
      $this->_type,
      $value ?? Missing(),
      $this->_default_value,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
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

  public function getDefaultValueUNTYPED(): Node {
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
      $this->_type,
      $this->_name,
      $value ?? Missing(),
    );
  }

  public function hasDefaultValue(): bool {
    return !$this->_default_value->isMissing();
  }

  /**
   * @return null | SimpleInitializer
   */
  public function getDefaultValue(): ?SimpleInitializer {
    if ($this->_default_value->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      SimpleInitializer::class,
      $this->_default_value,
    );
  }

  /**
   * @return SimpleInitializer
   */
  public function getDefaultValuex(): SimpleInitializer {
    return TypeAssert\not_null($this->getDefaultValue());
  }
}
