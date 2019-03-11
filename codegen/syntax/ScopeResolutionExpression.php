<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d16f6ccb587648979bb6a09eda4732a6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
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
    string $file,
    int $offset,
    string $source,
  ): this {
    $qualifier = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['scope_resolution_qualifier'],
      $file,
      $offset,
      $source,
    );
    $offset += $qualifier->getWidth();
    $operator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['scope_resolution_operator'],
      $file,
      $offset,
      $source,
    );
    $offset += $operator->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['scope_resolution_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    return new static($qualifier, $operator, $name);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'qualifier' => $this->_qualifier,
      'operator' => $this->_operator,
      'name' => $this->_name,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
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
    return new static($qualifier, $operator, $name);
  }

  public function getQualifierUNTYPED(): EditableNode {
    return $this->_qualifier;
  }

  public function withQualifier(EditableNode $value): this {
    if ($value === $this->_qualifier) {
      return $this;
    }
    return new static($value, $this->_operator, $this->_name);
  }

  public function hasQualifier(): bool {
    return !$this->_qualifier->isMissing();
  }

  /**
   * @return FunctionCallExpression | GenericTypeSpecifier | LiteralExpression
   * | ParenthesizedExpression | PipeVariableExpression | QualifiedName |
   * ScopeResolutionExpression | SimpleTypeSpecifier | XHPClassNameToken |
   * NameToken | ParentToken | SelfToken | StaticToken | VariableExpression
   */
  public function getQualifier(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_qualifier);
  }

  /**
   * @return FunctionCallExpression | GenericTypeSpecifier | LiteralExpression
   * | ParenthesizedExpression | PipeVariableExpression | QualifiedName |
   * ScopeResolutionExpression | SimpleTypeSpecifier | XHPClassNameToken |
   * NameToken | ParentToken | SelfToken | StaticToken | VariableExpression
   */
  public function getQualifierx(): EditableNode {
    return $this->getQualifier();
  }

  public function getOperatorUNTYPED(): EditableNode {
    return $this->_operator;
  }

  public function withOperator(EditableNode $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_qualifier, $value, $this->_name);
  }

  public function hasOperator(): bool {
    return !$this->_operator->isMissing();
  }

  /**
   * @return ColonColonToken
   */
  public function getOperator(): ColonColonToken {
    return TypeAssert\instance_of(ColonColonToken::class, $this->_operator);
  }

  /**
   * @return ColonColonToken
   */
  public function getOperatorx(): ColonColonToken {
    return $this->getOperator();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_qualifier, $this->_operator, $value);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return BracedExpression | ClassToken | NameToken | VariableToken
   */
  public function getName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  /**
   * @return BracedExpression | ClassToken | NameToken | VariableToken
   */
  public function getNamex(): EditableNode {
    return $this->getName();
  }
}
