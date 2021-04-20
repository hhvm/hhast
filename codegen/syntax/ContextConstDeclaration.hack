/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0a59961e82d56b49d8524c190c9c8dfc>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ContextConstDeclaration
  extends Node
  implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'context_const_declaration';

  private ?NodeList<AbstractToken> $_modifiers;
  private ConstToken $_const_keyword;
  private CtxToken $_ctx_keyword;
  private NameToken $_name;
  private ?Node $_type_parameters;
  private ?NodeList<ContextConstraint> $_constraint;
  private ?EqualToken $_equal;
  private ?Contexts $_ctx_list;
  private SemicolonToken $_semicolon;

  public function __construct(
    ?NodeList<AbstractToken> $modifiers,
    ConstToken $const_keyword,
    CtxToken $ctx_keyword,
    NameToken $name,
    ?Node $type_parameters,
    ?NodeList<ContextConstraint> $constraint,
    ?EqualToken $equal,
    ?Contexts $ctx_list,
    SemicolonToken $semicolon,
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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $modifiers = Node::fromJSON(
      ($json['context_const_modifiers'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<AbstractToken>',
    );
    $offset += $modifiers?->getWidth() ?? 0;
    $const_keyword = Node::fromJSON(
      ($json['context_const_const_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ConstToken',
    );
    $const_keyword = $const_keyword as nonnull;
    $offset += $const_keyword->getWidth();
    $ctx_keyword = Node::fromJSON(
      ($json['context_const_ctx_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'CtxToken',
    );
    $ctx_keyword = $ctx_keyword as nonnull;
    $offset += $ctx_keyword->getWidth();
    $name = Node::fromJSON(
      ($json['context_const_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $type_parameters = Node::fromJSON(
      ($json['context_const_type_parameters'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type_parameters?->getWidth() ?? 0;
    $constraint = Node::fromJSON(
      ($json['context_const_constraint'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ContextConstraint>',
    );
    $offset += $constraint?->getWidth() ?? 0;
    $equal = Node::fromJSON(
      ($json['context_const_equal'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $offset += $equal?->getWidth() ?? 0;
    $ctx_list = Node::fromJSON(
      ($json['context_const_ctx_list'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Contexts',
    );
    $offset += $ctx_list?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      ($json['context_const_semicolon']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
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
    $const_keyword = $rewriter($this->_const_keyword, $parents);
    $ctx_keyword = $rewriter($this->_ctx_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
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
    $semicolon = $rewriter($this->_semicolon, $parents);
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
      /* HH_FIXME[4110] ?NodeList<AbstractToken> may not be enforceable */ $modifiers,
      $const_keyword as ConstToken,
      $ctx_keyword as CtxToken,
      $name as NameToken,
      $type_parameters as ?Node,
      /* HH_FIXME[4110] ?NodeList<ContextConstraint> may not be enforceable */ $constraint,
      $equal as ?EqualToken,
      $ctx_list as ?Contexts,
      $semicolon as SemicolonToken,
    );
  }

  public function getModifiersUNTYPED(): ?Node {
    return $this->_modifiers;
  }

  public function withModifiers(?NodeList<AbstractToken> $value): this {
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
   * @return NodeList<AbstractToken> | null
   */
  public function getModifiers(): ?NodeList<AbstractToken> {
    return $this->_modifiers;
  }

  /**
   * @return NodeList<AbstractToken>
   */
  public function getModifiersx(): NodeList<AbstractToken> {
    return TypeAssert\not_null($this->getModifiers());
  }

  public function getConstKeywordUNTYPED(): ?Node {
    return $this->_const_keyword;
  }

  public function withConstKeyword(ConstToken $value): this {
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
   * @return ConstToken
   */
  public function getConstKeyword(): ConstToken {
    return TypeAssert\instance_of(ConstToken::class, $this->_const_keyword);
  }

  /**
   * @return ConstToken
   */
  public function getConstKeywordx(): ConstToken {
    return $this->getConstKeyword();
  }

  public function getCtxKeywordUNTYPED(): ?Node {
    return $this->_ctx_keyword;
  }

  public function withCtxKeyword(CtxToken $value): this {
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
   * @return CtxToken
   */
  public function getCtxKeyword(): CtxToken {
    return TypeAssert\instance_of(CtxToken::class, $this->_ctx_keyword);
  }

  /**
   * @return CtxToken
   */
  public function getCtxKeywordx(): CtxToken {
    return $this->getCtxKeyword();
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(NameToken $value): this {
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

  public function getConstraintUNTYPED(): ?Node {
    return $this->_constraint;
  }

  public function withConstraint(?NodeList<ContextConstraint> $value): this {
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
   * @return NodeList<ContextConstraint> | null
   */
  public function getConstraint(): ?NodeList<ContextConstraint> {
    return $this->_constraint;
  }

  /**
   * @return NodeList<ContextConstraint>
   */
  public function getConstraintx(): NodeList<ContextConstraint> {
    return TypeAssert\not_null($this->getConstraint());
  }

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(?EqualToken $value): this {
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
   * @return null | EqualToken
   */
  public function getEqual(): ?EqualToken {
    return $this->_equal;
  }

  /**
   * @return EqualToken
   */
  public function getEqualx(): EqualToken {
    return TypeAssert\not_null($this->getEqual());
  }

  public function getCtxListUNTYPED(): ?Node {
    return $this->_ctx_list;
  }

  public function withCtxList(?Contexts $value): this {
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
   * @return Contexts | null
   */
  public function getCtxList(): ?Contexts {
    return $this->_ctx_list;
  }

  /**
   * @return Contexts
   */
  public function getCtxListx(): Contexts {
    return TypeAssert\not_null($this->getCtxList());
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
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
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
