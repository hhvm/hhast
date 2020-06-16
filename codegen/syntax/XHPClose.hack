/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<be7c21cc10293ab2c02a21e280046c54>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

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
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $left_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_close_left_angle'],
      $file,
      $offset,
      $source,
      'LessThanSlashToken',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_close_name'],
      $file,
      $offset,
      $source,
      'XHPElementNameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_close_right_angle'],
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
      /* HH_IGNORE_ERROR[4110] */ $left_angle,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $right_angle,
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
      /* HH_FIXME[4110] use `as` */ $left_angle,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $right_angle,
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
    return $this->_left_angle !== null;
  }

  /**
   * @return LessThanSlashToken
   */
  public function getLeftAngle(): LessThanSlashToken {
    return TypeAssert\instance_of(
      LessThanSlashToken::class,
      $this->_left_angle,
    );
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
    return $this->_right_angle !== null;
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
