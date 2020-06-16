/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1640f2a5b3428d825e302463902a01ae>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class FunctionPointerExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'function_pointer_expression';

  private ?Node $_receiver;
  private ?Node $_type_args;

  public function __construct(
    ?Node $receiver,
    ?Node $type_args,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_receiver = $receiver;
    $this->_type_args = $type_args;
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
      /* HH_FIXME[4110] */ $json['function_pointer_receiver'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $receiver?->getWidth() ?? 0;
    $type_args = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_pointer_type_args'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type_args?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $receiver,
      /* HH_IGNORE_ERROR[4110] */ $type_args,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'receiver' => $this->_receiver,
      'type_args' => $this->_type_args,
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
    $type_args = $this->_type_args === null
      ? null
      : $rewriter($this->_type_args, $parents);
    if ($receiver === $this->_receiver && $type_args === $this->_type_args) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $receiver,
      /* HH_FIXME[4110] use `as` */ $type_args,
    );
  }

  public function getReceiverUNTYPED(): ?Node {
    return $this->_receiver;
  }

  public function withReceiver(?Node $value): this {
    if ($value === $this->_receiver) {
      return $this;
    }
    return new static($value, $this->_type_args);
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

  public function getTypeArgsUNTYPED(): ?Node {
    return $this->_type_args;
  }

  public function withTypeArgs(?Node $value): this {
    if ($value === $this->_type_args) {
      return $this;
    }
    return new static($this->_receiver, $value);
  }

  public function hasTypeArgs(): bool {
    return $this->_type_args !== null;
  }

  /**
   * @return unknown
   */
  public function getTypeArgs(): ?Node {
    return $this->_type_args;
  }

  /**
   * @return unknown
   */
  public function getTypeArgsx(): Node {
    return TypeAssert\not_null($this->getTypeArgs());
  }
}
