/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b27fb9d0ce5b9c46f2c0e9ce30ccd671>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPClassAttributeDeclaration
  extends EditableNode
  implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'xhp_class_attribute_declaration';

  private EditableNode $_keyword;
  private EditableNode $_attributes;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $attributes,
    EditableNode $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_attributes = $attributes;
    $this->_semicolon = $semicolon;
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
    $keyword = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_attribute_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $attributes = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_attribute_attributes'],
      $file,
      $offset,
      $source,
    );
    $offset += $attributes->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_attribute_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($keyword, $attributes, $semicolon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'attributes' => $this->_attributes,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $attributes = $rewriter($this->_attributes, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $attributes === $this->_attributes &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($keyword, $attributes, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_attributes, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return AttributeToken
   */
  public function getKeyword(): AttributeToken {
    return TypeAssert\instance_of(AttributeToken::class, $this->_keyword);
  }

  /**
   * @return AttributeToken
   */
  public function getKeywordx(): AttributeToken {
    return $this->getKeyword();
  }

  public function getAttributesUNTYPED(): EditableNode {
    return $this->_attributes;
  }

  public function withAttributes(EditableNode $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasAttributes(): bool {
    return !$this->_attributes->isMissing();
  }

  /**
   * @return EditableList<XHPClassAttribute> | EditableList<EditableNode> |
   * EditableList<XHPSimpleClassAttribute>
   */
  public function getAttributes(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_attributes);
  }

  /**
   * @return EditableList<XHPClassAttribute> | EditableList<EditableNode> |
   * EditableList<XHPSimpleClassAttribute>
   */
  public function getAttributesx(): EditableList<EditableNode> {
    return $this->getAttributes();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_attributes, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
