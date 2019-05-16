/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2c9ddeac2e54336b40d87bfe630261a6>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PrefixedStringExpression
  extends EditableNode
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'prefixed_string_expression';

  private EditableNode $_name;
  private EditableNode $_str;

  public function __construct(
    EditableNode $name,
    EditableNode $str,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_str = $str;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($name, $str, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'str' => $this->_str,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $rewriter($this->_name, $parents);
    $str = $rewriter($this->_str, $parents);
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
    return $this->_name;
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
    return $this->_str;
  }

  /**
   * @return unknown
   */
  public function getStrx(): EditableNode {
    return $this->getStr();
  }
}
