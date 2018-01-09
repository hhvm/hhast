<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4e3010966d3a3c9b641f886739809977>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ArrayIntrinsicExpression extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_members;
  private EditableNode $_right_paren;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $members,
    EditableNode $right_paren,
  ) {
    parent::__construct('array_intrinsic_expression');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_members = $members;
    $this->_right_paren = $right_paren;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['array_intrinsic_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['array_intrinsic_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $members = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['array_intrinsic_members'],
      $file,
      $offset,
      $source,
    );
    $offset += $members->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['array_intrinsic_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    return new self($keyword, $left_paren, $members, $right_paren);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'members' => $this->_members,
      'right_paren' => $this->_right_paren,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $members = $this->_members->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $members === $this->_members &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new self($keyword, $left_paren, $members, $right_paren);
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
      $this->_left_paren,
      $this->_members,
      $this->_right_paren,
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

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return
      new self($this->_keyword, $value, $this->_members, $this->_right_paren);
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @returns LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
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
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function hasMembers(): bool {
    return !$this->_members->isMissing();
  }

  /**
   * @returns Missing | EditableList
   */
  public function getMembers(): ?EditableList {
    if ($this->_members->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_members);
  }

  /**
   * @returns EditableList
   */
  public function getMembersx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_members);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return
      new self($this->_keyword, $this->_left_paren, $this->_members, $value);
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @returns RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }
}
