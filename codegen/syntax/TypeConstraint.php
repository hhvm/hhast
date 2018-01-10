<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<99f4e09652a649352f1698b5c301fcee>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeConstraint extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_type;

  public function __construct(EditableNode $keyword, EditableNode $type) {
    parent::__construct('type_constraint');
    $this->_keyword = $keyword;
    $this->_type = $type;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['constraint_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['constraint_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    return new static($keyword, $type);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    if ($keyword === $this->_keyword && $type === $this->_type) {
      return $this;
    }
    return new static($keyword, $type);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_type);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns AsToken | SuperToken
   */
  public function getKeyword(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_keyword);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @returns ShapeTypeSpecifier | SimpleTypeSpecifier | GenericTypeSpecifier |
   * ClosureTypeSpecifier | NullableTypeSpecifier | TypeConstant |
   * ClassnameTypeSpecifier | DictionaryTypeSpecifier |
   * VectorArrayTypeSpecifier | KeysetTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }
}
