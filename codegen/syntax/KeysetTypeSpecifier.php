<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<aa124074e0be0f1736aa6381a0d1c234>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class KeysetTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_type;
  private EditableSyntax $_trailing_comma;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $type,
    EditableSyntax $trailing_comma,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('keyset_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_type = $type;
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
      /* UNSAFE_EXPR */ $json['keyset_type_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_type_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->getWidth();
    $type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_type_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    $trailing_comma = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_type_trailing_comma'],
      $position,
      $source,
    );
    $position += $trailing_comma->getWidth();
    $right_angle = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['keyset_type_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->getWidth();
    return new self(
      $keyword,
      $left_angle,
      $type,
      $trailing_comma,
      $right_angle,
    );
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'type' => $this->_type;
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
    $type = $this->_type->rewrite($rewriter, $parents);
    $trailing_comma = $this->_trailing_comma->rewrite($rewriter, $parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_angle === $this->_left_angle &&
      $type === $this->_type &&
      $trailing_comma === $this->_trailing_comma &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new self($keyword, $left_angle, $type, $trailing_comma, $right_angle);
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
      $this->_type,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns KeysetToken
   */
  public function getKeyword(): KeysetToken {
    return TypeAssert::isInstanceOf(KeysetToken::class, $this->_keyword);
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
      $this->_type,
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
    return TypeAssert::isInstanceOf(LessThanToken::class, $this->_left_angle);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier
   */
  public function getType(): SimpleTypeSpecifier {
    return TypeAssert::isInstanceOf(SimpleTypeSpecifier::class, $this->_type);
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
      $this->_type,
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
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_trailing_comma);
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
      $this->_type,
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
    return TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }
}
