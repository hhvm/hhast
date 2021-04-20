/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4b7070e70876cf951f62fad9d40061a8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class FunctionPointerExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'function_pointer_expression';

  private IExpression $_receiver;
  private TypeArguments $_type_args;

  public function __construct(
    IExpression $receiver,
    TypeArguments $type_args,
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
      /* HH_FIXME[4110] */ $json['function_pointer_receiver'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $receiver = $receiver as nonnull;
    $offset += $receiver->getWidth();
    $type_args = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_pointer_type_args'],
      $file,
      $offset,
      $source,
      'TypeArguments',
    );
    $type_args = $type_args as nonnull;
    $offset += $type_args->getWidth();
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
    $receiver = $rewriter($this->_receiver, $parents);
    $type_args = $rewriter($this->_type_args, $parents);
    if ($receiver === $this->_receiver && $type_args === $this->_type_args) {
      return $this;
    }
    return new static($receiver as IExpression, $type_args as TypeArguments);
  }

  public function getReceiverUNTYPED(): ?Node {
    return $this->_receiver;
  }

  public function withReceiver(IExpression $value): this {
    if ($value === $this->_receiver) {
      return $this;
    }
    return new static($value, $this->_type_args);
  }

  public function hasReceiver(): bool {
    return $this->_receiver !== null;
  }

  /**
   * @return QualifiedName | ScopeResolutionExpression | NameToken
   */
  public function getReceiver(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_receiver);
  }

  /**
   * @return QualifiedName | ScopeResolutionExpression | NameToken
   */
  public function getReceiverx(): IExpression {
    return $this->getReceiver();
  }

  public function getTypeArgsUNTYPED(): ?Node {
    return $this->_type_args;
  }

  public function withTypeArgs(TypeArguments $value): this {
    if ($value === $this->_type_args) {
      return $this;
    }
    return new static($this->_receiver, $value);
  }

  public function hasTypeArgs(): bool {
    return $this->_type_args !== null;
  }

  /**
   * @return TypeArguments
   */
  public function getTypeArgs(): TypeArguments {
    return TypeAssert\instance_of(TypeArguments::class, $this->_type_args);
  }

  /**
   * @return TypeArguments
   */
  public function getTypeArgsx(): TypeArguments {
    return $this->getTypeArgs();
  }
}
