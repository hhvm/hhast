<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<39cf856d615ccd5ed39421c8089d5eff>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class XHPClassAttributeDeclaration extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_attributes;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $attributes,
    EditableNode $semicolon,
  ) {
    parent::__construct('xhp_class_attribute_declaration');
    $this->_keyword = $keyword;
    $this->_attributes = $attributes;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $attributes = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_attributes'],
      $file,
      $offset,
      $source,
    );
    $offset += $attributes->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new self($keyword, $attributes, $semicolon);
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $attributes = $this->_attributes->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $attributes === $this->_attributes &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $attributes, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_attributes, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns AttributeToken
   */
  public function getKeyword(): AttributeToken {
    return TypeAssert\instance_of(AttributeToken::class, $this->_keyword);
  }

  public function getAttributesUNTYPED(): EditableNode {
    return $this->_attributes;
  }

  public function withAttributes(EditableNode $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function hasAttributes(): bool {
    return !$this->_attributes->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getAttributes(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_attributes);
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_attributes, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
