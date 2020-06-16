/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8f6d5f987186bc1456642a0a93525a76>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class EmbeddedSubscriptExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'embedded_subscript_expression';

  private ?Node $_receiver;
  private ?Node $_left_bracket;
  private ?Node $_index;
  private ?Node $_right_bracket;

  public function __construct(
    ?Node $receiver,
    ?Node $left_bracket,
    ?Node $index,
    ?Node $right_bracket,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_receiver = $receiver;
    $this->_left_bracket = $left_bracket;
    $this->_index = $index;
    $this->_right_bracket = $right_bracket;
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
    $receiver = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['embedded_subscript_receiver'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $receiver?->getWidth() ?? 0;
    $left_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['embedded_subscript_left_bracket'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_bracket?->getWidth() ?? 0;
    $index = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['embedded_subscript_index'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $index?->getWidth() ?? 0;
    $right_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['embedded_subscript_right_bracket'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_bracket?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $receiver,
      /* HH_IGNORE_ERROR[4110] */ $left_bracket,
      /* HH_IGNORE_ERROR[4110] */ $index,
      /* HH_IGNORE_ERROR[4110] */ $right_bracket,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'receiver' => $this->_receiver,
      'left_bracket' => $this->_left_bracket,
      'index' => $this->_index,
      'right_bracket' => $this->_right_bracket,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $receiver = $this->_receiver === null
      ? null
      : $rewriter($this->_receiver, $parents);
    $left_bracket = $this->_left_bracket === null
      ? null
      : $rewriter($this->_left_bracket, $parents);
    $index = $this->_index === null ? null : $rewriter($this->_index, $parents);
    $right_bracket = $this->_right_bracket === null
      ? null
      : $rewriter($this->_right_bracket, $parents);
    if (
      $receiver === $this->_receiver &&
      $left_bracket === $this->_left_bracket &&
      $index === $this->_index &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $receiver,
      /* HH_FIXME[4110] use `as` */ $left_bracket,
      /* HH_FIXME[4110] use `as` */ $index,
      /* HH_FIXME[4110] use `as` */ $right_bracket,
    );
  }

  public function getReceiverUNTYPED(): ?Node {
    return $this->_receiver;
  }

  public function withReceiver(?Node $value): this {
    if ($value === $this->_receiver) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_bracket,
      $this->_index,
      $this->_right_bracket,
    );
  }

  public function hasReceiver(): bool {
    return $this->_receiver !== null;
  }

  /**
   * @return unknown
   */
  public function getReceiver(): ?Node {
    return $this->_receiver;
  }

  /**
   * @return unknown
   */
  public function getReceiverx(): Node {
    return TypeAssert\not_null($this->getReceiver());
  }

  public function getLeftBracketUNTYPED(): ?Node {
    return $this->_left_bracket;
  }

  public function withLeftBracket(?Node $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $value,
      $this->_index,
      $this->_right_bracket,
    );
  }

  public function hasLeftBracket(): bool {
    return $this->_left_bracket !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftBracket(): ?Node {
    return $this->_left_bracket;
  }

  /**
   * @return unknown
   */
  public function getLeftBracketx(): Node {
    return TypeAssert\not_null($this->getLeftBracket());
  }

  public function getIndexUNTYPED(): ?Node {
    return $this->_index;
  }

  public function withIndex(?Node $value): this {
    if ($value === $this->_index) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_left_bracket,
      $value,
      $this->_right_bracket,
    );
  }

  public function hasIndex(): bool {
    return $this->_index !== null;
  }

  /**
   * @return unknown
   */
  public function getIndex(): ?Node {
    return $this->_index;
  }

  /**
   * @return unknown
   */
  public function getIndexx(): Node {
    return TypeAssert\not_null($this->getIndex());
  }

  public function getRightBracketUNTYPED(): ?Node {
    return $this->_right_bracket;
  }

  public function withRightBracket(?Node $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return new static(
      $this->_receiver,
      $this->_left_bracket,
      $this->_index,
      $value,
    );
  }

  public function hasRightBracket(): bool {
    return $this->_right_bracket !== null;
  }

  /**
   * @return unknown
   */
  public function getRightBracket(): ?Node {
    return $this->_right_bracket;
  }

  /**
   * @return unknown
   */
  public function getRightBracketx(): Node {
    return TypeAssert\not_null($this->getRightBracket());
  }
}
