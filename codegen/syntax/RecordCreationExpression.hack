/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ec86378fa1132b43a78daaef34dc26ca>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class RecordCreationExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'record_creation_expression';

  private NameToken $_type;
  private LeftBracketToken $_left_bracket;
  private NodeList<ListItem<ElementInitializer>> $_members;
  private RightBracketToken $_right_bracket;

  public function __construct(
    NameToken $type,
    LeftBracketToken $left_bracket,
    NodeList<ListItem<ElementInitializer>> $members,
    RightBracketToken $right_bracket,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_type = $type;
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
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_creation_type'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $left_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_creation_left_bracket'],
      $file,
      $offset,
      $source,
      'LeftBracketToken',
    );
    $left_bracket = $left_bracket as nonnull;
    $offset += $left_bracket->getWidth();
    $members = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_creation_members'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ElementInitializer>>',
    );
    $members = $members as nonnull;
    $offset += $members->getWidth();
    $right_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['record_creation_right_bracket'],
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
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $left_bracket,
      /* HH_IGNORE_ERROR[4110] */ $members,
      /* HH_IGNORE_ERROR[4110] */ $right_bracket,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'type' => $this->_type,
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
    $type = $rewriter($this->_type, $parents);
    $left_bracket = $rewriter($this->_left_bracket, $parents);
    $members = $rewriter($this->_members, $parents);
    $right_bracket = $rewriter($this->_right_bracket, $parents);
    if (
      $type === $this->_type &&
      $left_bracket === $this->_left_bracket &&
      $members === $this->_members &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $left_bracket,
      /* HH_FIXME[4110] use `as` */ $members,
      /* HH_FIXME[4110] use `as` */ $right_bracket,
    );
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(NameToken $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_bracket,
      $this->_members,
      $this->_right_bracket,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return NameToken
   */
  public function getType(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_type);
  }

  /**
   * @return NameToken
   */
  public function getTypex(): NameToken {
    return $this->getType();
  }

  public function getLeftBracketUNTYPED(): ?Node {
    return $this->_left_bracket;
  }

  public function withLeftBracket(LeftBracketToken $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new static(
      $this->_type,
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

  public function withMembers(
    NodeList<ListItem<ElementInitializer>> $value,
  ): this {
    if ($value === $this->_members) {
      return $this;
    }
    return new static(
      $this->_type,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function hasMembers(): bool {
    return $this->_members !== null;
  }

  /**
   * @return NodeList<ListItem<ElementInitializer>>
   */
  public function getMembers(): NodeList<ListItem<ElementInitializer>> {
    return TypeAssert\instance_of(NodeList::class, $this->_members);
  }

  /**
   * @return NodeList<ListItem<ElementInitializer>>
   */
  public function getMembersx(): NodeList<ListItem<ElementInitializer>> {
    return $this->getMembers();
  }

  public function getRightBracketUNTYPED(): ?Node {
    return $this->_right_bracket;
  }

  public function withRightBracket(RightBracketToken $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return new static(
      $this->_type,
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
