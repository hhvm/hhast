/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2801f5ee3ee8914c01ec4872419662f9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeParameters extends EditableNode {

  private EditableNode $_left_angle;
  private EditableNode $_parameters;
  private EditableNode $_right_angle;

  public function __construct(
    EditableNode $left_angle,
    EditableNode $parameters,
    EditableNode $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_angle = $left_angle;
    $this->_parameters = $parameters;
    $this->_right_angle = $right_angle;
    parent::__construct('type_parameters', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $left_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_parameters_left_angle'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_angle->getWidth();
    $parameters = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_parameters_parameters'],
      $file,
      $offset,
      $source,
    );
    $offset += $parameters->getWidth();
    $right_angle = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['type_parameters_right_angle'],
      $file,
      $offset,
      $source,
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_angle' => $this->_left_angle,
      'parameters' => $this->_parameters,
      'right_angle' => $this->_right_angle,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_angle = $this->_left_angle->rewrite($rewriter, $parents);
    $parameters = $this->_parameters->rewrite($rewriter, $parents);
    $right_angle = $this->_right_angle->rewrite($rewriter, $parents);
    if (
      $left_angle === $this->_left_angle &&
      $parameters === $this->_parameters &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static($left_angle, $parameters, $right_angle);
  }

  public function getLeftAngleUNTYPED(): EditableNode {
    return $this->_left_angle;
  }

  public function withLeftAngle(EditableNode $value): this {
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

  public function getParametersUNTYPED(): EditableNode {
    return $this->_parameters;
  }

  public function withParameters(EditableNode $value): this {
    if ($value === $this->_parameters) {
      return $this;
    }
    return new static($this->_left_angle, $value, $this->_right_angle);
  }

  public function hasParameters(): bool {
    return !$this->_parameters->isMissing();
  }

  /**
   * @return EditableList<TypeParameter>
   */
  public function getParameters(): EditableList<TypeParameter> {
    return TypeAssert\instance_of(EditableList::class, $this->_parameters);
  }

  /**
   * @return EditableList<TypeParameter>
   */
  public function getParametersx(): EditableList<TypeParameter> {
    return $this->getParameters();
  }

  public function getRightAngleUNTYPED(): EditableNode {
    return $this->_right_angle;
  }

  public function withRightAngle(EditableNode $value): this {
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
