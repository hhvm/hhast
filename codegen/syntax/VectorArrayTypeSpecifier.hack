/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<03488083d4aadf200f9b261519b3fa00>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class VectorArrayTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'vector_array_type_specifier';

  private Node $_keyword;
  private Node $_left_angle;
  private Node $_type;
  private Node $_right_angle;

  public function __construct(
    Node $keyword,
    Node $left_angle,
    Node $type,
    Node $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_type = $type;
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
      /* HH_FIXME[4110] */ $json['vector_array_keyword'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['vector_array_left_angle'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['vector_array_type'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['vector_array_right_angle'],
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
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $right_angle,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_angle' => $this->_left_angle,
      'type' => $this->_type,
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
    $type = $rewriter($this->_type, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_angle === $this->_left_angle &&
      $type === $this->_type &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_angle,
      /* HH_FIXME[4110] use `as` */ $type,
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
      $this->_type,
      $this->_right_angle,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return
   */
  public function getKeyword(): Node {
    return $this->_keyword;
  }

  /**
   * @return
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
      $this->_type,
      $this->_right_angle,
    );
  }

  public function hasLeftAngle(): bool {
    return $this->_left_angle !== null;
  }

  /**
   * @return
   */
  public function getLeftAngle(): Node {
    return $this->_left_angle;
  }

  /**
   * @return
   */
  public function getLeftAnglex(): Node {
    return $this->getLeftAngle();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_right_angle,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return
   */
  public function getType(): Node {
    return $this->_type;
  }

  /**
   * @return
   */
  public function getTypex(): Node {
    return $this->getType();
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
      $this->_type,
      $value,
    );
  }

  public function hasRightAngle(): bool {
    return $this->_right_angle !== null;
  }

  /**
   * @return
   */
  public function getRightAngle(): Node {
    return $this->_right_angle;
  }

  /**
   * @return
   */
  public function getRightAnglex(): Node {
    return $this->getRightAngle();
  }
}
