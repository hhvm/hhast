/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a14b2c0b8ae23861b087052f20a703f8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class EmbeddedBracedExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'embedded_braced_expression';

  private ?Node $_left_brace;
  private ?Node $_expression;
  private ?Node $_right_brace;

  public function __construct(
    ?Node $left_brace,
    ?Node $expression,
    ?Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_brace = $left_brace;
    $this->_expression = $expression;
    $this->_right_brace = $right_brace;
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
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['embedded_braced_expression_left_brace'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace?->getWidth() ?? 0;
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['embedded_braced_expression_expression'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $expression?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['embedded_braced_expression_right_brace'] ?? dict['kind' => 'missing'],
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
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $expression,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
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
      $left_brace === $this->_left_brace &&
      $expression === $this->_expression &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $left_brace,
      /* HH_FIXME[4110] use `as` */ $expression,
      /* HH_FIXME[4110] use `as` */ $right_brace,
    );
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(?Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static($value, $this->_expression, $this->_right_brace);
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
    return new static($this->_left_brace, $value, $this->_right_brace);
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
    return new static($this->_left_brace, $this->_expression, $value);
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
