/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b1d784c45ba607ec8ddd04015c961e68>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ScopeResolutionExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'scope_resolution_expression';

  private Node $_qualifier;
  private Node $_operator;
  private Node $_name;

  public function __construct(
    Node $qualifier,
    Node $operator,
    Node $name,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_qualifier = $qualifier;
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
    $qualifier = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['scope_resolution_qualifier'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $qualifier->getWidth();
    $operator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['scope_resolution_operator'],
      $file,
      $offset,
      $source,
      'ColonColonToken',
    );
    $offset += $operator->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['scope_resolution_name'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($qualifier, $operator, $name, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'qualifier' => $this->_qualifier,
      'operator' => $this->_operator,
      'name' => $this->_name,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $qualifier = $rewriter($this->_qualifier, $parents);
    $operator = $rewriter($this->_operator, $parents);
    $name = $rewriter($this->_name, $parents);
    if (
      $qualifier === $this->_qualifier &&
      $operator === $this->_operator &&
      $name === $this->_name
    ) {
      return $this;
    }
    return new static($qualifier, $operator, $name);
  }

  public function getQualifierUNTYPED(): Node {
    return $this->_qualifier;
  }

  public function withQualifier(Node $value): this {
    if ($value === $this->_qualifier) {
      return $this;
    }
    return new static($value ?? Missing(), $this->_operator, $this->_name);
  }

  public function hasQualifier(): bool {
    return !$this->_qualifier->isMissing();
  }

  /**
   * @return FunctionCallExpression | LiteralExpression |
   * ParenthesizedExpression | PipeVariableExpression | QualifiedName |
   * ScopeResolutionExpression | SimpleTypeSpecifier | XHPClassNameToken |
   * NameToken | ParentToken | SelfToken | StaticToken | VariableExpression
   */
  public function getQualifier(): Node {
    return $this->_qualifier;
  }

  /**
   * @return FunctionCallExpression | LiteralExpression |
   * ParenthesizedExpression | PipeVariableExpression | QualifiedName |
   * ScopeResolutionExpression | SimpleTypeSpecifier | XHPClassNameToken |
   * NameToken | ParentToken | SelfToken | StaticToken | VariableExpression
   */
  public function getQualifierx(): Node {
    return $this->getQualifier();
  }

  public function getOperatorUNTYPED(): Node {
    return $this->_operator;
  }

  public function withOperator(ColonColonToken $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_qualifier, $value ?? Missing(), $this->_name);
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

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_qualifier, $this->_operator, $value ?? Missing());
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return BracedExpression | ConstructToken | ClassToken | NameToken |
   * VariableToken
   */
  public function getName(): Node {
    return $this->_name;
  }

  /**
   * @return BracedExpression | ConstructToken | ClassToken | NameToken |
   * VariableToken
   */
  public function getNamex(): Node {
    return $this->getName();
  }
}
