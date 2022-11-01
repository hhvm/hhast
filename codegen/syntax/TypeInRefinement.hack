/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b5724786f5fe26a776e89e80aa56d044>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class TypeInRefinement extends Node {

  const string SYNTAX_KIND = 'type_in_refinement';

  private TypeToken $_keyword;
  private NameToken $_name;
  private ?Node $_type_parameters;
  private ?Node $_constraints;
  private EqualToken $_equal;
  private ITypeSpecifier $_type;

  public function __construct(
    TypeToken $keyword,
    NameToken $name,
    ?Node $type_parameters,
    ?Node $constraints,
    EqualToken $equal,
    ITypeSpecifier $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_type_parameters = $type_parameters;
    $this->_constraints = $constraints;
    $this->_equal = $equal;
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
    $keyword = Node::fromJSON(
      ($json['type_in_refinement_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'TypeToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      ($json['type_in_refinement_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $type_parameters = Node::fromJSON(
      ($json['type_in_refinement_type_parameters'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type_parameters?->getWidth() ?? 0;
    $constraints = Node::fromJSON(
      ($json['type_in_refinement_constraints'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $constraints?->getWidth() ?? 0;
    $equal = Node::fromJSON(
      ($json['type_in_refinement_equal']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $equal = $equal as nonnull;
    $offset += $equal->getWidth();
    $type = Node::fromJSON(
      ($json['type_in_refinement_type']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $type_parameters,
      /* HH_IGNORE_ERROR[4110] */ $constraints,
      /* HH_IGNORE_ERROR[4110] */ $equal,
      /* HH_IGNORE_ERROR[4110] */ $type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'type_parameters' => $this->_type_parameters,
      'constraints' => $this->_constraints,
      'equal' => $this->_equal,
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
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $type_parameters = $this->_type_parameters === null
      ? null
      : $rewriter($this->_type_parameters, $parents);
    $constraints = $this->_constraints === null
      ? null
      : $rewriter($this->_constraints, $parents);
    $equal = $rewriter($this->_equal, $parents);
    $type = $rewriter($this->_type, $parents);
    if (
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $type_parameters === $this->_type_parameters &&
      $constraints === $this->_constraints &&
      $equal === $this->_equal &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new static(
      $keyword as TypeToken,
      $name as NameToken,
      $type_parameters as ?Node,
      $constraints as ?Node,
      $equal as EqualToken,
      $type as ITypeSpecifier,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(TypeToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_name,
      $this->_type_parameters,
      $this->_constraints,
      $this->_equal,
      $this->_type,
    );
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return TypeToken
   */
  public function getKeyword(): TypeToken {
    return TypeAssert\instance_of(TypeToken::class, $this->_keyword);
  }

  /**
   * @return TypeToken
   */
  public function getKeywordx(): TypeToken {
    return $this->getKeyword();
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(NameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_type_parameters,
      $this->_constraints,
      $this->_equal,
      $this->_type,
    );
  }

  public function hasName(): bool {
    return true;
  }

  /**
   * @return NameToken
   */
  public function getName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  /**
   * @return NameToken
   */
  public function getNamex(): NameToken {
    return $this->getName();
  }

  public function getTypeParametersUNTYPED(): ?Node {
    return $this->_type_parameters;
  }

  public function withTypeParameters(?Node $value): this {
    if ($value === $this->_type_parameters) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_name,
      $value,
      $this->_constraints,
      $this->_equal,
      $this->_type,
    );
  }

  public function hasTypeParameters(): bool {
    return $this->_type_parameters !== null;
  }

  /**
   * @return null
   */
  public function getTypeParameters(): ?Node {
    return $this->_type_parameters;
  }

  /**
   * @return
   */
  public function getTypeParametersx(): Node {
    return TypeAssert\not_null($this->getTypeParameters());
  }

  public function getConstraintsUNTYPED(): ?Node {
    return $this->_constraints;
  }

  public function withConstraints(?Node $value): this {
    if ($value === $this->_constraints) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_name,
      $this->_type_parameters,
      $value,
      $this->_equal,
      $this->_type,
    );
  }

  public function hasConstraints(): bool {
    return $this->_constraints !== null;
  }

  /**
   * @return null
   */
  public function getConstraints(): ?Node {
    return $this->_constraints;
  }

  /**
   * @return
   */
  public function getConstraintsx(): Node {
    return TypeAssert\not_null($this->getConstraints());
  }

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(EqualToken $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_constraints,
      $value,
      $this->_type,
    );
  }

  public function hasEqual(): bool {
    return true;
  }

  /**
   * @return EqualToken
   */
  public function getEqual(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  /**
   * @return EqualToken
   */
  public function getEqualx(): EqualToken {
    return $this->getEqual();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_constraints,
      $this->_equal,
      $value,
    );
  }

  public function hasType(): bool {
    return true;
  }

  /**
   * @return SimpleTypeSpecifier | TypeConstant
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return SimpleTypeSpecifier | TypeConstant
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }
}
