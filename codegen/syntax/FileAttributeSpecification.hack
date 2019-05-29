/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e1ed69eb780525592e9e89c72ed834db>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class FileAttributeSpecification extends Node {

  const string SYNTAX_KIND = 'file_attribute_specification';

  private Node $_left_double_angle;
  private Node $_keyword;
  private Node $_colon;
  private Node $_attributes;
  private Node $_right_double_angle;

  public function __construct(
    Node $left_double_angle,
    Node $keyword,
    Node $colon,
    Node $attributes,
    Node $right_double_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_double_angle = $left_double_angle;
    $this->_keyword = $keyword;
    $this->_colon = $colon;
    $this->_attributes = $attributes;
    $this->_right_double_angle = $right_double_angle;
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
    $left_double_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['file_attribute_specification_left_double_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_double_angle->getWidth();
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['file_attribute_specification_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['file_attribute_specification_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $attributes = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['file_attribute_specification_attributes'],
      $file,
      $offset,
      $source,
    );
    $offset += $attributes->getWidth();
    $right_double_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['file_attribute_specification_right_double_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_double_angle->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $left_double_angle,
      $keyword,
      $colon,
      $attributes,
      $right_double_angle,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_double_angle' => $this->_left_double_angle,
      'keyword' => $this->_keyword,
      'colon' => $this->_colon,
      'attributes' => $this->_attributes,
      'right_double_angle' => $this->_right_double_angle,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_double_angle = $rewriter($this->_left_double_angle, $parents);
    $keyword = $rewriter($this->_keyword, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $attributes = $rewriter($this->_attributes, $parents);
    $right_double_angle = $rewriter($this->_right_double_angle, $parents);
    if (
      $left_double_angle === $this->_left_double_angle &&
      $keyword === $this->_keyword &&
      $colon === $this->_colon &&
      $attributes === $this->_attributes &&
      $right_double_angle === $this->_right_double_angle
    ) {
      return $this;
    }
    return new static(
      $left_double_angle,
      $keyword,
      $colon,
      $attributes,
      $right_double_angle,
    );
  }

  public function getLeftDoubleAngleUNTYPED(): Node {
    return $this->_left_double_angle;
  }

  public function withLeftDoubleAngle(Node $value): this {
    if ($value === $this->_left_double_angle) {
      return $this;
    }
    return new static(
      $value,
      $this->_keyword,
      $this->_colon,
      $this->_attributes,
      $this->_right_double_angle,
    );
  }

  public function hasLeftDoubleAngle(): bool {
    return !$this->_left_double_angle->isMissing();
  }

  /**
   * @return LessThanLessThanToken
   */
  public function getLeftDoubleAngle(): LessThanLessThanToken {
    return TypeAssert\instance_of(
      LessThanLessThanToken::class,
      $this->_left_double_angle,
    );
  }

  /**
   * @return LessThanLessThanToken
   */
  public function getLeftDoubleAnglex(): LessThanLessThanToken {
    return $this->getLeftDoubleAngle();
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $this->_left_double_angle,
      $value,
      $this->_colon,
      $this->_attributes,
      $this->_right_double_angle,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return FileToken
   */
  public function getKeyword(): FileToken {
    return TypeAssert\instance_of(FileToken::class, $this->_keyword);
  }

  /**
   * @return FileToken
   */
  public function getKeywordx(): FileToken {
    return $this->getKeyword();
  }

  public function getColonUNTYPED(): Node {
    return $this->_colon;
  }

  public function withColon(Node $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_left_double_angle,
      $this->_keyword,
      $value,
      $this->_attributes,
      $this->_right_double_angle,
    );
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @return ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return $this->getColon();
  }

  public function getAttributesUNTYPED(): Node {
    return $this->_attributes;
  }

  public function withAttributes(Node $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return new static(
      $this->_left_double_angle,
      $this->_keyword,
      $this->_colon,
      $value,
      $this->_right_double_angle,
    );
  }

  public function hasAttributes(): bool {
    return !$this->_attributes->isMissing();
  }

  /**
   * @return NodeList<ListItem<ConstructorCall>>
   */
  public function getAttributes(): NodeList<ListItem<ConstructorCall>> {
    return TypeAssert\instance_of(NodeList::class, $this->_attributes);
  }

  /**
   * @return NodeList<ListItem<ConstructorCall>>
   */
  public function getAttributesx(): NodeList<ListItem<ConstructorCall>> {
    return $this->getAttributes();
  }

  public function getRightDoubleAngleUNTYPED(): Node {
    return $this->_right_double_angle;
  }

  public function withRightDoubleAngle(Node $value): this {
    if ($value === $this->_right_double_angle) {
      return $this;
    }
    return new static(
      $this->_left_double_angle,
      $this->_keyword,
      $this->_colon,
      $this->_attributes,
      $value,
    );
  }

  public function hasRightDoubleAngle(): bool {
    return !$this->_right_double_angle->isMissing();
  }

  /**
   * @return GreaterThanGreaterThanToken
   */
  public function getRightDoubleAngle(): GreaterThanGreaterThanToken {
    return TypeAssert\instance_of(
      GreaterThanGreaterThanToken::class,
      $this->_right_double_angle,
    );
  }

  /**
   * @return GreaterThanGreaterThanToken
   */
  public function getRightDoubleAnglex(): GreaterThanGreaterThanToken {
    return $this->getRightDoubleAngle();
  }
}
