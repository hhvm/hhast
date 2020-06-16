/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4d28edb189c4f5089d3893297275d023>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class KeysetIntrinsicExpression
  extends Node
  implements IHackArray, IContainer, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'keyset_intrinsic_expression';

  private KeysetToken $_keyword;
  private ?TypeArguments $_explicit_type;
  private LeftBracketToken $_left_bracket;
  private ?NodeList<ListItem<IExpression>> $_members;
  private RightBracketToken $_right_bracket;

  public function __construct(
    KeysetToken $keyword,
    ?TypeArguments $explicit_type,
    LeftBracketToken $left_bracket,
    ?NodeList<ListItem<IExpression>> $members,
    RightBracketToken $right_bracket,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_explicit_type = $explicit_type;
    $this->_left_bracket = $left_bracket;
    $this->_members = $members;
    $this->_right_bracket = $right_bracket;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['keyset_intrinsic_keyword'],
      $file,
      $offset,
      $source,
      'KeysetToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $explicit_type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['keyset_intrinsic_explicit_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'TypeArguments',
    );
    $offset += $explicit_type?->getWidth() ?? 0;
    $left_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['keyset_intrinsic_left_bracket'],
      $file,
      $offset,
      $source,
      'LeftBracketToken',
    );
    $left_bracket = $left_bracket as nonnull;
    $offset += $left_bracket->getWidth();
    $members = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['keyset_intrinsic_members'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $offset += $members?->getWidth() ?? 0;
    $right_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['keyset_intrinsic_right_bracket'],
      $file,
      $offset,
      $source,
      'RightBracketToken',
    );
    $right_bracket = $right_bracket as nonnull;
    $offset += $right_bracket->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $explicit_type,
      /* HH_IGNORE_ERROR[4110] */ $left_bracket,
      /* HH_IGNORE_ERROR[4110] */ $members,
      /* HH_IGNORE_ERROR[4110] */ $right_bracket,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'explicit_type' => $this->_explicit_type,
      'left_bracket' => $this->_left_bracket,
      'members' => $this->_members,
      'right_bracket' => $this->_right_bracket,
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
    $explicit_type = $this->_explicit_type === null
      ? null
      : $rewriter($this->_explicit_type, $parents);
    $left_bracket = $rewriter($this->_left_bracket, $parents);
    $members = $this->_members === null
      ? null
      : $rewriter($this->_members, $parents);
    $right_bracket = $rewriter($this->_right_bracket, $parents);
    if (
      $keyword === $this->_keyword &&
      $explicit_type === $this->_explicit_type &&
      $left_bracket === $this->_left_bracket &&
      $members === $this->_members &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $explicit_type,
      /* HH_FIXME[4110] use `as` */ $left_bracket,
      /* HH_FIXME[4110] use `as` */ $members,
      /* HH_FIXME[4110] use `as` */ $right_bracket,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(KeysetToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_explicit_type,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return KeysetToken
   */
  public function getKeyword(): KeysetToken {
    return TypeAssert\instance_of(KeysetToken::class, $this->_keyword);
  }

  /**
   * @return KeysetToken
   */
  public function getKeywordx(): KeysetToken {
    return $this->getKeyword();
  }

  public function getExplicitTypeUNTYPED(): ?Node {
    return $this->_explicit_type;
  }

  public function withExplicitType(?TypeArguments $value): this {
    if ($value === $this->_explicit_type) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function hasExplicitType(): bool {
    return $this->_explicit_type !== null;
  }

  /**
   * @return null | TypeArguments
   */
  public function getExplicitType(): ?TypeArguments {
    return $this->_explicit_type;
  }

  /**
   * @return TypeArguments
   */
  public function getExplicitTypex(): TypeArguments {
    return TypeAssert\not_null($this->getExplicitType());
  }

  public function getLeftBracketUNTYPED(): ?Node {
    return $this->_left_bracket;
  }

  public function withLeftBracket(LeftBracketToken $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_explicit_type,
      $value,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function hasLeftBracket(): bool {
    return $this->_left_bracket !== null;
  }

  /**
   * @return LeftBracketToken
   */
  public function getLeftBracket(): LeftBracketToken {
    return TypeAssert\instance_of(
      LeftBracketToken::class,
      $this->_left_bracket,
    );
  }

  /**
   * @return LeftBracketToken
   */
  public function getLeftBracketx(): LeftBracketToken {
    return $this->getLeftBracket();
  }

  public function getMembersUNTYPED(): ?Node {
    return $this->_members;
  }

  public function withMembers(?NodeList<ListItem<IExpression>> $value): this {
    if ($value === $this->_members) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_explicit_type,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function hasMembers(): bool {
    return $this->_members !== null;
  }

  /**
   * @return NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<ConditionalExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<NameToken>> | null
   */
  public function getMembers(): ?NodeList<ListItem<IExpression>> {
    return $this->_members;
  }

  /**
   * @return NodeList<ListItem<BinaryExpression>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<ConditionalExpression>> |
   * NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<LiteralExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<NameToken>>
   */
  public function getMembersx(): NodeList<ListItem<IExpression>> {
    return TypeAssert\not_null($this->getMembers());
  }

  public function getRightBracketUNTYPED(): ?Node {
    return $this->_right_bracket;
  }

  public function withRightBracket(RightBracketToken $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_explicit_type,
      $this->_left_bracket,
      $this->_members,
      $value,
    );
  }

  public function hasRightBracket(): bool {
    return $this->_right_bracket !== null;
  }

  /**
   * @return RightBracketToken
   */
  public function getRightBracket(): RightBracketToken {
    return TypeAssert\instance_of(
      RightBracketToken::class,
      $this->_right_bracket,
    );
  }

  /**
   * @return RightBracketToken
   */
  public function getRightBracketx(): RightBracketToken {
    return $this->getRightBracket();
  }
}
