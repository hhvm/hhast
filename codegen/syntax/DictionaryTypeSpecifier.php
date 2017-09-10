<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c8289b2ad5ff56d4c2bfbf55de9ea030>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class DictionaryTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_angle;
  private EditableSyntax $_members;
  private EditableSyntax $_right_angle;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_angle,
    EditableSyntax $members,
    EditableSyntax $right_angle,
  ) {
    parent::__construct('dictionary_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_members = $members;
    $this->_right_angle = $right_angle;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_type_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_type_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->width();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_type_members'],
      $position,
      $source,
    );
    $position += $members->width();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_type_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->width();
    return new self($keyword, $left_angle, $members, $right_angle);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'members' => $this->_members;
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
    $members = $this->_members->rewrite($rewriter, $child_parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $left_angle === $this->_left_angle &&
      $members === $this->_members &&
      $right_angle === $this->_right_angle
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $left_angle, $members, $right_angle);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): DictToken {
    return $this->keywordx();
  }

  public function keywordx(): DictToken {
    return TypeAssert::isInstanceOf(DictToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_angle,
      $this->_members,
      $this->_right_angle,
    );
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
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_angle);
  }

  public function members(): EditableList {
    return $this->membersx();
  }

  public function membersx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_members);
  }

  public function raw_members(): EditableSyntax {
    return $this->_members;
  }

  public function with_members(EditableSyntax $value): this {
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
    return
      new self($this->_keyword, $this->_left_angle, $this->_members, $value);
  }
}
