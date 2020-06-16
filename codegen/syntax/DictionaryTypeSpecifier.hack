/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6fd444ca29cafed58a9172461341b5be>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class DictionaryTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'dictionary_type_specifier';

  private DictToken $_keyword;
  private LessThanToken $_left_angle;
  private NodeList<ListItem<ITypeSpecifier>> $_members;
  private GreaterThanToken $_right_angle;

  public function __construct(
    DictToken $keyword,
    LessThanToken $left_angle,
    NodeList<ListItem<ITypeSpecifier>> $members,
    GreaterThanToken $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_members = $members;
    $this->_right_angle = $right_angle;
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
      /* HH_FIXME[4110] */ $json['dictionary_type_keyword'],
      $file,
      $offset,
      $source,
      'DictToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['dictionary_type_left_angle'],
      $file,
      $offset,
      $source,
      'LessThanToken',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $members = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['dictionary_type_members'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ITypeSpecifier>>',
    );
    $members = $members as nonnull;
    $offset += $members->getWidth();
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['dictionary_type_right_angle'],
      $file,
      $offset,
      $source,
      'GreaterThanToken',
    );
    $right_angle = $right_angle as nonnull;
    $offset += $right_angle->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_angle,
      /* HH_IGNORE_ERROR[4110] */ $members,
      /* HH_IGNORE_ERROR[4110] */ $right_angle,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_angle' => $this->_left_angle,
      'members' => $this->_members,
      'right_angle' => $this->_right_angle,
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
    $left_angle = $rewriter($this->_left_angle, $parents);
    $members = $rewriter($this->_members, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_angle === $this->_left_angle &&
      $members === $this->_members &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_angle,
      /* HH_FIXME[4110] use `as` */ $members,
      /* HH_FIXME[4110] use `as` */ $right_angle,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(DictToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_angle,
      $this->_members,
      $this->_right_angle,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return DictToken
   */
  public function getKeyword(): DictToken {
    return TypeAssert\instance_of(DictToken::class, $this->_keyword);
  }

  /**
   * @return DictToken
   */
  public function getKeywordx(): DictToken {
    return $this->getKeyword();
  }

  public function getLeftAngleUNTYPED(): ?Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(LessThanToken $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_members,
      $this->_right_angle,
    );
  }

  public function hasLeftAngle(): bool {
    return $this->_left_angle !== null;
  }

  /**
   * @return LessThanToken
   */
  public function getLeftAngle(): LessThanToken {
    return TypeAssert\instance_of(LessThanToken::class, $this->_left_angle);
  }

  /**
   * @return LessThanToken
   */
  public function getLeftAnglex(): LessThanToken {
    return $this->getLeftAngle();
  }

  public function getMembersUNTYPED(): ?Node {
    return $this->_members;
  }

  public function withMembers(NodeList<ListItem<ITypeSpecifier>> $value): this {
    if ($value === $this->_members) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_right_angle,
    );
  }

  public function hasMembers(): bool {
    return $this->_members !== null;
  }

  /**
   * @return NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getMembers(): NodeList<ListItem<ITypeSpecifier>> {
    return TypeAssert\instance_of(NodeList::class, $this->_members);
  }

  /**
   * @return NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getMembersx(): NodeList<ListItem<ITypeSpecifier>> {
    return $this->getMembers();
  }

  public function getRightAngleUNTYPED(): ?Node {
    return $this->_right_angle;
  }

  public function withRightAngle(GreaterThanToken $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $this->_members,
      $value,
    );
  }

  public function hasRightAngle(): bool {
    return $this->_right_angle !== null;
  }

  /**
   * @return GreaterThanToken
   */
  public function getRightAngle(): GreaterThanToken {
    return TypeAssert\instance_of(GreaterThanToken::class, $this->_right_angle);
  }

  /**
   * @return GreaterThanToken
   */
  public function getRightAnglex(): GreaterThanToken {
    return $this->getRightAngle();
  }
}
