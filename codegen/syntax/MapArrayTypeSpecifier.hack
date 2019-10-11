/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1f7997f360b424e2914a7116d1e7d5b8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class MapArrayTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'map_array_type_specifier';

  private ArrayToken $_keyword;
  private LessThanToken $_left_angle;
  private SimpleTypeSpecifier $_key;
  private CommaToken $_comma;
  private ?ITypeSpecifier $_value;
  private GreaterThanToken $_right_angle;

  public function __construct(
    ArrayToken $keyword,
    LessThanToken $left_angle,
    SimpleTypeSpecifier $key,
    CommaToken $comma,
    ?ITypeSpecifier $value,
    GreaterThanToken $right_angle,
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
      'ArrayToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['map_array_left_angle'],
      $file,
      $offset,
      $source,
      'LessThanToken',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $key = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['map_array_key'],
      $file,
      $offset,
      $source,
      'SimpleTypeSpecifier',
    );
    $key = $key as nonnull;
    $offset += $key->getWidth();
    $comma = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['map_array_comma'],
      $file,
      $offset,
      $source,
      'CommaToken',
    );
    $comma = $comma as nonnull;
    $offset += $comma->getWidth();
    $value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['map_array_value'] ??
        dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $value?->getWidth() ?? 0;
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['map_array_right_angle'],
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
    $value = $this->_value === null ? null : $rewriter($this->_value, $parents);
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

  public function withKeyword(ArrayToken $value): this {
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
   * @return ArrayToken
   */
  public function getKeyword(): ArrayToken {
    return TypeAssert\instance_of(ArrayToken::class, $this->_keyword);
  }

  /**
   * @return ArrayToken
   */
  public function getKeywordx(): ArrayToken {
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

  public function getKeyUNTYPED(): ?Node {
    return $this->_key;
  }

  public function withKey(SimpleTypeSpecifier $value): this {
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
   * @return SimpleTypeSpecifier
   */
  public function getKey(): SimpleTypeSpecifier {
    return TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_key);
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getKeyx(): SimpleTypeSpecifier {
    return $this->getKey();
  }

  public function getCommaUNTYPED(): ?Node {
    return $this->_comma;
  }

  public function withComma(CommaToken $value): this {
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
   * @return CommaToken
   */
  public function getComma(): CommaToken {
    return TypeAssert\instance_of(CommaToken::class, $this->_comma);
  }

  /**
   * @return CommaToken
   */
  public function getCommax(): CommaToken {
    return $this->getComma();
  }

  public function getValueUNTYPED(): ?Node {
    return $this->_value;
  }

  public function withValue(?ITypeSpecifier $value): this {
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
   * @return GenericTypeSpecifier | null | NullableTypeSpecifier |
   * ShapeTypeSpecifier | SimpleTypeSpecifier | SoftTypeSpecifier
   */
  public function getValue(): ?ITypeSpecifier {
    return $this->_value;
  }

  /**
   * @return GenericTypeSpecifier | NullableTypeSpecifier | ShapeTypeSpecifier
   * | SimpleTypeSpecifier | SoftTypeSpecifier
   */
  public function getValuex(): ITypeSpecifier {
    return TypeAssert\not_null($this->getValue());
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
