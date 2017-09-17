<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a4101d2d3f97d920fcdd9694f224b02b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class MapArrayTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_key;
  private EditableSyntax $_comma;
  private EditableSyntax $_value;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $key,
    EditableSyntax $comma,
    EditableSyntax $value,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('map_array_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_key = $key;
    $this->_comma = $comma;
    $this->_value = $value;
    $this->_right_angle = $right_angle;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['map_array_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['map_array_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->getWidth();
    $key = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['map_array_key'],
      $position,
      $source,
    );
    $position += $key->getWidth();
    $comma = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['map_array_comma'],
      $position,
      $source,
    );
    $position += $comma->getWidth();
    $value = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['map_array_value'],
      $position,
      $source,
    );
    $position += $value->getWidth();
    $right_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['map_array_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->getWidth();
    return new self($keyword, $left_angle, $key, $comma, $value, $right_angle);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'key' => $this->_key;
    yield 'comma' => $this->_comma;
    yield 'value' => $this->_value;
    yield 'right_angle' => $this->_right_angle;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $parents);
    $key = $this->_key->rewrite($rewriter, $parents);
    $comma = $this->_comma->rewrite($rewriter, $parents);
    $value = $this->_value->rewrite($rewriter, $parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $parents);
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
    return new self($keyword, $left_angle, $key, $comma, $value, $right_angle);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $value,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $this->_value,
      $this->_right_angle,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns ArrayToken
   */
  public function getKeyword(): ArrayToken {
    return TypeAssert\instance_of(ArrayToken::class, $this->_keyword);
  }

  public function getLeftAngleUNTYPED(): EditableSyntax {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableSyntax $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $value,
      $this->_key,
      $this->_comma,
      $this->_value,
      $this->_right_angle,
    );
  }

  public function hasLeftAngle(): bool {
    return !$this->_left_angle->isMissing();
  }

  /**
   * @returns LessThanToken
   */
  public function getLeftAngle(): LessThanToken {
    return TypeAssert\instance_of(LessThanToken::class, $this->_left_angle);
  }

  public function getKeyUNTYPED(): EditableSyntax {
    return $this->_key;
  }

  public function withKey(EditableSyntax $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_comma,
      $this->_value,
      $this->_right_angle,
    );
  }

  public function hasKey(): bool {
    return !$this->_key->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier
   */
  public function getKey(): SimpleTypeSpecifier {
    return TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_key);
  }

  public function getCommaUNTYPED(): EditableSyntax {
    return $this->_comma;
  }

  public function withComma(EditableSyntax $value): this {
    if ($value === $this->_comma) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $value,
      $this->_value,
      $this->_right_angle,
    );
  }

  public function hasComma(): bool {
    return !$this->_comma->isMissing();
  }

  /**
   * @returns CommaToken
   */
  public function getComma(): CommaToken {
    return TypeAssert\instance_of(CommaToken::class, $this->_comma);
  }

  public function getValueUNTYPED(): EditableSyntax {
    return $this->_value;
  }

  public function withValue(EditableSyntax $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $value,
      $this->_right_angle,
    );
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier | GenericTypeSpecifier |
   * NullableTypeSpecifier | SoftTypeSpecifier
   */
  public function getValue(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_value);
  }

  public function getRightAngleUNTYPED(): EditableSyntax {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableSyntax $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $this->_key,
      $this->_comma,
      $this->_value,
      $value,
    );
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  /**
   * @returns GreaterThanToken | Missing
   */
  public function getRightAngle(): ?GreaterThanToken {
    if ($this->_right_angle->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(GreaterThanToken::class, $this->_right_angle);
  }

  /**
   * @returns GreaterThanToken
   */
  public function getRightAnglex(): GreaterThanToken {
    return TypeAssert\instance_of(GreaterThanToken::class, $this->_right_angle);
  }
}
