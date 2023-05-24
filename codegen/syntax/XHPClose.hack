/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2baafe579c6f1a79cfac26fc9b6bc86d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class XHPClose extends Node {

  const string SYNTAX_KIND = 'xhp_close';

  private LessThanSlashToken $_left_angle;
  private XHPElementNameToken $_name;
  private GreaterThanToken $_right_angle;

  public function __construct(
    LessThanSlashToken $left_angle,
    XHPElementNameToken $name,
    GreaterThanToken $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_angle = $left_angle;
    $this->_name = $name;
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
      ($json['xhp_close_left_angle']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LessThanSlashToken',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $name = Node::fromJSON(
      ($json['xhp_close_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'XHPElementNameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $right_angle = Node::fromJSON(
      ($json['xhp_close_right_angle']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'GreaterThanToken',
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
      $left_angle as LessThanSlashToken,
      $name as XHPElementNameToken,
      $right_angle as GreaterThanToken,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_angle' => $this->_left_angle,
      'name' => $this->_name,
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
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $name === $this->_name &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static(
      $left_angle as LessThanSlashToken,
      $name as XHPElementNameToken,
      $right_angle as GreaterThanToken,
    );
  }

  public function getLeftAngleUNTYPED(): ?Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(LessThanSlashToken $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static($value, $this->_name, $this->_right_angle);
  }

  public function hasLeftAngle(): bool {
    return true;
  }

  /**
   * @return LessThanSlashToken
   */
  public function getLeftAngle(): LessThanSlashToken {
    return
      TypeAssert\instance_of(LessThanSlashToken::class, $this->_left_angle);
  }

  /**
   * @return LessThanSlashToken
   */
  public function getLeftAnglex(): LessThanSlashToken {
    return $this->getLeftAngle();
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(XHPElementNameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_left_angle, $value, $this->_right_angle);
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

  public function getRightAngleUNTYPED(): ?Node {
    return $this->_right_angle;
  }

  public function withRightAngle(GreaterThanToken $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static($this->_left_angle, $this->_name, $value);
  }

  public function hasRightAngle(): bool {
    return true;
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
