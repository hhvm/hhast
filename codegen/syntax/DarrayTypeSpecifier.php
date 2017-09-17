<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8633b6b8760d4234209ab45b331c3e06>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class DarrayTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_key;
  private EditableSyntax $_comma;
  private EditableSyntax $_value;
  private EditableSyntax $_trailing_comma;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $key,
    EditableSyntax $comma,
    EditableSyntax $value,
    EditableSyntax $trailing_comma,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('darray_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_key = $key;
    $this->_comma = $comma;
    $this->_value = $value;
    $this->_trailing_comma = $trailing_comma;
    $this->_right_angle = $right_angle;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->getWidth();
    $key = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_key'],
      $position,
      $source,
    );
    $position += $key->getWidth();
    $comma = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_comma'],
      $position,
      $source,
    );
    $position += $comma->getWidth();
    $value = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_value'],
      $position,
      $source,
    );
    $position += $value->getWidth();
    $trailing_comma = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_trailing_comma'],
      $position,
      $source,
    );
    $position += $trailing_comma->getWidth();
    $right_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->getWidth();
    return new self(
      $keyword,
      $left_angle,
      $key,
      $comma,
      $value,
      $trailing_comma,
      $right_angle,
    );
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'key' => $this->_key;
    yield 'comma' => $this->_comma;
    yield 'value' => $this->_value;
    yield 'trailing_comma' => $this->_trailing_comma;
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
    $trailing_comma = $this->_trailing_comma->rewrite($rewriter, $parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $parents);
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
    return new self(
      $keyword,
      $left_angle,
      $key,
      $comma,
      $value,
      $trailing_comma,
      $right_angle,
    );
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
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns DarrayToken
   */
  public function getKeyword(): DarrayToken {
    return TypeAssert\instance_of(DarrayToken::class, $this->_keyword);
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
      $this->_trailing_comma,
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
      $this->_trailing_comma,
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
      $this->_trailing_comma,
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
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier
   */
  public function getValue(): SimpleTypeSpecifier {
    return TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_value);
  }

  public function getTrailingCommaUNTYPED(): EditableSyntax {
    return $this->_trailing_comma;
  }

  public function withTrailingComma(EditableSyntax $value): this {
    if ($value === $this->_trailing_comma) {
      return $this;
    }
    return new self(
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
    return !$this->_trailing_comma->isMissing();
  }

  /**
   * @returns Missing
   */
  public function getTrailingComma(): EditableSyntax {
    return
      TypeAssert\instance_of(EditableSyntax::class, $this->_trailing_comma);
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
      $this->_trailing_comma,
      $value,
    );
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  /**
   * @returns GreaterThanToken
   */
  public function getRightAngle(): GreaterThanToken {
    return TypeAssert\instance_of(GreaterThanToken::class, $this->_right_angle);
  }
}
