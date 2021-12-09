/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a45400eef162c5e1b47c8acbb4f1088d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class TraitUseConflictResolution
  extends Node
  implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'trait_use_conflict_resolution';

  private UseToken $_keyword;
  private NodeList<ListItem<SimpleTypeSpecifier>> $_names;
  private LeftBraceToken $_left_brace;
  private ?NodeList<ListItem<ITraitUseItem>> $_clauses;
  private RightBraceToken $_right_brace;

  public function __construct(
    UseToken $keyword,
    NodeList<ListItem<SimpleTypeSpecifier>> $names,
    LeftBraceToken $left_brace,
    ?NodeList<ListItem<ITraitUseItem>> $clauses,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_names = $names;
    $this->_left_brace = $left_brace;
    $this->_clauses = $clauses;
    $this->_right_brace = $right_brace;
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
      ($json['trait_use_conflict_resolution_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'UseToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $names = Node::fromJSON(
      ($json['trait_use_conflict_resolution_names']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<SimpleTypeSpecifier>>',
    );
    $names = $names as nonnull;
    $offset += $names->getWidth();
    $left_brace = Node::fromJSON(
      ($json['trait_use_conflict_resolution_left_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $clauses = Node::fromJSON(
      (
        $json['trait_use_conflict_resolution_clauses'] ??
        dict['kind' => 'missing']
      ) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ITraitUseItem>>',
    );
    $offset += $clauses?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['trait_use_conflict_resolution_right_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $right_brace = $right_brace as nonnull;
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $names,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $clauses,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'names' => $this->_names,
      'left_brace' => $this->_left_brace,
      'clauses' => $this->_clauses,
      'right_brace' => $this->_right_brace,
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
    $names = $rewriter($this->_names, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $clauses =
      $this->_clauses === null ? null : $rewriter($this->_clauses, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $keyword === $this->_keyword &&
      $names === $this->_names &&
      $left_brace === $this->_left_brace &&
      $clauses === $this->_clauses &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $keyword as UseToken,
      /* HH_FIXME[4110] NodeList<ListItem<SimpleTypeSpecifier>> may not be enforceable */ $names,
      $left_brace as LeftBraceToken,
      /* HH_FIXME[4110] ?NodeList<ListItem<ITraitUseItem>> may not be enforceable */ $clauses,
      $right_brace as RightBraceToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(UseToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_names,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
    );
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return UseToken
   */
  public function getKeyword(): UseToken {
    return TypeAssert\instance_of(UseToken::class, $this->_keyword);
  }

  /**
   * @return UseToken
   */
  public function getKeywordx(): UseToken {
    return $this->getKeyword();
  }

  public function getNamesUNTYPED(): ?Node {
    return $this->_names;
  }

  public function withNames(
    NodeList<ListItem<SimpleTypeSpecifier>> $value,
  ): this {
    if ($value === $this->_names) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_left_brace,
      $this->_clauses,
      $this->_right_brace,
    );
  }

  public function hasNames(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getNames(): NodeList<ListItem<SimpleTypeSpecifier>> {
    return TypeAssert\instance_of(NodeList::class, $this->_names);
  }

  /**
   * @return NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getNamesx(): NodeList<ListItem<SimpleTypeSpecifier>> {
    return $this->getNames();
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_names,
      $value,
      $this->_clauses,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return true;
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getClausesUNTYPED(): ?Node {
    return $this->_clauses;
  }

  public function withClauses(?NodeList<ListItem<ITraitUseItem>> $value): this {
    if ($value === $this->_clauses) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_names,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasClauses(): bool {
    return $this->_clauses !== null;
  }

  /**
   * @return NodeList<ListItem<TraitUseAliasItem>> |
   * NodeList<ListItem<ITraitUseItem>> |
   * NodeList<ListItem<TraitUsePrecedenceItem>> | null
   */
  public function getClauses(): ?NodeList<ListItem<ITraitUseItem>> {
    return $this->_clauses;
  }

  /**
   * @return NodeList<ListItem<TraitUseAliasItem>> |
   * NodeList<ListItem<ITraitUseItem>> |
   * NodeList<ListItem<TraitUsePrecedenceItem>>
   */
  public function getClausesx(): NodeList<ListItem<ITraitUseItem>> {
    return TypeAssert\not_null($this->getClauses());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_names,
      $this->_left_brace,
      $this->_clauses,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return true;
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
