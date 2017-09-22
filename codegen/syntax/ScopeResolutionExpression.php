<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d73f5c54c6bece0411f126c753fc01ab>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ScopeResolutionExpression extends EditableNode {

  private EditableNode $_qualifier;
  private EditableNode $_operator;
  private EditableNode $_name;

  public function __construct(
    EditableNode $qualifier,
    EditableNode $operator,
    EditableNode $name,
  ) {
    parent::__construct('scope_resolution_expression');
    $this->_qualifier = $qualifier;
    $this->_operator = $operator;
    $this->_name = $name;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $qualifier = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['scope_resolution_qualifier'],
      $position,
      $source,
    );
    $position += $qualifier->getWidth();
    $operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['scope_resolution_operator'],
      $position,
      $source,
    );
    $position += $operator->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['scope_resolution_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    return new self($qualifier, $operator, $name);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'qualifier' => $this->_qualifier,
      'operator' => $this->_operator,
      'name' => $this->_name,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $qualifier = $this->_qualifier->rewrite($rewriter, $parents);
    $operator = $this->_operator->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    if (
      $qualifier === $this->_qualifier &&
      $operator === $this->_operator &&
      $name === $this->_name
    ) {
      return $this;
    }
    return new self($qualifier, $operator, $name);
  }

  public function getQualifierUNTYPED(): EditableNode {
    return $this->_qualifier;
  }

  public function withQualifier(EditableNode $value): this {
    if ($value === $this->_qualifier) {
      return $this;
    }
    return new self($value, $this->_operator, $this->_name);
  }

  public function hasQualifier(): bool {
    return !$this->_qualifier->isMissing();
  }

  /**
   * @returns QualifiedNameExpression | SelfToken | VariableExpression |
   * StaticToken | PrefixUnaryExpression | ParentToken | FunctionCallExpression
   * | ParenthesizedExpression | LiteralExpression | ScopeResolutionExpression
   * | SimpleTypeSpecifier | PipeVariableExpression
   */
  public function getQualifier(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_qualifier);
  }

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($this->_qualifier, $value, $this->_name);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @returns ColonColonToken
   */
  public function getOperator(): ColonColonToken {
    return TypeAssert\instance_of(ColonColonToken::class, $this->_operator);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_qualifier, $this->_operator, $value);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns NameToken | VariableToken | ClassToken | PrefixUnaryExpression |
   * Missing
   */
  public function getName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }
}
