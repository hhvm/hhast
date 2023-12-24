/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f5b78da0c98f2c793892a61b335b811c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $left_angle = Node::fromJSON(
      ($json['type_parameters_left_angle']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LessThanToken',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $parameters = Node::fromJSON(
      ($json['type_parameters_parameters']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<TypeParameter>>',
    );
    $parameters = $parameters as nonnull;
    $offset += $parameters->getWidth();
    $right_angle = Node::fromJSON(
      ($json['type_parameters_right_angle']) as dict<_, _>,
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
      $left_angle as LessThanToken,
      \HH\FIXME\UNSAFE_CAST<NodeList<Node>, NodeList<ListItem<TypeParameter>>>(
        $parameters as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_angle as GreaterThanToken,
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
      $left_angle as LessThanToken,
      \HH\FIXME\UNSAFE_CAST<NodeList<Node>, NodeList<ListItem<TypeParameter>>>(
        $parameters as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_angle as GreaterThanToken,
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
    return true;
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
