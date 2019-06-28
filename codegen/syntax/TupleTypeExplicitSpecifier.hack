/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0ff130734ab54e5349995396d1c7f688>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TupleTypeExplicitSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'tuple_type_explicit_specifier';

  private Node $_keyword;
  private Node $_left_angle;
  private Node $_types;
  private Node $_right_angle;

  public function __construct(
    Node $keyword,
    Node $left_angle,
    Node $types,
    Node $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_types = $types;
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
      /* HH_FIXME[4110] */ $json['tuple_type_keyword'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $keyword->getWidth();
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_type_left_angle'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_angle->getWidth();
    $types = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_type_types'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $types->getWidth();
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_type_right_angle'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_angle->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($keyword, $left_angle, $types, $right_angle, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_angle' => $this->_left_angle,
      'types' => $this->_types,
      'right_angle' => $this->_right_angle,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $left_angle = $rewriter($this->_left_angle, $parents);
    $types = $rewriter($this->_types, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_angle === $this->_left_angle &&
      $types === $this->_types &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static($keyword, $left_angle, $types, $right_angle);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_left_angle,
      $this->_types,
      $this->_right_angle,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return unknown
   */
  public function getKeyword(): Node {
    return $this->_keyword;
  }

  /**
   * @return unknown
   */
  public function getKeywordx(): Node {
    return $this->getKeyword();
  }

  public function getLeftAngleUNTYPED(): Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(Node $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value ?? Missing(),
      $this->_types,
      $this->_right_angle,
    );
  }

  public function hasLeftAngle(): bool {
    return !$this->_left_angle->isMissing();
  }

  /**
   * @return unknown
   */
  public function getLeftAngle(): Node {
    return $this->_left_angle;
  }

  /**
   * @return unknown
   */
  public function getLeftAnglex(): Node {
    return $this->getLeftAngle();
  }

  public function getTypesUNTYPED(): Node {
    return $this->_types;
  }

  public function withTypes(Node $value): this {
    if ($value === $this->_types) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $value ?? Missing(),
      $this->_right_angle,
    );
  }

  public function hasTypes(): bool {
    return !$this->_types->isMissing();
  }

  /**
   * @return unknown
   */
  public function getTypes(): Node {
    return $this->_types;
  }

  /**
   * @return unknown
   */
  public function getTypesx(): Node {
    return $this->getTypes();
  }

  public function getRightAngleUNTYPED(): Node {
    return $this->_right_angle;
  }

  public function withRightAngle(Node $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $this->_types,
      $value ?? Missing(),
    );
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  /**
   * @return unknown
   */
  public function getRightAngle(): Node {
    return $this->_right_angle;
  }

  /**
   * @return unknown
   */
  public function getRightAnglex(): Node {
    return $this->getRightAngle();
  }
}
