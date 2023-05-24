/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ea6a07cedac2727db45d9b3dd4fe231a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $new_keyword = Node::fromJSON(
      ($json['object_creation_new_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NewToken',
    );
    $new_keyword = $new_keyword as nonnull;
    $offset += $new_keyword->getWidth();
    $object = Node::fromJSON(
      ($json['object_creation_object']) as dict<_, _>,
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
      $new_keyword as NewToken,
      $object as ConstructorCall,
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
    return new static($new_keyword as NewToken, $object as ConstructorCall);
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
    return true;
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
    return true;
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
