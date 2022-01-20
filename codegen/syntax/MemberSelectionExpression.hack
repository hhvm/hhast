/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f79933a32f03a1ac2a8cccc0ccd6561a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $object = Node::fromJSON(
      ($json['member_object']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $object = $object as nonnull;
    $offset += $object->getWidth();
    $operator = Node::fromJSON(
      ($json['member_operator']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'MinusGreaterThanToken',
    );
    $operator = $operator as nonnull;
    $offset += $operator->getWidth();
    $name = Node::fromJSON(
      ($json['member_name']) as dict<_, _>,
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
      $object as IExpression,
      $operator as MinusGreaterThanToken,
      $name as IExpression,
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
    return true;
  }

  /**
   * @return FunctionCallExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression |
   * PipeVariableExpression | ScopeResolutionExpression | SubscriptExpression |
   * VariableExpression
   */
  public function getObject(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_object);
  }

  /**
   * @return FunctionCallExpression | MemberSelectionExpression |
   * ObjectCreationExpression | ParenthesizedExpression |
   * PipeVariableExpression | ScopeResolutionExpression | SubscriptExpression |
   * VariableExpression
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
    return true;
  }

  /**
   * @return MinusGreaterThanToken
   */
  public function getOperator(): MinusGreaterThanToken {
    return
      TypeAssert\instance_of(MinusGreaterThanToken::class, $this->_operator);
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
    return true;
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
