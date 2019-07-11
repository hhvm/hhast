/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<44f88d87e78cc9ec66a1dc2aa3053e3c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class XHPSimpleAttribute extends Node implements IXHPAttribute {

  const string SYNTAX_KIND = 'xhp_simple_attribute';

  private XHPElementNameToken $_name;
  private EqualToken $_equal;
  private Node $_expression;

  public function __construct(
    XHPElementNameToken $name,
    EqualToken $equal,
    Node $expression,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_equal = $equal;
    $this->_expression = $expression;
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
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_simple_attribute_name'],
      $file,
      $offset,
      $source,
      'XHPElementNameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_simple_attribute_equal'],
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $equal = $equal as nonnull;
    $offset += $equal->getWidth();
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_simple_attribute_expression'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $expression = $expression as nonnull;
    $offset += $expression->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $equal,
      /* HH_IGNORE_ERROR[4110] */ $expression,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'equal' => $this->_equal,
      'expression' => $this->_expression,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $rewriter($this->_name, $parents);
    $equal = $rewriter($this->_equal, $parents);
    $expression = $rewriter($this->_expression, $parents);
    if (
      $name === $this->_name &&
      $equal === $this->_equal &&
      $expression === $this->_expression
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $equal,
      /* HH_FIXME[4110] use `as` */ $expression,
    );
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(XHPElementNameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_equal, $this->_expression);
  }

  public function hasName(): bool {
    return $this->_name !== null;
  }

  /**
   * @return XHPElementNameToken
   */
  public function getName(): XHPElementNameToken {
    return TypeAssert\instance_of(XHPElementNameToken::class, $this->_name);
  }

  /**
   * @return XHPElementNameToken
   */
  public function getNamex(): XHPElementNameToken {
    return $this->getName();
  }

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(EqualToken $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static($this->_name, $value, $this->_expression);
  }

  public function hasEqual(): bool {
    return $this->_equal !== null;
  }

  /**
   * @return EqualToken
   */
  public function getEqual(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  /**
   * @return EqualToken
   */
  public function getEqualx(): EqualToken {
    return $this->getEqual();
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_name, $this->_equal, $value);
  }

  public function hasExpression(): bool {
    return $this->_expression !== null;
  }

  /**
   * @return BracedExpression | XHPStringLiteralToken
   */
  public function getExpression(): Node {
    return $this->_expression;
  }

  /**
   * @return BracedExpression | XHPStringLiteralToken
   */
  public function getExpressionx(): Node {
    return $this->getExpression();
  }
}
