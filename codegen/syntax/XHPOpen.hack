/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<923889b4b1c0b87bbdadbc32d8c54f05>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class XHPOpen extends Node {

  const string SYNTAX_KIND = 'xhp_open';

  private LessThanToken $_left_angle;
  private XHPElementNameToken $_name;
  private ?NodeList<Node> $_attributes;
  private Token $_right_angle;

  public function __construct(
    LessThanToken $left_angle,
    XHPElementNameToken $name,
    ?NodeList<Node> $attributes,
    Token $right_angle,
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
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_open_name'],
      $file,
      $offset,
      $source,
      'XHPElementNameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $attributes = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_open_attributes'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<Node>',
    );
    $offset += $attributes?->getWidth() ?? 0;
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_open_right_angle'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $right_angle = $right_angle as nonnull;
    $offset += $right_angle->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_angle,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $attributes,
      /* HH_IGNORE_ERROR[4110] */ $right_angle,
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
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_angle = $rewriter($this->_left_angle, $parents);
    $name = $rewriter($this->_name, $parents);
    $attributes = $this->_attributes === null
      ? null
      : $rewriter($this->_attributes, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $name === $this->_name &&
      $attributes === $this->_attributes &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $left_angle,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $attributes,
      /* HH_FIXME[4110] use `as` */ $right_angle,
    );
  }

  public function getLeftAngleUNTYPED(): ?Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(LessThanToken $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static(
      $value,
      $this->_name,
      $this->_attributes,
      $this->_right_angle,
    );
  }

  public function hasLeftAngle(): bool {
    return $this->_left_angle !== null;
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

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(XHPElementNameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_left_angle,
      $value,
      $this->_attributes,
      $this->_right_angle,
    );
  }

  public function hasName(): bool {
    return $this->_name !== null;
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

  public function getAttributesUNTYPED(): ?Node {
    return $this->_attributes;
  }

  public function withAttributes(?NodeList<Node> $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return new static(
      $this->_left_angle,
      $this->_name,
      $value,
      $this->_right_angle,
    );
  }

  public function hasAttributes(): bool {
    return $this->_attributes !== null;
  }

  /**
   * @return NodeList<XHPSimpleAttribute> | NodeList<Node> |
   * NodeList<XHPSpreadAttribute> | null
   */
  public function getAttributes(): ?NodeList<Node> {
    return $this->_attributes;
  }

  /**
   * @return NodeList<XHPSimpleAttribute> | NodeList<Node> |
   * NodeList<XHPSpreadAttribute>
   */
  public function getAttributesx(): NodeList<Node> {
    return TypeAssert\not_null($this->getAttributes());
  }

  public function getRightAngleUNTYPED(): ?Node {
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
      $value,
    );
  }

  public function hasRightAngle(): bool {
    return $this->_right_angle !== null;
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
