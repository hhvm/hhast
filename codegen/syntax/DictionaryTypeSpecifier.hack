/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<69c7077da9abbda7c325ce16f648442e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      ($json['dictionary_type_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'DictToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_angle = Node::fromJSON(
      ($json['dictionary_type_left_angle']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LessThanToken',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $members = Node::fromJSON(
      ($json['dictionary_type_members']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ITypeSpecifier>>',
    );
    $members = $members as nonnull;
    $offset += $members->getWidth();
    $right_angle = Node::fromJSON(
      ($json['dictionary_type_right_angle']) as dict<_, _>,
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
      $keyword as DictToken,
      $left_angle as LessThanToken,
      \HH\FIXME\UNSAFE_CAST<NodeList<Node>, NodeList<ListItem<ITypeSpecifier>>>(
        $members as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_angle as GreaterThanToken,
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
      $keyword as DictToken,
      $left_angle as LessThanToken,
      \HH\FIXME\UNSAFE_CAST<NodeList<Node>, NodeList<ListItem<ITypeSpecifier>>>(
        $members as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_angle as GreaterThanToken,
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
    return true;
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
    return
      new static($this->_keyword, $value, $this->_members, $this->_right_angle);
  }

  public function hasLeftAngle(): bool {
    return true;
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
    return true;
  }

  /**
   * @return NodeList<ListItem<ClassnameTypeSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>>
   */
  public function getMembers(): NodeList<ListItem<ITypeSpecifier>> {
    return TypeAssert\instance_of(NodeList::class, $this->_members);
  }

  /**
   * @return NodeList<ListItem<ClassnameTypeSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<ISimpleCreationSpecifier>> |
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
    return
      new static($this->_keyword, $this->_left_angle, $this->_members, $value);
  }

  public function hasRightAngle(): bool {
    return true;
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
