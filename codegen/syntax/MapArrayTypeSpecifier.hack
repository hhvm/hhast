/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<397c97c4c69bfe3041f4955c2db33d5b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class MapArrayTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'map_array_type_specifier';

  private Node $_keyword;
  private Node $_left_angle;
  private Node $_key;
  private Node $_comma;
  private Node $_value;
  private Node $_right_angle;

  public function __construct(
    Node $keyword,
    Node $left_angle,
    Node $key,
    Node $comma,
    Node $value,
    Node $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_key = $key;
    $this->_comma = $comma;
    $this->_value = $value;
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
      /* HH_FIXME[4110] */ $json['map_array_keyword'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['map_array_left_angle'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $key = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['map_array_key'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $key = $key as nonnull;
    $offset += $key->getWidth();
    $comma = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['map_array_comma'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $comma = $comma as nonnull;
    $offset += $comma->getWidth();
    $value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['map_array_value'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $value = $value as nonnull;
    $offset += $value->getWidth();
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['map_array_right_angle'],
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
      /* HH_IGNORE_ERROR[4110] */ $key,
      /* HH_IGNORE_ERROR[4110] */ $comma,
      /* HH_IGNORE_ERROR[4110] */ $value,
      /* HH_IGNORE_ERROR[4110] */ $right_angle,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_angle' => $this->_left_angle,
      'key' => $this->_key,
      'comma' => $this->_comma,
      'value' => $this->_value,
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
    $key = $rewriter($this->_key, $parents);
    $comma = $rewriter($this->_comma, $parents);
    $value = $rewriter($this->_value, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_angle === $this->_left_angle &&
      $key === $this->_key &&
      $comma === $this->_comma &&
      $value === $this->_value &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $left_angle,
      /* HH_FIXME[4110] use `as` */ $key,
      /* HH_FIXME[4110] use `as` */ $comma,
      /* HH_FIXME[4110] use `as` */ $value,
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
      $this->_key,
      $this->_comma,
      $this->_value,
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
      $this->_key,
      $this->_comma,
      $this->_value,
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

  public function getKeyUNTYPED(): ?Node {
    return $this->_key;
  }

  public function withKey(Node $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_comma,
      $this->_value,
      $this->_right_angle,
    );
  }

  public function hasKey(): bool {
    return $this->_key !== null;
  }

  /**
   * @return
   */
  public function getKey(): Node {
    return $this->_key;
  }

  /**
   * @return
   */
  public function getKeyx(): Node {
    return $this->getKey();
  }

  public function getCommaUNTYPED(): ?Node {
    return $this->_comma;
  }

  public function withComma(Node $value): this {
    if ($value === $this->_comma) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $value,
      $this->_value,
      $this->_right_angle,
    );
  }

  public function hasComma(): bool {
    return $this->_comma !== null;
  }

  /**
   * @return
   */
  public function getComma(): Node {
    return $this->_comma;
  }

  /**
   * @return
   */
  public function getCommax(): Node {
    return $this->getComma();
  }

  public function getValueUNTYPED(): ?Node {
    return $this->_value;
  }

  public function withValue(Node $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $value,
      $this->_right_angle,
    );
  }

  public function hasValue(): bool {
    return $this->_value !== null;
  }

  /**
   * @return
   */
  public function getValue(): Node {
    return $this->_value;
  }

  /**
   * @return
   */
  public function getValuex(): Node {
    return $this->getValue();
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
      $this->_key,
      $this->_comma,
      $this->_value,
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
