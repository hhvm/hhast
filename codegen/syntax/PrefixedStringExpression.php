<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8a5328ddb2884528c7791b14d1d8912e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PrefixedStringExpression extends EditableNode {

  private EditableNode $_name;
  private EditableNode $_str;

  public function __construct(EditableNode $name, EditableNode $str) {
    parent::__construct('prefixed_string_expression');
    $this->_name = $name;
    $this->_str = $str;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['prefixed_string_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $str = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['prefixed_string_str'],
      $file,
      $offset,
      $source,
    );
    $offset += $str->getWidth();
    return new static($name, $str);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'str' => $this->_str,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $str = $this->_str->rewrite($rewriter, $parents);
    if ($name === $this->_name && $str === $this->_str) {
      return $this;
    }
    return new static($name, $str);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_str);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return unknown
   */
  public function getName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  /**
   * @return unknown
   */
  public function getNamex(): EditableNode {
    return $this->getName();
  }

  public function getStrUNTYPED(): EditableNode {
    return $this->_str;
  }

  public function withStr(EditableNode $value): this {
    if ($value === $this->_str) {
      return $this;
    }
    return new static($this->_name, $value);
  }

  public function hasStr(): bool {
    return !$this->_str->isMissing();
  }

  /**
   * @return unknown
   */
  public function getStr(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_str);
  }

  /**
   * @return unknown
   */
  public function getStrx(): EditableNode {
    return $this->getStr();
  }
}
