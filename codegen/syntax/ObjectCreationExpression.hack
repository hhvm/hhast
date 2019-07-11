/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<50e1599f6152c2e73ef6a58dde2dc9bb>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class ObjectCreationExpression
  extends Node
  implements IFunctionCallishExpression, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'object_creation_expression';

  private NewToken $_new_keyword;
  private ConstructorCall $_object;

  public function __construct(
    NewToken $new_keyword,
    ConstructorCall $object,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_new_keyword = $new_keyword;
    $this->_object = $object;
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
    $new_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['object_creation_new_keyword'],
      $file,
      $offset,
      $source,
      'NewToken',
    );
    $new_keyword = $new_keyword as nonnull;
    $offset += $new_keyword->getWidth();
    $object = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['object_creation_object'],
      $file,
      $offset,
      $source,
      'ConstructorCall',
    );
    $object = $object as nonnull;
    $offset += $object->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $new_keyword,
      /* HH_IGNORE_ERROR[4110] */ $object,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'new_keyword' => $this->_new_keyword,
      'object' => $this->_object,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $new_keyword = $rewriter($this->_new_keyword, $parents);
    $object = $rewriter($this->_object, $parents);
    if ($new_keyword === $this->_new_keyword && $object === $this->_object) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $new_keyword,
      /* HH_FIXME[4110] use `as` */ $object,
    );
  }

  public function getNewKeywordUNTYPED(): ?Node {
    return $this->_new_keyword;
  }

  public function withNewKeyword(NewToken $value): this {
    if ($value === $this->_new_keyword) {
      return $this;
    }
    return new static($value, $this->_object);
  }

  public function hasNewKeyword(): bool {
    return $this->_new_keyword !== null;
  }

  /**
   * @return NewToken
   */
  public function getNewKeyword(): NewToken {
    return TypeAssert\instance_of(NewToken::class, $this->_new_keyword);
  }

  /**
   * @return NewToken
   */
  public function getNewKeywordx(): NewToken {
    return $this->getNewKeyword();
  }

  public function getObjectUNTYPED(): ?Node {
    return $this->_object;
  }

  public function withObject(ConstructorCall $value): this {
    if ($value === $this->_object) {
      return $this;
    }
    return new static($this->_new_keyword, $value);
  }

  public function hasObject(): bool {
    return $this->_object !== null;
  }

  /**
   * @return ConstructorCall
   */
  public function getObject(): ConstructorCall {
    return TypeAssert\instance_of(ConstructorCall::class, $this->_object);
  }

  /**
   * @return ConstructorCall
   */
  public function getObjectx(): ConstructorCall {
    return $this->getObject();
  }
}
