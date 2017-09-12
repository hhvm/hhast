<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<051d256b5f531d4fbac3a534b67c4bc6>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class VectorArrayTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_type;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $type,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('vector_array_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_type = $type;
    $this->_right_angle = $right_angle;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_array_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_array_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->getWidth();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_array_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_array_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->getWidth();
    return new self($keyword, $left_angle, $type, $right_angle);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'type' => $this->_type;
    yield 'right_angle' => $this->_right_angle;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_angle === $this->_left_angle &&
      $type === $this->_type &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new self($keyword, $left_angle, $type, $right_angle);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_left_angle, $this->_type, $this->_right_angle);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  public function getKeyword(): ArrayToken {
    return TypeAssert::isInstanceOf(ArrayToken::class, $this->_keyword);
  }

  public function getLeftAngleUNTYPED(): EditableSyntax {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableSyntax $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_type, $this->_right_angle);
  }

  public function hasLeftAngle(): bool {
    return !$this->_left_angle->isMissing();
  }

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
    return new self($this->_keyword, $this->_left_angle, $value, $this->_right_angle);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function getRightAngleUNTYPED(): EditableSyntax {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableSyntax $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new self($this->_keyword, $this->_left_angle, $this->_type, $value);
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  public function getRightAngle(): GreaterThanToken {
    return TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }
}
