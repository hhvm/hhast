/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b215636e731f4d8b29421bb5f4e9b878>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class TypeRefinement extends Node {

  const string SYNTAX_KIND = 'type_refinement';

  private SimpleTypeSpecifier $_type;
  private WithToken $_keyword;
  private LeftBraceToken $_left_brace;
  private NodeList<ListItem<TypeInRefinement>> $_members;
  private RightBraceToken $_right_brace;

  public function __construct(
    SimpleTypeSpecifier $type,
    WithToken $keyword,
    LeftBraceToken $left_brace,
    NodeList<ListItem<TypeInRefinement>> $members,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_type = $type;
    $this->_keyword = $keyword;
    $this->_left_brace = $left_brace;
    $this->_members = $members;
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
    $type = Node::fromJSON(
      ($json['type_refinement_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'SimpleTypeSpecifier',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $keyword = Node::fromJSON(
      ($json['type_refinement_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'WithToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_brace = Node::fromJSON(
      ($json['type_refinement_left_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $members = Node::fromJSON(
      ($json['type_refinement_members']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<TypeInRefinement>>',
    );
    $members = $members as nonnull;
    $offset += $members->getWidth();
    $right_brace = Node::fromJSON(
      ($json['type_refinement_right_brace']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $members,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'type' => $this->_type,
      'keyword' => $this->_keyword,
      'left_brace' => $this->_left_brace,
      'members' => $this->_members,
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
    $type = $rewriter($this->_type, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $members = $rewriter($this->_members, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $type === $this->_type &&
      $keyword === $this->_keyword &&
      $left_brace === $this->_left_brace &&
      $members === $this->_members &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $type as SimpleTypeSpecifier,
      $keyword as WithToken,
      $left_brace as LeftBraceToken,
      /* HH_FIXME[4110] NodeList<ListItem<TypeInRefinement>> may not be enforceable */ $members,
      $right_brace as RightBraceToken,
    );
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(SimpleTypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $value,
      $this->_keyword,
      $this->_left_brace,
      $this->_members,
      $this->_right_brace,
    );
  }

  public function hasType(): bool {
    return true;
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getType(): SimpleTypeSpecifier {
    return TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_type);
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getTypex(): SimpleTypeSpecifier {
    return $this->getType();
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(WithToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_type,
      $value,
      $this->_left_brace,
      $this->_members,
      $this->_right_brace,
    );
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return WithToken
   */
  public function getKeyword(): WithToken {
    return TypeAssert\instance_of(WithToken::class, $this->_keyword);
  }

  /**
   * @return WithToken
   */
  public function getKeywordx(): WithToken {
    return $this->getKeyword();
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_keyword,
      $value,
      $this->_members,
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

  public function getMembersUNTYPED(): ?Node {
    return $this->_members;
  }

  public function withMembers(
    NodeList<ListItem<TypeInRefinement>> $value,
  ): this {
    if ($value === $this->_members) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_keyword,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasMembers(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<TypeInRefinement>>
   */
  public function getMembers(): NodeList<ListItem<TypeInRefinement>> {
    return TypeAssert\instance_of(NodeList::class, $this->_members);
  }

  /**
   * @return NodeList<ListItem<TypeInRefinement>>
   */
  public function getMembersx(): NodeList<ListItem<TypeInRefinement>> {
    return $this->getMembers();
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_keyword,
      $this->_left_brace,
      $this->_members,
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
