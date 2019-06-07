/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a885138941c9c6543a70328f104bf6ec>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeParameters extends Node {

  const string SYNTAX_KIND = 'type_parameters';

  private Node $_left_angle;
  private Node $_parameters;
  private Node $_right_angle;

  public function __construct(
    Node $left_angle,
    Node $parameters,
    Node $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_angle = $left_angle;
    $this->_parameters = $parameters;
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
      /* HH_FIXME[4110] */ $json['type_parameters_left_angle'],
      $file,
      $offset,
      $source,
      'LessThanToken',
    );
    $offset += $left_angle->getWidth();
    $parameters = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_parameters_parameters'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<TypeParameter>>',
    );
    $offset += $parameters->getWidth();
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_parameters_right_angle'],
      $file,
      $offset,
      $source,
      'GreaterThanToken',
    );
    $offset += $right_angle->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_angle, $parameters, $right_angle, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_angle' => $this->_left_angle,
      'parameters' => $this->_parameters,
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
    $parameters = $rewriter($this->_parameters, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $parameters === $this->_parameters &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static($left_angle, $parameters, $right_angle);
  }

  public function getLeftAngleUNTYPED(): Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(Node $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static($value, $this->_parameters, $this->_right_angle);
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

  public function getParametersUNTYPED(): Node {
    return $this->_parameters;
  }

  public function withParameters(Node $value): this {
    if ($value === $this->_parameters) {
      return $this;
    }
    return new static($this->_left_angle, $value, $this->_right_angle);
  }

  public function hasParameters(): bool {
    return !$this->_parameters->isMissing();
  }

  /**
   * @return NodeList<ListItem<TypeParameter>>
   */
  public function getParameters(): NodeList<ListItem<TypeParameter>> {
    return TypeAssert\instance_of(NodeList::class, $this->_parameters);
  }

  /**
   * @return NodeList<ListItem<TypeParameter>>
   */
  public function getParametersx(): NodeList<ListItem<TypeParameter>> {
    return $this->getParameters();
  }

  public function getRightAngleUNTYPED(): Node {
    return $this->_right_angle;
  }

  public function withRightAngle(Node $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static($this->_left_angle, $this->_parameters, $value);
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
