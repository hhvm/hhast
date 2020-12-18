/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5f89c94a5a0b62d441750f9341a21b95>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ContextConstDeclaration extends Node {

  const string SYNTAX_KIND = 'context_const_declaration';

  private ?Node $_modifiers;
  private ?Node $_const_keyword;
  private ?Node $_ctx_keyword;
  private ?Node $_name;
  private ?Node $_type_parameters;
  private ?Node $_constraint;
  private ?Node $_equal;
  private ?Node $_ctx_list;
  private ?Node $_semicolon;

  public function __construct(
    ?Node $modifiers,
    ?Node $const_keyword,
    ?Node $ctx_keyword,
    ?Node $name,
    ?Node $type_parameters,
    ?Node $constraint,
    ?Node $equal,
    ?Node $ctx_list,
    ?Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_modifiers = $modifiers;
    $this->_const_keyword = $const_keyword;
    $this->_ctx_keyword = $ctx_keyword;
    $this->_name = $name;
    $this->_type_parameters = $type_parameters;
    $this->_constraint = $constraint;
    $this->_equal = $equal;
    $this->_ctx_list = $ctx_list;
    $this->_semicolon = $semicolon;
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
    $modifiers = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['context_const_modifiers'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $modifiers?->getWidth() ?? 0;
    $const_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['context_const_const_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $const_keyword?->getWidth() ?? 0;
    $ctx_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['context_const_ctx_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $ctx_keyword?->getWidth() ?? 0;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['context_const_name'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $type_parameters = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['context_const_type_parameters'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type_parameters?->getWidth() ?? 0;
    $constraint = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['context_const_constraint'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $constraint?->getWidth() ?? 0;
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['context_const_equal'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $equal?->getWidth() ?? 0;
    $ctx_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['context_const_ctx_list'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $ctx_list?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['context_const_semicolon'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $semicolon?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $modifiers,
      /* HH_IGNORE_ERROR[4110] */ $const_keyword,
      /* HH_IGNORE_ERROR[4110] */ $ctx_keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $type_parameters,
      /* HH_IGNORE_ERROR[4110] */ $constraint,
      /* HH_IGNORE_ERROR[4110] */ $equal,
      /* HH_IGNORE_ERROR[4110] */ $ctx_list,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'modifiers' => $this->_modifiers,
      'const_keyword' => $this->_const_keyword,
      'ctx_keyword' => $this->_ctx_keyword,
      'name' => $this->_name,
      'type_parameters' => $this->_type_parameters,
      'constraint' => $this->_constraint,
      'equal' => $this->_equal,
      'ctx_list' => $this->_ctx_list,
      'semicolon' => $this->_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $modifiers = $this->_modifiers === null
      ? null
      : $rewriter($this->_modifiers, $parents);
    $const_keyword = $this->_const_keyword === null
      ? null
      : $rewriter($this->_const_keyword, $parents);
    $ctx_keyword = $this->_ctx_keyword === null
      ? null
      : $rewriter($this->_ctx_keyword, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $type_parameters = $this->_type_parameters === null
      ? null
      : $rewriter($this->_type_parameters, $parents);
    $constraint = $this->_constraint === null
      ? null
      : $rewriter($this->_constraint, $parents);
    $equal = $this->_equal === null ? null : $rewriter($this->_equal, $parents);
    $ctx_list = $this->_ctx_list === null
      ? null
      : $rewriter($this->_ctx_list, $parents);
    $semicolon = $this->_semicolon === null
      ? null
      : $rewriter($this->_semicolon, $parents);
    if (
      $modifiers === $this->_modifiers &&
      $const_keyword === $this->_const_keyword &&
      $ctx_keyword === $this->_ctx_keyword &&
      $name === $this->_name &&
      $type_parameters === $this->_type_parameters &&
      $constraint === $this->_constraint &&
      $equal === $this->_equal &&
      $ctx_list === $this->_ctx_list &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $modifiers,
      /* HH_FIXME[4110] use `as` */ $const_keyword,
      /* HH_FIXME[4110] use `as` */ $ctx_keyword,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $type_parameters,
      /* HH_FIXME[4110] use `as` */ $constraint,
      /* HH_FIXME[4110] use `as` */ $equal,
      /* HH_FIXME[4110] use `as` */ $ctx_list,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getModifiersUNTYPED(): ?Node {
    return $this->_modifiers;
  }

  public function withModifiers(?Node $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new static(
      $value,
      $this->_const_keyword,
      $this->_ctx_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_constraint,
      $this->_equal,
      $this->_ctx_list,
      $this->_semicolon,
    );
  }

  public function hasModifiers(): bool {
    return $this->_modifiers !== null;
  }

  /**
   * @return unknown
   */
  public function getModifiers(): ?Node {
    return $this->_modifiers;
  }

  /**
   * @return unknown
   */
  public function getModifiersx(): Node {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getConstKeywordUNTYPED(): ?Node {
    return $this->_const_keyword;
  }

  public function withConstKeyword(?Node $value): this {
    if ($value === $this->_const_keyword) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $value,
      $this->_ctx_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_constraint,
      $this->_equal,
      $this->_ctx_list,
      $this->_semicolon,
    );
  }

  public function hasConstKeyword(): bool {
    return $this->_const_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getConstKeyword(): ?Node {
    return $this->_const_keyword;
  }

  /**
   * @return unknown
   */
  public function getConstKeywordx(): Node {
    return TypeAssert\not_null($this->getConstKeyword());
  }

  public function getCtxKeywordUNTYPED(): ?Node {
    return $this->_ctx_keyword;
  }

  public function withCtxKeyword(?Node $value): this {
    if ($value === $this->_ctx_keyword) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_const_keyword,
      $value,
      $this->_name,
      $this->_type_parameters,
      $this->_constraint,
      $this->_equal,
      $this->_ctx_list,
      $this->_semicolon,
    );
  }

  public function hasCtxKeyword(): bool {
    return $this->_ctx_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getCtxKeyword(): ?Node {
    return $this->_ctx_keyword;
  }

  /**
   * @return unknown
   */
  public function getCtxKeywordx(): Node {
    return TypeAssert\not_null($this->getCtxKeyword());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_const_keyword,
      $this->_ctx_keyword,
      $value,
      $this->_type_parameters,
      $this->_constraint,
      $this->_equal,
      $this->_ctx_list,
      $this->_semicolon,
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
      $this->_modifiers,
      $this->_const_keyword,
      $this->_ctx_keyword,
      $this->_name,
      $value,
      $this->_constraint,
      $this->_equal,
      $this->_ctx_list,
      $this->_semicolon,
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

  public function getConstraintUNTYPED(): ?Node {
    return $this->_constraint;
  }

  public function withConstraint(?Node $value): this {
    if ($value === $this->_constraint) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_const_keyword,
      $this->_ctx_keyword,
      $this->_name,
      $this->_type_parameters,
      $value,
      $this->_equal,
      $this->_ctx_list,
      $this->_semicolon,
    );
  }

  public function hasConstraint(): bool {
    return $this->_constraint !== null;
  }

  /**
   * @return unknown
   */
  public function getConstraint(): ?Node {
    return $this->_constraint;
  }

  /**
   * @return unknown
   */
  public function getConstraintx(): Node {
    return TypeAssert\not_null($this->getConstraint());
  }

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(?Node $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_const_keyword,
      $this->_ctx_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_constraint,
      $value,
      $this->_ctx_list,
      $this->_semicolon,
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
      $this->_modifiers,
      $this->_const_keyword,
      $this->_ctx_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_constraint,
      $this->_equal,
      $value,
      $this->_semicolon,
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

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(?Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_modifiers,
      $this->_const_keyword,
      $this->_ctx_keyword,
      $this->_name,
      $this->_type_parameters,
      $this->_constraint,
      $this->_equal,
      $this->_ctx_list,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
  }

  /**
   * @return unknown
   */
  public function getSemicolon(): ?Node {
    return $this->_semicolon;
  }

  /**
   * @return unknown
   */
  public function getSemicolonx(): Node {
    return TypeAssert\not_null($this->getSemicolon());
  }
}
