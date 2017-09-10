<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c30369b6bb3436bf0712efdcf6ffd465>>
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
    $position += $keyword->width();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_array_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_array_type'],
      $position,
      $source,
    );
    $position += $type->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['vector_array_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($keyword, $left_angle, $type, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'type' => $this->_type;
    yield 'right_angle' => $this->_right_angle;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_angle = $this->_left_angle->rewrite($rewriter, $child_parents);
    $type = $this->_type->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $left_angle === $this->_left_angle &&
      $type === $this->_type &&
      $right_angle === $this->_right_angle
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_angle, $type, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): ArrayToken {
    return $this->keywordx();
  }

  public function keywordx(): ArrayToken {
    return TypeAssert::isInstanceOf(ArrayToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return
      new self($value, $this->_left_angle, $this->_type, $this->_right_angle);
  }

  public function left_angle(): LessThanToken {
    return $this->left_anglex();
  }

  public function left_anglex(): LessThanToken {
    return TypeAssert::isInstanceOf(LessThanToken::class, $this->_left_angle);
  }

  public function raw_left_angle(): EditableSyntax {
    return $this->_left_angle;
  }

  public function with_left_angle(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_type, $this->_right_angle);
  }

  public function type(): EditableSyntax {
    return $this->typex();
  }

  public function typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_right_angle,
    );
  }

  public function right_angle(): GreaterThanToken {
    return $this->right_anglex();
  }

  public function right_anglex(): GreaterThanToken {
    return
      TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }

  public function raw_right_angle(): EditableSyntax {
    return $this->_right_angle;
  }

  public function with_right_angle(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_left_angle, $this->_type, $value);
  }
}
