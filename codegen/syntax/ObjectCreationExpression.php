<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<94cc30b608da445aeffb85add1f4a392>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ObjectCreationExpression extends EditableNode {

  private EditableNode $_new_keyword;
  private EditableNode $_object;

  public function __construct(EditableNode $new_keyword, EditableNode $object) {
    parent::__construct('object_creation_expression');
    $this->_new_keyword = $new_keyword;
    $this->_object = $object;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $new_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['object_creation_new_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $new_keyword->getWidth();
    $object = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['object_creation_object'],
      $file,
      $offset,
      $source,
    );
    $offset += $object->getWidth();
    return new static($new_keyword, $object);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'new_keyword' => $this->_new_keyword,
      'object' => $this->_object,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $new_keyword = $this->_new_keyword->rewrite($rewriter, $parents);
    $object = $this->_object->rewrite($rewriter, $parents);
    if ($new_keyword === $this->_new_keyword && $object === $this->_object) {
      return $this;
    }
    return new static($new_keyword, $object);
  }

  public function getNewKeywordUNTYPED(): EditableNode {
    return $this->_new_keyword;
  }

  public function withNewKeyword(EditableNode $value): this {
    if ($value === $this->_new_keyword) {
      return $this;
    }
    return new static($value, $this->_object);
  }

  public function hasNewKeyword(): bool {
    return !$this->_new_keyword->isMissing();
  }

  /**
   * @returns NewToken
   */
  public function getNewKeyword(): NewToken {
    return TypeAssert\instance_of(NewToken::class, $this->_new_keyword);
  }

  /**
   * @returns NewToken
   */
  public function getNewKeywordx(): NewToken {
    return $this->getNewKeyword();
  }

  public function getObjectUNTYPED(): EditableNode {
    return $this->_object;
  }

  public function withObject(EditableNode $value): this {
    if ($value === $this->_object) {
      return $this;
    }
    return new static($this->_new_keyword, $value);
  }

  public function hasObject(): bool {
    return !$this->_object->isMissing();
  }

  /**
   * @returns AnonymousClass | ConstructorCall
   */
  public function getObject(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_object);
  }

  /**
   * @returns AnonymousClass | ConstructorCall
   */
  public function getObjectx(): EditableNode {
    return $this->getObject();
  }
}
