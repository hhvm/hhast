/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<37619522653ba22ee5e3f8cbb7df809b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class RecordCreationExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'record_creation_expression';

  private ?Node $_type;
  private ?Node $_left_bracket;
  private ?Node $_members;
  private ?Node $_right_bracket;

  public function __construct(
    ?Node $type,
    ?Node $left_bracket,
    ?Node $members,
    ?Node $right_bracket,
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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $type = Node::fromJSON(
      ($json['record_creation_type'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type?->getWidth() ?? 0;
    $left_bracket = Node::fromJSON(
      ($json['record_creation_left_bracket'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_bracket?->getWidth() ?? 0;
    $members = Node::fromJSON(
      ($json['record_creation_members'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $members?->getWidth() ?? 0;
    $right_bracket = Node::fromJSON(
      ($json['record_creation_right_bracket'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_bracket?->getWidth() ?? 0;
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
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $left_bracket = $this->_left_bracket === null
      ? null
      : $rewriter($this->_left_bracket, $parents);
    $members =
      $this->_members === null ? null : $rewriter($this->_members, $parents);
    $right_bracket = $this->_right_bracket === null
      ? null
      : $rewriter($this->_right_bracket, $parents);
    if (
      $type === $this->_type &&
      $left_bracket === $this->_left_bracket &&
      $members === $this->_members &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new static(
      $type as ?Node,
      $left_bracket as ?Node,
      $members as ?Node,
      $right_bracket as ?Node,
    );
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?Node $value): this {
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
   * @return unknown
   */
  public function getType(): ?Node {
    return $this->_type;
  }

  /**
   * @return unknown
   */
  public function getTypex(): Node {
    return TypeAssert\not_null($this->getType());
  }

  public function getLeftBracketUNTYPED(): ?Node {
    return $this->_left_bracket;
  }

  public function withLeftBracket(?Node $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return
      new static($this->_type, $value, $this->_members, $this->_right_bracket);
  }

  public function hasLeftBracket(): bool {
    return $this->_left_bracket !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftBracket(): ?Node {
    return $this->_left_bracket;
  }

  /**
   * @return unknown
   */
  public function getLeftBracketx(): Node {
    return TypeAssert\not_null($this->getLeftBracket());
  }

  public function getMembersUNTYPED(): ?Node {
    return $this->_members;
  }

  public function withMembers(?Node $value): this {
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
   * @return unknown
   */
  public function getMembers(): ?Node {
    return $this->_members;
  }

  /**
   * @return unknown
   */
  public function getMembersx(): Node {
    return TypeAssert\not_null($this->getMembers());
  }

  public function getRightBracketUNTYPED(): ?Node {
    return $this->_right_bracket;
  }

  public function withRightBracket(?Node $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return
      new static($this->_type, $this->_left_bracket, $this->_members, $value);
  }

  public function hasRightBracket(): bool {
    return $this->_right_bracket !== null;
  }

  /**
   * @return unknown
   */
  public function getRightBracket(): ?Node {
    return $this->_right_bracket;
  }

  /**
   * @return unknown
   */
  public function getRightBracketx(): Node {
    return TypeAssert\not_null($this->getRightBracket());
  }
}
