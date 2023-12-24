/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1b8256fac85477af8b84b5f34bce6029>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class CtxInRefinement extends Node {

  const string SYNTAX_KIND = 'ctx_in_refinement';

  private ?Node $_keyword;
  private ?Node $_name;
  private ?Node $_type_parameters;
  private ?Node $_constraints;
  private ?Node $_equal;
  private ?Node $_ctx_list;

  public function __construct(
    ?Node $keyword,
    ?Node $name,
    ?Node $type_parameters,
    ?Node $constraints,
    ?Node $equal,
    ?Node $ctx_list,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_type_parameters = $type_parameters;
    $this->_constraints = $constraints;
    $this->_equal = $equal;
    $this->_ctx_list = $ctx_list;
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
      ($json['ctx_in_refinement_keyword'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $keyword?->getWidth() ?? 0;
    $name = Node::fromJSON(
      ($json['ctx_in_refinement_name'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $type_parameters = Node::fromJSON(
      ($json['ctx_in_refinement_type_parameters'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type_parameters?->getWidth() ?? 0;
    $constraints = Node::fromJSON(
      ($json['ctx_in_refinement_constraints'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $constraints?->getWidth() ?? 0;
    $equal = Node::fromJSON(
      ($json['ctx_in_refinement_equal'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $equal?->getWidth() ?? 0;
    $ctx_list = Node::fromJSON(
      ($json['ctx_in_refinement_ctx_list'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $ctx_list?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $name,
      $type_parameters,
      $constraints,
      $equal,
      $ctx_list,
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
      'ctx_list' => $this->_ctx_list,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword =
      $this->_keyword === null ? null : $rewriter($this->_keyword, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $type_parameters = $this->_type_parameters === null
      ? null
      : $rewriter($this->_type_parameters, $parents);
    $constraints = $this->_constraints === null
      ? null
      : $rewriter($this->_constraints, $parents);
    $equal = $this->_equal === null ? null : $rewriter($this->_equal, $parents);
    $ctx_list =
      $this->_ctx_list === null ? null : $rewriter($this->_ctx_list, $parents);
    if (
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $type_parameters === $this->_type_parameters &&
      $constraints === $this->_constraints &&
      $equal === $this->_equal &&
      $ctx_list === $this->_ctx_list
    ) {
      return $this;
    }
    return new static(
      $keyword as ?Node,
      $name as ?Node,
      $type_parameters as ?Node,
      $constraints as ?Node,
      $equal as ?Node,
      $ctx_list as ?Node,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(?Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_name,
      $this->_type_parameters,
      $this->_constraints,
      $this->_equal,
      $this->_ctx_list,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getKeyword(): ?Node {
    return $this->_keyword;
  }

  /**
   * @return unknown
   */
  public function getKeywordx(): Node {
    return TypeAssert\not_null($this->getKeyword());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_type_parameters,
      $this->_constraints,
      $this->_equal,
      $this->_ctx_list,
    );
  }

  public function hasName(): bool {
    return $this->_name !== null;
  }

  /**
   * @return unknown
   */
  public function getName(): ?Node {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): Node {
    return TypeAssert\not_null($this->getName());
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
      $this->_ctx_list,
    );
  }

  public function hasTypeParameters(): bool {
    return $this->_type_parameters !== null;
  }

  /**
   * @return unknown
   */
  public function getTypeParameters(): ?Node {
    return $this->_type_parameters;
  }

  /**
   * @return unknown
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
      $this->_ctx_list,
    );
  }

  public function hasConstraints(): bool {
    return $this->_constraints !== null;
  }

  /**
   * @return unknown
   */
  public function getConstraints(): ?Node {
    return $this->_constraints;
  }

  /**
   * @return unknown
   */
  public function getConstraintsx(): Node {
    return TypeAssert\not_null($this->getConstraints());
  }

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(?Node $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_constraints,
      $value,
      $this->_ctx_list,
    );
  }

  public function hasEqual(): bool {
    return $this->_equal !== null;
  }

  /**
   * @return unknown
   */
  public function getEqual(): ?Node {
    return $this->_equal;
  }

  /**
   * @return unknown
   */
  public function getEqualx(): Node {
    return TypeAssert\not_null($this->getEqual());
  }

  public function getCtxListUNTYPED(): ?Node {
    return $this->_ctx_list;
  }

  public function withCtxList(?Node $value): this {
    if ($value === $this->_ctx_list) {
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

  public function hasCtxList(): bool {
    return $this->_ctx_list !== null;
  }

  /**
   * @return unknown
   */
  public function getCtxList(): ?Node {
    return $this->_ctx_list;
  }

  /**
   * @return unknown
   */
  public function getCtxListx(): Node {
    return TypeAssert\not_null($this->getCtxList());
  }
}
