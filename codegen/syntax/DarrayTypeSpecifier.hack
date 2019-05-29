/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e885be27563003416a58eef94695c508>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class DarrayTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'darray_type_specifier';

  private Node $_keyword;
  private Node $_left_angle;
  private Node $_key;
  private Node $_comma;
  private Node $_value;
  private Node $_trailing_comma;
  private Node $_right_angle;

  public function __construct(
    Node $keyword,
    Node $left_angle,
    Node $key,
    Node $comma,
    Node $value,
    Node $trailing_comma,
    Node $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_key = $key;
    $this->_comma = $comma;
    $this->_value = $value;
    $this->_trailing_comma = $trailing_comma;
    $this->_right_angle = $right_angle;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_left_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_angle->getWidth();
    $key = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_key'],
      $file,
      $offset,
      $source,
    );
    $offset += $key->getWidth();
    $comma = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_comma'],
      $file,
      $offset,
      $source,
    );
    $offset += $comma->getWidth();
    $value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_value'],
      $file,
      $offset,
      $source,
    );
    $offset += $value->getWidth();
    $trailing_comma = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_trailing_comma'],
      $file,
      $offset,
      $source,
    );
    $offset += $trailing_comma->getWidth();
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['darray_right_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_angle->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $left_angle,
      $key,
      $comma,
      $value,
      $trailing_comma,
      $right_angle,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $left_angle = $rewriter($this->_left_angle, $parents);
    $key = $rewriter($this->_key, $parents);
    $comma = $rewriter($this->_comma, $parents);
    $value = $rewriter($this->_value, $parents);
    $trailing_comma = $rewriter($this->_trailing_comma, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
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
    return new static(
      $keyword,
      $left_angle,
      $key,
      $comma,
      $value,
      $trailing_comma,
      $right_angle,
    );
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
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
   * @return DarrayToken
   */
  public function getKeyword(): DarrayToken {
    return TypeAssert\instance_of(DarrayToken::class, $this->_keyword);
  }

  /**
   * @return DarrayToken
   */
  public function getKeywordx(): DarrayToken {
    return $this->getKeyword();
  }

  public function getLeftAngleUNTYPED(): Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(Node $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static(
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
   * @return LessThanToken
   */
  public function getLeftAngle(): LessThanToken {
    return TypeAssert\instance_of(LessThanToken::class, $this->_left_angle);
  }

  /**
   * @return LessThanToken
   */
  public function getLeftAnglex(): LessThanToken {
    return $this->getLeftAngle();
  }

  public function getKeyUNTYPED(): Node {
    return $this->_key;
  }

  public function withKey(Node $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new static(
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
   * @return SimpleTypeSpecifier
   */
  public function getKey(): SimpleTypeSpecifier {
    return TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_key);
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getKeyx(): SimpleTypeSpecifier {
    return $this->getKey();
  }

  public function getCommaUNTYPED(): Node {
    return $this->_comma;
  }

  public function withComma(Node $value): this {
    if ($value === $this->_comma) {
      return $this;
    }
    return new static(
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
   * @return CommaToken
   */
  public function getComma(): CommaToken {
    return TypeAssert\instance_of(CommaToken::class, $this->_comma);
  }

  /**
   * @return CommaToken
   */
  public function getCommax(): CommaToken {
    return $this->getComma();
  }

  public function getValueUNTYPED(): Node {
    return $this->_value;
  }

  public function withValue(Node $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new static(
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
   * @return DarrayTypeSpecifier | NullableTypeSpecifier | SimpleTypeSpecifier
   * | VarrayTypeSpecifier | VectorArrayTypeSpecifier
   */
  public function getValue(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_value);
  }

  /**
   * @return DarrayTypeSpecifier | NullableTypeSpecifier | SimpleTypeSpecifier
   * | VarrayTypeSpecifier | VectorArrayTypeSpecifier
   */
  public function getValuex(): ITypeSpecifier {
    return $this->getValue();
  }

  public function getTrailingCommaUNTYPED(): Node {
    return $this->_trailing_comma;
  }

  public function withTrailingComma(Node $value): this {
    if ($value === $this->_trailing_comma) {
      return $this;
    }
    return new static(
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
   * @return null
   */
  public function getTrailingComma(): ?Node {
    if ($this->_trailing_comma->isMissing()) {
      return null;
    }
    return $this->_trailing_comma;
  }

  /**
   * @return
   */
  public function getTrailingCommax(): Node {
    return TypeAssert\not_null($this->getTrailingComma());
  }

  public function getRightAngleUNTYPED(): Node {
    return $this->_right_angle;
  }

  public function withRightAngle(Node $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static(
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
   * @return GreaterThanToken
   */
  public function getRightAngle(): GreaterThanToken {
    return TypeAssert\instance_of(GreaterThanToken::class, $this->_right_angle);
  }

  /**
   * @return GreaterThanToken
   */
  public function getRightAnglex(): GreaterThanToken {
    return $this->getRightAngle();
  }
}
