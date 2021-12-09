/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<243e065f3cdf52e50e7fcb9bbaa641c2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $left_angle = Node::fromJSON(
      ($json['xhp_open_left_angle']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LessThanToken',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $name = Node::fromJSON(
      ($json['xhp_open_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'XHPElementNameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $attributes = Node::fromJSON(
      ($json['xhp_open_attributes'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<Node>',
    );
    $offset += $attributes?->getWidth() ?? 0;
    $right_angle = Node::fromJSON(
      ($json['xhp_open_right_angle']) as dict<_, _>,
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
      $left_angle as LessThanToken,
      $name as XHPElementNameToken,
      /* HH_FIXME[4110] ?NodeList<Node> may not be enforceable */ $attributes,
      $right_angle as Token,
    );
  }

  public function getLeftAngleUNTYPED(): ?Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(LessThanToken $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return
      new static($value, $this->_name, $this->_attributes, $this->_right_angle);
  }

  public function hasLeftAngle(): bool {
    return true;
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
    return true;
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
    return
      new static($this->_left_angle, $this->_name, $value, $this->_right_angle);
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
    return
      new static($this->_left_angle, $this->_name, $this->_attributes, $value);
  }

  public function hasRightAngle(): bool {
    return true;
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
