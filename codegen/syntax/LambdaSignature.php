<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2f6e06b919e471c13439925780483d77>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class LambdaSignature extends EditableNode {

  private EditableNode $_left_paren;
  private EditableNode $_parameters;
  private EditableNode $_right_paren;
  private EditableNode $_colon;
  private EditableNode $_type;

  public function __construct(
    EditableNode $left_paren,
    EditableNode $parameters,
    EditableNode $right_paren,
    EditableNode $colon,
    EditableNode $type,
  ) {
    parent::__construct('lambda_signature');
    $this->_left_paren = $left_paren;
    $this->_parameters = $parameters;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_type = $type;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $parameters = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_parameters'],
      $file,
      $offset,
      $source,
    );
    $offset += $parameters->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['lambda_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    return new static($left_paren, $parameters, $right_paren, $colon, $type);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'left_paren' => $this->_left_paren,
      'parameters' => $this->_parameters,
      'right_paren' => $this->_right_paren,
      'colon' => $this->_colon,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $parameters = $this->_parameters->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $parameters === $this->_parameters &&
      $right_paren === $this->_right_paren &&
      $colon === $this->_colon &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new static($left_paren, $parameters, $right_paren, $colon, $type);
  }

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $value,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @return null | LeftParenToken
   */
  public function getLeftParen(): ?LeftParenToken {
    if ($this->_left_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  public function getParametersUNTYPED(): EditableNode {
    return $this->_parameters;
  }

  public function withParameters(EditableNode $value): this {
    if ($value === $this->_parameters) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
    );
  }

  public function hasParameters(): bool {
    return !$this->_parameters->isMissing();
  }

  /**
   * @return EditableList<ParameterDeclaration> | EditableList<EditableNode> |
   * EditableList<VariadicParameter> | null
   */
  public function getParameters(): ?EditableList<EditableNode> {
    if ($this->_parameters->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_parameters);
  }

  /**
   * @return EditableList<ParameterDeclaration> | EditableList<EditableNode> |
   * EditableList<VariadicParameter>
   */
  public function getParametersx(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_parameters);
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_parameters,
      $value,
      $this->_colon,
      $this->_type,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @return null | RightParenToken
   */
  public function getRightParen(): ?RightParenToken {
    if ($this->_right_paren->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $value,
      $this->_type,
    );
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @return null | ColonToken
   */
  public function getColon(): ?ColonToken {
    if ($this->_colon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $value,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier
   * | null | SimpleTypeSpecifier
   */
  public function getType(): ?EditableNode {
    if ($this->_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier
   * | SimpleTypeSpecifier
   */
  public function getTypex(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }
}
