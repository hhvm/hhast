/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c8bdaea6c97352e110691dbe6e7930cc>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class DarrayTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'darray_type_specifier';

  private DarrayToken $_keyword;
  private LessThanToken $_left_angle;
  private ITypeSpecifier $_key;
  private CommaToken $_comma;
  private ITypeSpecifier $_value;
  private ?Node $_trailing_comma;
  private GreaterThanToken $_right_angle;

  public function __construct(
    DarrayToken $keyword,
    LessThanToken $left_angle,
    ITypeSpecifier $key,
    CommaToken $comma,
    ITypeSpecifier $value,
    ?Node $trailing_comma,
    GreaterThanToken $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_key = $key;
    $this->_comma = $comma;
    $this->_value = $value;
    $this->_trailing_comma = $trailing_comma;
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
      /* HH_FIXME[4110] */ $json['darray_keyword'],
      $file,
      $offset,
      $source,
      'DarrayToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_left_angle'],
      $file,
      $offset,
      $source,
      'LessThanToken',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $key = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_key'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $key = $key as nonnull;
    $offset += $key->getWidth();
    $comma = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_comma'],
      $file,
      $offset,
      $source,
      'CommaToken',
    );
    $comma = $comma as nonnull;
    $offset += $comma->getWidth();
    $value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_value'],
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $value = $value as nonnull;
    $offset += $value->getWidth();
    $trailing_comma = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_trailing_comma'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $trailing_comma?->getWidth() ?? 0;
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_right_angle'],
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
      /* HH_IGNORE_ERROR[4110] */ $trailing_comma,
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
      'trailing_comma' => $this->_trailing_comma,
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
    $trailing_comma = $this->_trailing_comma === null
      ? null
      : $rewriter($this->_trailing_comma, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_angle === $this->_left_angle &&
      $key === $this->_key &&
      $comma === $this->_comma &&
      $value === $this->_value &&
      $trailing_comma === $this->_trailing_comma &&
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
      /* HH_FIXME[4110] use `as` */ $trailing_comma,
      /* HH_FIXME[4110] use `as` */ $right_angle,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(DarrayToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $this->_value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return DarrayToken
   */
  public function getKeyword(): DarrayToken {
    return TypeAssert\instance_of(DarrayToken::class, $this->_keyword);
  }

  /**
   * @return DarrayToken
   */
  public function getKeywordx(): DarrayToken {
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
      $this->_trailing_comma,
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

  public function withKey(ITypeSpecifier $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_comma,
      $this->_value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function hasKey(): bool {
    return $this->_key !== null;
  }

  /**
   * @return ClassnameTypeSpecifier | SimpleTypeSpecifier
   */
  public function getKey(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_key);
  }

  /**
   * @return ClassnameTypeSpecifier | SimpleTypeSpecifier
   */
  public function getKeyx(): ITypeSpecifier {
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
      $this->_trailing_comma,
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

  public function withValue(ITypeSpecifier $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function hasValue(): bool {
    return $this->_value !== null;
  }

  /**
   * @return AttributizedSpecifier | DarrayTypeSpecifier | GenericTypeSpecifier
   * | NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * VarrayTypeSpecifier
   */
  public function getValue(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_value);
  }

  /**
   * @return AttributizedSpecifier | DarrayTypeSpecifier | GenericTypeSpecifier
   * | NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * VarrayTypeSpecifier
   */
  public function getValuex(): ITypeSpecifier {
    return $this->getValue();
  }

  public function getTrailingCommaUNTYPED(): ?Node {
    return $this->_trailing_comma;
  }

  public function withTrailingComma(?Node $value): this {
    if ($value === $this->_trailing_comma) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $this->_value,
      $value,
      $this->_right_angle,
    );
  }

  public function hasTrailingComma(): bool {
    return $this->_trailing_comma !== null;
  }

  /**
   * @return null
   */
  public function getTrailingComma(): ?Node {
    return $this->_trailing_comma;
  }

  /**
   * @return
   */
  public function getTrailingCommax(): Node {
    return TypeAssert\not_null($this->getTrailingComma());
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
      $this->_trailing_comma,
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
