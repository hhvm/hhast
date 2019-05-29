/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<368a2014ec663c4bbf081ffdbd67b986>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ObjectCreationExpression
  extends Node
  implements IFunctionCallishExpression, ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'object_creation_expression';

  private Node $_new_keyword;
  private Node $_object;

  public function __construct(
    Node $new_keyword,
    Node $object,
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
  ): this {
    $offset = $initial_offset;
    $new_keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['object_creation_new_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $new_keyword->getWidth();
    $object = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['object_creation_object'],
      $file,
      $offset,
      $source,
    );
    $offset += $object->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($new_keyword, $object, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'new_keyword' => $this->_new_keyword,
      'object' => $this->_object,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $new_keyword = $rewriter($this->_new_keyword, $parents);
    $object = $rewriter($this->_object, $parents);
    if ($new_keyword === $this->_new_keyword && $object === $this->_object) {
      return $this;
    }
    return new static($new_keyword, $object);
  }

  public function getNewKeywordUNTYPED(): Node {
    return $this->_new_keyword;
  }

  public function withNewKeyword(Node $value): this {
    if ($value === $this->_new_keyword) {
      return $this;
    }
    return new static($value, $this->_object);
  }

  public function hasNewKeyword(): bool {
    return !$this->_new_keyword->isMissing();
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

  public function getObjectUNTYPED(): Node {
    return $this->_object;
  }

  public function withObject(Node $value): this {
    if ($value === $this->_object) {
      return $this;
    }
    return new static($this->_new_keyword, $value);
  }

  public function hasObject(): bool {
    return !$this->_object->isMissing();
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
