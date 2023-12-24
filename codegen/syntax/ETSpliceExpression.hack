/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<dd7a60d144190f1e81e405d298bc5a70>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ETSpliceExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'et_splice_expression';

  private ?Node $_dollar;
  private ?Node $_left_brace;
  private ?Node $_expression;
  private ?Node $_right_brace;

  public function __construct(
    ?Node $dollar,
    ?Node $left_brace,
    ?Node $expression,
    ?Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_dollar = $dollar;
    $this->_left_brace = $left_brace;
    $this->_expression = $expression;
    $this->_right_brace = $right_brace;
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
    $dollar = Node::fromJSON(
      ($json['et_splice_expression_dollar'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $dollar?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      ($json['et_splice_expression_left_brace'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace?->getWidth() ?? 0;
    $expression = Node::fromJSON(
      ($json['et_splice_expression_expression'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $expression?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['et_splice_expression_right_brace'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_brace?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return
      new static($dollar, $left_brace, $expression, $right_brace, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'dollar' => $this->_dollar,
      'left_brace' => $this->_left_brace,
      'expression' => $this->_expression,
      'right_brace' => $this->_right_brace,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $dollar =
      $this->_dollar === null ? null : $rewriter($this->_dollar, $parents);
    $left_brace = $this->_left_brace === null
      ? null
      : $rewriter($this->_left_brace, $parents);
    $expression = $this->_expression === null
      ? null
      : $rewriter($this->_expression, $parents);
    $right_brace = $this->_right_brace === null
      ? null
      : $rewriter($this->_right_brace, $parents);
    if (
      $dollar === $this->_dollar &&
      $left_brace === $this->_left_brace &&
      $expression === $this->_expression &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $dollar as ?Node,
      $left_brace as ?Node,
      $expression as ?Node,
      $right_brace as ?Node,
    );
  }

  public function getDollarUNTYPED(): ?Node {
    return $this->_dollar;
  }

  public function withDollar(?Node $value): this {
    if ($value === $this->_dollar) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_brace,
      $this->_expression,
      $this->_right_brace,
    );
  }

  public function hasDollar(): bool {
    return $this->_dollar !== null;
  }

  /**
   * @return unknown
   */
  public function getDollar(): ?Node {
    return $this->_dollar;
  }

  /**
   * @return unknown
   */
  public function getDollarx(): Node {
    return TypeAssert\not_null($this->getDollar());
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(?Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_dollar,
      $value,
      $this->_expression,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return $this->_left_brace !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftBrace(): ?Node {
    return $this->_left_brace;
  }

  /**
   * @return unknown
   */
  public function getLeftBracex(): Node {
    return TypeAssert\not_null($this->getLeftBrace());
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(?Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static(
      $this->_dollar,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
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

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(?Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_dollar,
      $this->_left_brace,
      $this->_expression,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return $this->_right_brace !== null;
  }

  /**
   * @return unknown
   */
  public function getRightBrace(): ?Node {
    return $this->_right_brace;
  }

  /**
   * @return unknown
   */
  public function getRightBracex(): Node {
    return TypeAssert\not_null($this->getRightBrace());
  }
}
