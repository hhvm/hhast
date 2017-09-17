<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<410f9bf51f89e2f873f89c7d0faec178>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class XHPClassAttributeDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_attributes;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $attributes,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('xhp_class_attribute_declaration');
    $this->_keyword = $keyword;
    $this->_attributes = $attributes;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $attributes = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_attributes'],
      $position,
      $source,
    );
    $position += $attributes->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_attribute_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($keyword, $attributes, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'attributes' => $this->_attributes;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
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

  public function getAttributesUNTYPED(): EditableSyntax {
    return $this->_attributes;
  }

  public function withAttributes(EditableSyntax $value): this {
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

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
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
