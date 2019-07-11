/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<dc6edba4755aafa2fa5069b8a84ddd0f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

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
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_type_left_angle'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $types = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_type_types'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $types = $types as nonnull;
    $offset += $types->getWidth();
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['tuple_type_right_angle'],
      $file,
      $offset,
      $source,
      'Node',
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
      /* HH_IGNORE_ERROR[4110] */ $types,
      /* HH_IGNORE_ERROR[4110] */ $right_angle,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_angle' => $this->_left_angle,
      'types' => $this->_types,
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
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_angle,
      /* HH_FIXME[4110] use `as` */ $types,
      /* HH_FIXME[4110] use `as` */ $right_angle,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_angle,
      $this->_types,
      $this->_right_angle,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
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

  public function getLeftAngleUNTYPED(): ?Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(Node $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_types,
      $this->_right_angle,
    );
  }

  public function hasLeftAngle(): bool {
    return $this->_left_angle !== null;
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

  public function getTypesUNTYPED(): ?Node {
    return $this->_types;
  }

  public function withTypes(Node $value): this {
    if ($value === $this->_types) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_right_angle,
    );
  }

  public function hasTypes(): bool {
    return $this->_types !== null;
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

  public function getRightAngleUNTYPED(): ?Node {
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
      $value,
    );
  }

  public function hasRightAngle(): bool {
    return $this->_right_angle !== null;
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
