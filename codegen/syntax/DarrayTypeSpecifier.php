<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0eb540c44888a49a8d7e3bad7be7e325>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class DarrayTypeSpecifier extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_left_angle;
  private EditableNode $_key;
  private EditableNode $_comma;
  private EditableNode $_value;
  private EditableNode $_trailing_comma;
  private EditableNode $_right_angle;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_angle,
    EditableNode $key,
    EditableNode $comma,
    EditableNode $value,
    EditableNode $trailing_comma,
    EditableNode $right_angle,
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
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_left_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_angle->getWidth();
    $key = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_key'],
      $file,
      $offset,
      $source,
    );
    $offset += $key->getWidth();
    $comma = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_comma'],
      $file,
      $offset,
      $source,
    );
    $offset += $comma->getWidth();
    $value = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_value'],
      $file,
      $offset,
      $source,
    );
    $offset += $value->getWidth();
    $trailing_comma = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_trailing_comma'],
      $file,
      $offset,
      $source,
    );
    $offset += $trailing_comma->getWidth();
    $right_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['darray_right_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_angle->getWidth();
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_angle' => $this->_left_angle,
      'key' => $this->_key,
      'comma' => $this->_comma,
      'value' => $this->_value,
      'trailing_comma' => $this->_trailing_comma,
      'right_angle' => $this->_right_angle,
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

  public function getLeftAngleUNTYPED(): EditableNode {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableNode $value): this {
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

  public function getKeyUNTYPED(): EditableNode {
    return $this->_key;
  }

  public function withKey(EditableNode $value): this {
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

  public function getCommaUNTYPED(): EditableNode {
    return $this->_comma;
  }

  public function withComma(EditableNode $value): this {
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

  public function getValueUNTYPED(): EditableNode {
    return $this->_value;
  }

  public function withValue(EditableNode $value): this {
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

  public function getTrailingCommaUNTYPED(): EditableNode {
    return $this->_trailing_comma;
  }

  public function withTrailingComma(EditableNode $value): this {
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
  public function getTrailingComma(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_trailing_comma);
  }

  public function getRightAngleUNTYPED(): EditableNode {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableNode $value): this {
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
