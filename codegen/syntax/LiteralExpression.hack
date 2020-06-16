/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1a9d146f36b980d6c4b1dca54ccb579b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class LiteralExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'literal_expression';

  private ?Node $_expression;

  public function __construct(
    ?Node $expression,
    ?__Private\SourceRef $source_ref = null,
  ) {
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
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['literal_expression'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $expression?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(/* HH_IGNORE_ERROR[4110] */ $expression, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
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
    $expression = $this->_expression === null
      ? null
      : $rewriter($this->_expression, $parents);
    if ($expression === $this->_expression) {
      return $this;
    }
    return new static(/* HH_FIXME[4110] use `as` */ $expression);
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(?Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($value);
  }

  public function hasExpression(): bool {
    return $this->_expression !== null;
  }

  /**
   * @return unknown
   */
  public function getExpression(): ?Node {
    return $this->_expression;
  }

  /**
   * @return unknown
   */
  public function getExpressionx(): Node {
    return TypeAssert\not_null($this->getExpression());
  }
}
