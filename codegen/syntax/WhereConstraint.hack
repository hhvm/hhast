/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<79d420983bf86f9cea4c99090d98855e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class WhereConstraint extends Node {

  const string SYNTAX_KIND = 'where_constraint';

  private ITypeSpecifier $_left_type;
  private Token $_operator;
  private Node $_right_type;

  public function __construct(
    ITypeSpecifier $left_type,
    Token $operator,
    Node $right_type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_type = $left_type;
    $this->_operator = $operator;
    $this->_right_type = $right_type;
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
    $left_type = Node::fromJSON(
      ($json['where_constraint_left_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $left_type = $left_type as nonnull;
    $offset += $left_type->getWidth();
    $operator = Node::fromJSON(
      ($json['where_constraint_operator']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Token',
    );
    $operator = $operator as nonnull;
    $offset += $operator->getWidth();
    $right_type = Node::fromJSON(
      ($json['where_constraint_right_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $right_type = $right_type as nonnull;
    $offset += $right_type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_type,
      /* HH_IGNORE_ERROR[4110] */ $operator,
      /* HH_IGNORE_ERROR[4110] */ $right_type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_type' => $this->_left_type,
      'operator' => $this->_operator,
      'right_type' => $this->_right_type,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_type = $rewriter($this->_left_type, $parents);
    $operator = $rewriter($this->_operator, $parents);
    $right_type = $rewriter($this->_right_type, $parents);
    if (
      $left_type === $this->_left_type &&
      $operator === $this->_operator &&
      $right_type === $this->_right_type
    ) {
      return $this;
    }
    return new static(
      $left_type as ITypeSpecifier,
      $operator as Token,
      $right_type as Node,
    );
  }

  public function getLeftTypeUNTYPED(): ?Node {
    return $this->_left_type;
  }

  public function withLeftType(ITypeSpecifier $value): this {
    if ($value === $this->_left_type) {
      return $this;
    }
    return new static($value, $this->_operator, $this->_right_type);
  }

  public function hasLeftType(): bool {
    return true;
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier | TypeConstant |
   * VectorTypeSpecifier
   */
  public function getLeftType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_left_type);
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier | TypeConstant |
   * VectorTypeSpecifier
   */
  public function getLeftTypex(): ITypeSpecifier {
    return $this->getLeftType();
  }

  public function getOperatorUNTYPED(): ?Node {
    return $this->_operator;
  }

  public function withOperator(Token $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_left_type, $value, $this->_right_type);
  }

  public function hasOperator(): bool {
    return true;
  }

  /**
   * @return EqualToken | AsToken | SuperToken
   */
  public function getOperator(): Token {
    return TypeAssert\instance_of(Token::class, $this->_operator);
  }

  /**
   * @return EqualToken | AsToken | SuperToken
   */
  public function getOperatorx(): Token {
    return $this->getOperator();
  }

  public function getRightTypeUNTYPED(): ?Node {
    return $this->_right_type;
  }

  public function withRightType(Node $value): this {
    if ($value === $this->_right_type) {
      return $this;
    }
    return new static($this->_left_type, $this->_operator, $value);
  }

  public function hasRightType(): bool {
    return true;
  }

  /**
   * @return DictionaryTypeSpecifier | GenericTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | TypeConstant |
   * TypeRefinement | VectorTypeSpecifier
   */
  public function getRightType(): Node {
    return $this->_right_type;
  }

  /**
   * @return DictionaryTypeSpecifier | GenericTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier | TypeConstant |
   * TypeRefinement | VectorTypeSpecifier
   */
  public function getRightTypex(): Node {
    return $this->getRightType();
  }
}
