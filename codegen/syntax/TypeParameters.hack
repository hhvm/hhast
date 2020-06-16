/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1829381ea114088113b6474c9e23e8b7>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class TypeParameters extends Node {

  const string SYNTAX_KIND = 'type_parameters';

  private LessThanToken $_left_angle;
  private NodeList<ListItem<TypeParameter>> $_parameters;
  private GreaterThanToken $_right_angle;

  public function __construct(
    LessThanToken $left_angle,
    NodeList<ListItem<TypeParameter>> $parameters,
    GreaterThanToken $right_angle,
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
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $parameters = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_parameters_parameters'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<TypeParameter>>',
    );
    $parameters = $parameters as nonnull;
    $offset += $parameters->getWidth();
    $right_angle = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_parameters_right_angle'],
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
      /* HH_IGNORE_ERROR[4110] */ $parameters,
      /* HH_IGNORE_ERROR[4110] */ $right_angle,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_angle' => $this->_left_angle,
      'parameters' => $this->_parameters,
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
    $parameters = $rewriter($this->_parameters, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $parameters === $this->_parameters &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $left_angle,
      /* HH_FIXME[4110] use `as` */ $parameters,
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
    return new static($value, $this->_parameters, $this->_right_angle);
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

  public function getParametersUNTYPED(): ?Node {
    return $this->_parameters;
  }

  public function withParameters(
    NodeList<ListItem<TypeParameter>> $value,
  ): this {
    if ($value === $this->_parameters) {
      return $this;
    }
    return new static($this->_left_angle, $value, $this->_right_angle);
  }

  public function hasParameters(): bool {
    return $this->_parameters !== null;
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

  public function getRightAngleUNTYPED(): ?Node {
    return $this->_right_angle;
  }

  public function withRightAngle(GreaterThanToken $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static($this->_left_angle, $this->_parameters, $value);
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
