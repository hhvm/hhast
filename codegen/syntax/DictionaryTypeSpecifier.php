<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0e3b4860b961d320e6f916ec306ea0bc>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class DictionaryTypeSpecifier extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_left_angle;
  private EditableNode $_members;
  private EditableNode $_right_angle;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_angle,
    EditableNode $members,
    EditableNode $right_angle,
  ) {
    parent::__construct('dictionary_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_members = $members;
    $this->_right_angle = $right_angle;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['dictionary_type_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['dictionary_type_left_angle'],
      $position,
      $source,
    );
    $position += $left_angle->getWidth();
    $members = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['dictionary_type_members'],
      $position,
      $source,
    );
    $position += $members->getWidth();
    $right_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['dictionary_type_right_angle'],
      $position,
      $source,
    );
    $position += $right_angle->getWidth();
    return new self($keyword, $left_angle, $members, $right_angle);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_angle' => $this->_left_angle,
      'members' => $this->_members,
      'right_angle' => $this->_right_angle,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $value,
      $this->_left_angle,
      $this->_members,
      $this->_right_angle,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns DictToken
   */
  public function getKeyword(): DictToken {
    return TypeAssert\instance_of(DictToken::class, $this->_keyword);
  }

  public function getLeftAngleUNTYPED(): EditableNode {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableNode $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_angle);
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

  public function getMembersUNTYPED(): EditableNode {
    return $this->_members;
  }

  public function withMembers(EditableNode $value): this {
    if ($value === $this->_members) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_right_angle,
    );
  }

  public function hasMembers(): bool {
    return !$this->_members->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getMembers(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_members);
  }

  public function getRightAngleUNTYPED(): EditableNode {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableNode $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return
      new self($this->_keyword, $this->_left_angle, $this->_members, $value);
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
