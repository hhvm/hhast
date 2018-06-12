<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3d7f6ef37ae4ecf67358844afe22c6ae>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPEnumType extends EditableNode {

  private EditableNode $_optional;
  private EditableNode $_keyword;
  private EditableNode $_left_brace;
  private EditableNode $_values;
  private EditableNode $_right_brace;

  public function __construct(
    EditableNode $optional,
    EditableNode $keyword,
    EditableNode $left_brace,
    EditableNode $values,
    EditableNode $right_brace,
  ) {
    parent::__construct('xhp_enum_type');
    $this->_optional = $optional;
    $this->_keyword = $keyword;
    $this->_left_brace = $left_brace;
    $this->_values = $values;
    $this->_right_brace = $right_brace;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $optional = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_enum_optional'],
      $file,
      $offset,
      $source,
    );
    $offset += $optional->getWidth();
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_enum_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_enum_left_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_brace->getWidth();
    $values = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_enum_values'],
      $file,
      $offset,
      $source,
    );
    $offset += $values->getWidth();
    $right_brace = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_enum_right_brace'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_brace->getWidth();
    return new static($optional, $keyword, $left_brace, $values, $right_brace);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'optional' => $this->_optional,
      'keyword' => $this->_keyword,
      'left_brace' => $this->_left_brace,
      'values' => $this->_values,
      'right_brace' => $this->_right_brace,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $optional = $this->_optional->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_brace = $this->_left_brace->rewrite($rewriter, $parents);
    $values = $this->_values->rewrite($rewriter, $parents);
    $right_brace = $this->_right_brace->rewrite($rewriter, $parents);
    if (
      $optional === $this->_optional &&
      $keyword === $this->_keyword &&
      $left_brace === $this->_left_brace &&
      $values === $this->_values &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static($optional, $keyword, $left_brace, $values, $right_brace);
  }

  public function getOptionalUNTYPED(): EditableNode {
    return $this->_optional;
  }

  public function withOptional(EditableNode $value): this {
    if ($value === $this->_optional) {
      return $this;
    }
    return new static(
      $value,
      $this->_keyword,
      $this->_left_brace,
      $this->_values,
      $this->_right_brace,
    );
  }

  public function hasOptional(): bool {
    return !$this->_optional->isMissing();
  }

  /**
   * @returns Missing
   */
  public function getOptional(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_optional);
  }

  /**
   * @returns Missing
   */
  public function getOptionalx(): EditableNode {
    return $this->getOptional();
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_optional,
      $value,
      $this->_left_brace,
      $this->_values,
      $this->_right_brace,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns EnumToken
   */
  public function getKeyword(): EnumToken {
    return TypeAssert\instance_of(EnumToken::class, $this->_keyword);
  }

  /**
   * @returns EnumToken
   */
  public function getKeywordx(): EnumToken {
    return $this->getKeyword();
  }

  public function getLeftBraceUNTYPED(): EditableNode {
    return $this->_left_brace;
  }

  public function withLeftBrace(EditableNode $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_optional,
      $this->_keyword,
      $value,
      $this->_values,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @returns LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @returns LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getValuesUNTYPED(): EditableNode {
    return $this->_values;
  }

  public function withValues(EditableNode $value): this {
    if ($value === $this->_values) {
      return $this;
    }
    return new static(
      $this->_optional,
      $this->_keyword,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasValues(): bool {
    return !$this->_values->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getValues(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_values);
  }

  /**
   * @returns EditableList
   */
  public function getValuesx(): EditableList {
    return $this->getValues();
  }

  public function getRightBraceUNTYPED(): EditableNode {
    return $this->_right_brace;
  }

  public function withRightBrace(EditableNode $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_optional,
      $this->_keyword,
      $this->_left_brace,
      $this->_values,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @returns RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @returns RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
