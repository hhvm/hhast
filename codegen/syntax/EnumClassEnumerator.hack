/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a118ba53420678ea5409097e904eea4e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class EnumClassEnumerator extends Node {

  const string SYNTAX_KIND = 'enum_class_enumerator';

  private ?Node $_name;
  private ?Node $_left_angle;
  private ?Node $_type;
  private ?Node $_right_angle;
  private ?Node $_left_paren;
  private ?Node $_initial_value;
  private ?Node $_right_paren;
  private ?Node $_semicolon;

  public function __construct(
    ?Node $name,
    ?Node $left_angle,
    ?Node $type,
    ?Node $right_angle,
    ?Node $left_paren,
    ?Node $initial_value,
    ?Node $right_paren,
    ?Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_left_angle = $left_angle;
    $this->_type = $type;
    $this->_right_angle = $right_angle;
    $this->_left_paren = $left_paren;
    $this->_initial_value = $initial_value;
    $this->_right_paren = $right_paren;
    $this->_semicolon = $semicolon;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_name'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_left_angle'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_angle?->getWidth() ?? 0;
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type?->getWidth() ?? 0;
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_right_angle'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_angle?->getWidth() ?? 0;
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_left_paren'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_paren?->getWidth() ?? 0;
    $initial_value = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_initial_value'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $initial_value?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_right_paren'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_paren?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['enum_class_enumerator_semicolon'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $semicolon?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $left_angle,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $right_angle,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $initial_value,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'left_angle' => $this->_left_angle,
      'type' => $this->_type,
      'right_angle' => $this->_right_angle,
      'left_paren' => $this->_left_paren,
      'initial_value' => $this->_initial_value,
      'right_paren' => $this->_right_paren,
      'semicolon' => $this->_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $left_angle = $this->_left_angle === null
      ? null
      : $rewriter($this->_left_angle, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $right_angle = $this->_right_angle === null
      ? null
      : $rewriter($this->_right_angle, $parents);
    $left_paren = $this->_left_paren === null
      ? null
      : $rewriter($this->_left_paren, $parents);
    $initial_value = $this->_initial_value === null
      ? null
      : $rewriter($this->_initial_value, $parents);
    $right_paren = $this->_right_paren === null
      ? null
      : $rewriter($this->_right_paren, $parents);
    $semicolon = $this->_semicolon === null
      ? null
      : $rewriter($this->_semicolon, $parents);
    if (
      $name === $this->_name &&
      $left_angle === $this->_left_angle &&
      $type === $this->_type &&
      $right_angle === $this->_right_angle &&
      $left_paren === $this->_left_paren &&
      $initial_value === $this->_initial_value &&
      $right_paren === $this->_right_paren &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $left_angle,
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $right_angle,
      /* HH_FIXME[4110] use `as` */ $left_paren,
      /* HH_FIXME[4110] use `as` */ $initial_value,
      /* HH_FIXME[4110] use `as` */ $right_paren,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_angle,
      $this->_type,
      $this->_right_angle,
      $this->_left_paren,
      $this->_initial_value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasName(): bool {
    return $this->_name !== null;
  }

  /**
   * @return unknown
   */
  public function getName(): ?Node {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): Node {
    return TypeAssert\not_null($this->getName());
  }

  public function getLeftAngleUNTYPED(): ?Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(?Node $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static(
      $this->_name,
      $value,
      $this->_type,
      $this->_right_angle,
      $this->_left_paren,
      $this->_initial_value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasLeftAngle(): bool {
    return $this->_left_angle !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftAngle(): ?Node {
    return $this->_left_angle;
  }

  /**
   * @return unknown
   */
  public function getLeftAnglex(): Node {
    return TypeAssert\not_null($this->getLeftAngle());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_left_angle,
      $value,
      $this->_right_angle,
      $this->_left_paren,
      $this->_initial_value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return unknown
   */
  public function getType(): ?Node {
    return $this->_type;
  }

  /**
   * @return unknown
   */
  public function getTypex(): Node {
    return TypeAssert\not_null($this->getType());
  }

  public function getRightAngleUNTYPED(): ?Node {
    return $this->_right_angle;
  }

  public function withRightAngle(?Node $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_left_angle,
      $this->_type,
      $value,
      $this->_left_paren,
      $this->_initial_value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasRightAngle(): bool {
    return $this->_right_angle !== null;
  }

  /**
   * @return unknown
   */
  public function getRightAngle(): ?Node {
    return $this->_right_angle;
  }

  /**
   * @return unknown
   */
  public function getRightAnglex(): Node {
    return TypeAssert\not_null($this->getRightAngle());
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(?Node $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_left_angle,
      $this->_type,
      $this->_right_angle,
      $value,
      $this->_initial_value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasLeftParen(): bool {
    return $this->_left_paren !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftParen(): ?Node {
    return $this->_left_paren;
  }

  /**
   * @return unknown
   */
  public function getLeftParenx(): Node {
    return TypeAssert\not_null($this->getLeftParen());
  }

  public function getInitialValueUNTYPED(): ?Node {
    return $this->_initial_value;
  }

  public function withInitialValue(?Node $value): this {
    if ($value === $this->_initial_value) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_left_angle,
      $this->_type,
      $this->_right_angle,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_semicolon,
    );
  }

  public function hasInitialValue(): bool {
    return $this->_initial_value !== null;
  }

  /**
   * @return unknown
   */
  public function getInitialValue(): ?Node {
    return $this->_initial_value;
  }

  /**
   * @return unknown
   */
  public function getInitialValuex(): Node {
    return TypeAssert\not_null($this->getInitialValue());
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(?Node $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_left_angle,
      $this->_type,
      $this->_right_angle,
      $this->_left_paren,
      $this->_initial_value,
      $value,
      $this->_semicolon,
    );
  }

  public function hasRightParen(): bool {
    return $this->_right_paren !== null;
  }

  /**
   * @return unknown
   */
  public function getRightParen(): ?Node {
    return $this->_right_paren;
  }

  /**
   * @return unknown
   */
  public function getRightParenx(): Node {
    return TypeAssert\not_null($this->getRightParen());
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(?Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_name,
      $this->_left_angle,
      $this->_type,
      $this->_right_angle,
      $this->_left_paren,
      $this->_initial_value,
      $this->_right_paren,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
  }

  /**
   * @return unknown
   */
  public function getSemicolon(): ?Node {
    return $this->_semicolon;
  }

  /**
   * @return unknown
   */
  public function getSemicolonx(): Node {
    return TypeAssert\not_null($this->getSemicolon());
  }
}
