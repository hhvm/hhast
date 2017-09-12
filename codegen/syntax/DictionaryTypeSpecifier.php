<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f31dba92bdfc39af200fc404ddd447ef>>
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

  <<__Override>>
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
    $position += $keyword->getWidth();
    $left_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_type_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->getWidth();
    $members = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_type_members'],
      $position,
      $source,
    );
    $position += $members->getWidth();
    $right_angle = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['dictionary_type_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->getWidth();
    return new self($keyword, $left_angle, $members, $right_angle);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_angle' => $this->_left_angle;
    yield 'members' => $this->_members;
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
    $members = $this->_members->rewrite($rewriter, $parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_angle === $this->_left_angle &&
      $members === $this->_members &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new self($keyword, $left_angle, $members, $right_angle);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_left_angle, $this->_members, $this->_right_angle);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  public function getKeyword(): DictToken {
    return TypeAssert::isInstanceOf(DictToken::class, $this->_keyword);
  }

  public function getLeftAngleUNTYPED(): EditableSyntax {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableSyntax $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_members, $this->_right_angle);
  }

  public function hasLeftAngle(): bool {
    return !$this->_left_angle->isMissing();
  }

  public function getLeftAngle(): LessThanToken {
    return TypeAssert::isInstanceOf(LessThanToken::class, $this->_left_angle);
  }

  public function getMembersUNTYPED(): EditableSyntax {
    return $this->_members;
  }

  public function withMembers(EditableSyntax $value): this {
    if ($value === $this->_members) {
      return $this;
    }
    return new self($this->_keyword, $this->_left_angle, $value, $this->_right_angle);
  }

  public function hasMembers(): bool {
    return !$this->_members->isMissing();
  }

  public function getMembers(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_members);
  }

  public function getRightAngleUNTYPED(): EditableSyntax {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableSyntax $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new self($this->_keyword, $this->_left_angle, $this->_members, $value);
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  public function getRightAngle(): GreaterThanToken {
    return TypeAssert::isInstanceOf(GreaterThanToken::class, $this->_right_angle);
  }
}
