/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5defac03af365b1a1cc2cb00bae6efb9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PrefixedCodeExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'prefixed_code_expression';

  private ?Node $_prefix;
  private ?Node $_left_backtick;
  private ?Node $_expression;
  private ?Node $_right_backtick;

  public function __construct(
    ?Node $prefix,
    ?Node $left_backtick,
    ?Node $expression,
    ?Node $right_backtick,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_prefix = $prefix;
    $this->_left_backtick = $left_backtick;
    $this->_expression = $expression;
    $this->_right_backtick = $right_backtick;
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
    $prefix = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['prefixed_code_prefix'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $prefix?->getWidth() ?? 0;
    $left_backtick = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['prefixed_code_left_backtick'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_backtick?->getWidth() ?? 0;
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['prefixed_code_expression'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $expression?->getWidth() ?? 0;
    $right_backtick = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['prefixed_code_right_backtick'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_backtick?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $prefix,
      /* HH_IGNORE_ERROR[4110] */ $left_backtick,
      /* HH_IGNORE_ERROR[4110] */ $expression,
      /* HH_IGNORE_ERROR[4110] */ $right_backtick,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'prefix' => $this->_prefix,
      'left_backtick' => $this->_left_backtick,
      'expression' => $this->_expression,
      'right_backtick' => $this->_right_backtick,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $prefix = $this->_prefix === null
      ? null
      : $rewriter($this->_prefix, $parents);
    $left_backtick = $this->_left_backtick === null
      ? null
      : $rewriter($this->_left_backtick, $parents);
    $expression = $this->_expression === null
      ? null
      : $rewriter($this->_expression, $parents);
    $right_backtick = $this->_right_backtick === null
      ? null
      : $rewriter($this->_right_backtick, $parents);
    if (
      $prefix === $this->_prefix &&
      $left_backtick === $this->_left_backtick &&
      $expression === $this->_expression &&
      $right_backtick === $this->_right_backtick
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $prefix,
      /* HH_FIXME[4110] use `as` */ $left_backtick,
      /* HH_FIXME[4110] use `as` */ $expression,
      /* HH_FIXME[4110] use `as` */ $right_backtick,
    );
  }

  public function getPrefixUNTYPED(): ?Node {
    return $this->_prefix;
  }

  public function withPrefix(?Node $value): this {
    if ($value === $this->_prefix) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_backtick,
      $this->_expression,
      $this->_right_backtick,
    );
  }

  public function hasPrefix(): bool {
    return $this->_prefix !== null;
  }

  /**
   * @return unknown
   */
  public function getPrefix(): ?Node {
    return $this->_prefix;
  }

  /**
   * @return unknown
   */
  public function getPrefixx(): Node {
    return TypeAssert\not_null($this->getPrefix());
  }

  public function getLeftBacktickUNTYPED(): ?Node {
    return $this->_left_backtick;
  }

  public function withLeftBacktick(?Node $value): this {
    if ($value === $this->_left_backtick) {
      return $this;
    }
    return new static(
      $this->_prefix,
      $value,
      $this->_expression,
      $this->_right_backtick,
    );
  }

  public function hasLeftBacktick(): bool {
    return $this->_left_backtick !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftBacktick(): ?Node {
    return $this->_left_backtick;
  }

  /**
   * @return unknown
   */
  public function getLeftBacktickx(): Node {
    return TypeAssert\not_null($this->getLeftBacktick());
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(?Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static(
      $this->_prefix,
      $this->_left_backtick,
      $value,
      $this->_right_backtick,
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

  public function getRightBacktickUNTYPED(): ?Node {
    return $this->_right_backtick;
  }

  public function withRightBacktick(?Node $value): this {
    if ($value === $this->_right_backtick) {
      return $this;
    }
    return new static(
      $this->_prefix,
      $this->_left_backtick,
      $this->_expression,
      $value,
    );
  }

  public function hasRightBacktick(): bool {
    return $this->_right_backtick !== null;
  }

  /**
   * @return unknown
   */
  public function getRightBacktick(): ?Node {
    return $this->_right_backtick;
  }

  /**
   * @return unknown
   */
  public function getRightBacktickx(): Node {
    return TypeAssert\not_null($this->getRightBacktick());
  }
}
