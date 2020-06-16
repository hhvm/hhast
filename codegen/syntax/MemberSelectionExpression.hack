/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<42d277ac7e59a1c27b368cc62f7475f3>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class MemberSelectionExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'member_selection_expression';

  private IExpression $_object;
  private MinusGreaterThanToken $_operator;
  private IExpression $_name;

  public function __construct(
    IExpression $object,
    MinusGreaterThanToken $operator,
    IExpression $name,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_object = $object;
    $this->_operator = $operator;
    $this->_name = $name;
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
    $object = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['member_object'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $object = $object as nonnull;
    $offset += $object->getWidth();
    $operator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['member_operator'],
      $file,
      $offset,
      $source,
      'MinusGreaterThanToken',
    );
    $operator = $operator as nonnull;
    $offset += $operator->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['member_name'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $object,
      /* HH_IGNORE_ERROR[4110] */ $operator,
      /* HH_IGNORE_ERROR[4110] */ $name,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'object' => $this->_object,
      'operator' => $this->_operator,
      'name' => $this->_name,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $object = $rewriter($this->_object, $parents);
    $operator = $rewriter($this->_operator, $parents);
    $name = $rewriter($this->_name, $parents);
    if (
      $object === $this->_object &&
      $operator === $this->_operator &&
      $name === $this->_name
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $object,
      /* HH_FIXME[4110] use `as` */ $operator,
      /* HH_FIXME[4110] use `as` */ $name,
    );
  }

  public function getObjectUNTYPED(): ?Node {
    return $this->_object;
  }

  public function withObject(IExpression $value): this {
    if ($value === $this->_object) {
      return $this;
    }
    return new static($value, $this->_operator, $this->_name);
  }

  public function hasObject(): bool {
    return $this->_object !== null;
  }

  /**
   * @return FunctionCallExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression |
   * PipeVariableExpression | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | SubscriptExpression | VariableExpression
   */
  public function getObject(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_object);
  }

  /**
   * @return FunctionCallExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression |
   * PipeVariableExpression | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | SubscriptExpression | VariableExpression
   */
  public function getObjectx(): IExpression {
    return $this->getObject();
  }

  public function getOperatorUNTYPED(): ?Node {
    return $this->_operator;
  }

  public function withOperator(MinusGreaterThanToken $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_object, $value, $this->_name);
  }

  public function hasOperator(): bool {
    return $this->_operator !== null;
  }

  /**
   * @return MinusGreaterThanToken
   */
  public function getOperator(): MinusGreaterThanToken {
    return TypeAssert\instance_of(
      MinusGreaterThanToken::class,
      $this->_operator,
    );
  }

  /**
   * @return MinusGreaterThanToken
   */
  public function getOperatorx(): MinusGreaterThanToken {
    return $this->getOperator();
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(IExpression $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_object, $this->_operator, $value);
  }

  public function hasName(): bool {
    return $this->_name !== null;
  }

  /**
   * @return BracedExpression | XHPClassNameToken | NameToken | VariableToken
   */
  public function getName(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_name);
  }

  /**
   * @return BracedExpression | XHPClassNameToken | NameToken | VariableToken
   */
  public function getNamex(): IExpression {
    return $this->getName();
  }
}
