/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<728a373cbabab0c06e21de12978c7f6b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPOpen extends Node {

  const string SYNTAX_KIND = 'xhp_open';

  private Node $_left_angle;
  private Node $_name;
  private Node $_attributes;
  private Node $_right_angle;

  public function __construct(
    Node $left_angle,
    Node $name,
    Node $attributes,
    Node $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_angle = $left_angle;
    $this->_name = $name;
    $this->_attributes = $attributes;
    $this->_right_angle = $right_angle;
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
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_open_left_angle'],
      $file,
      $offset,
      $source,
      'LessThanToken',
    );
    $offset += $left_angle->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_open_name'],
      $file,
      $offset,
      $source,
      'XHPElementNameToken',
    );
    $offset += $name->getWidth();
    $attributes = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_open_attributes'],
      $file,
      $offset,
      $source,
      'NodeList<Node>',
    );
    $offset += $attributes->getWidth();
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_open_right_angle'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $right_angle->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $left_angle,
      $name,
      $attributes,
      $right_angle,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_angle' => $this->_left_angle,
      'name' => $this->_name,
      'attributes' => $this->_attributes,
      'right_angle' => $this->_right_angle,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_angle = $rewriter($this->_left_angle, $parents);
    $name = $rewriter($this->_name, $parents);
    $attributes = $rewriter($this->_attributes, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $name === $this->_name &&
      $attributes === $this->_attributes &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static($left_angle, $name, $attributes, $right_angle);
  }

  public function getLeftAngleUNTYPED(): Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(LessThanToken $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_name,
      $this->_attributes,
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

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(XHPElementNameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_left_angle,
      $value ?? Missing(),
      $this->_attributes,
      $this->_right_angle,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return XHPElementNameToken
   */
  public function getName(): XHPElementNameToken {
    return TypeAssert\instance_of(XHPElementNameToken::class, $this->_name);
  }

  /**
   * @return XHPElementNameToken
   */
  public function getNamex(): XHPElementNameToken {
    return $this->getName();
  }

  public function getAttributesUNTYPED(): Node {
    return $this->_attributes;
  }

  public function withAttributes(?NodeList<Node> $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return new static(
      $this->_left_angle,
      $this->_name,
      $value ?? Missing(),
      $this->_right_angle,
    );
  }

  public function hasAttributes(): bool {
    return !$this->_attributes->isMissing();
  }

  /**
   * @return NodeList<XHPSimpleAttribute> | NodeList<Node> |
   * NodeList<XHPSpreadAttribute> | null
   */
  public function getAttributes(): ?NodeList<Node> {
    if ($this->_attributes->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_attributes);
  }

  /**
   * @return NodeList<XHPSimpleAttribute> | NodeList<Node> |
   * NodeList<XHPSpreadAttribute>
   */
  public function getAttributesx(): NodeList<Node> {
    return TypeAssert\not_null($this->getAttributes());
  }

  public function getRightAngleUNTYPED(): Node {
    return $this->_right_angle;
  }

  public function withRightAngle(Token $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static(
      $this->_left_angle,
      $this->_name,
      $this->_attributes,
      $value ?? Missing(),
    );
  }

  public function hasRightAngle(): bool {
    return !$this->_right_angle->isMissing();
  }

  /**
   * @return SlashGreaterThanToken | GreaterThanToken
   */
  public function getRightAngle(): Token {
    return TypeAssert\instance_of(Token::class, $this->_right_angle);
  }

  /**
   * @return SlashGreaterThanToken | GreaterThanToken
   */
  public function getRightAnglex(): Token {
    return $this->getRightAngle();
  }
}
