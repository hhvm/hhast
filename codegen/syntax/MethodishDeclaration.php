<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a314cf790a6c8519ebfb9cf8b74d7f35>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class MethodishDeclaration extends EditableNode
  implements IFunctionishDeclaration {

  private EditableNode $_attribute;
  private EditableNode $_modifiers;
  private EditableNode $_function_decl_header;
  private EditableNode $_function_body;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $attribute,
    EditableNode $modifiers,
    EditableNode $function_decl_header,
    EditableNode $function_body,
    EditableNode $semicolon,
  ) {
    parent::__construct('methodish_declaration');
    $this->_attribute = $attribute;
    $this->_modifiers = $modifiers;
    $this->_function_decl_header = $function_decl_header;
    $this->_function_body = $function_body;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $attribute = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['methodish_attribute'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute->getWidth();
    $modifiers = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['methodish_modifiers'],
      $file,
      $offset,
      $source,
    );
    $offset += $modifiers->getWidth();
    $function_decl_header = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['methodish_function_decl_header'],
      $file,
      $offset,
      $source,
    );
    $offset += $function_decl_header->getWidth();
    $function_body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['methodish_function_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $function_body->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['methodish_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new self(
      $attribute,
      $modifiers,
      $function_decl_header,
      $function_body,
      $semicolon,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'attribute' => $this->_attribute,
      'modifiers' => $this->_modifiers,
      'function_decl_header' => $this->_function_decl_header,
      'function_body' => $this->_function_body,
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
    $attribute = $this->_attribute->rewrite($rewriter, $parents);
    $modifiers = $this->_modifiers->rewrite($rewriter, $parents);
    $function_decl_header =
      $this->_function_decl_header->rewrite($rewriter, $parents);
    $function_body = $this->_function_body->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $attribute === $this->_attribute &&
      $modifiers === $this->_modifiers &&
      $function_decl_header === $this->_function_decl_header &&
      $function_body === $this->_function_body &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self(
      $attribute,
      $modifiers,
      $function_decl_header,
      $function_body,
      $semicolon,
    );
  }

  public function getAttributeUNTYPED(): EditableNode {
    return $this->_attribute;
  }

  public function withAttribute(EditableNode $value): this {
    if ($value === $this->_attribute) {
      return $this;
    }
    return new self(
      $value,
      $this->_modifiers,
      $this->_function_decl_header,
      $this->_function_body,
      $this->_semicolon,
    );
  }

  public function hasAttribute(): bool {
    return !$this->_attribute->isMissing();
  }

  /**
   * @returns Missing | AttributeSpecification
   */
  public function getAttribute(): ?AttributeSpecification {
    if ($this->_attribute->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(AttributeSpecification::class, $this->_attribute);
  }

  /**
   * @returns AttributeSpecification
   */
  public function getAttributex(): AttributeSpecification {
    return
      TypeAssert\instance_of(AttributeSpecification::class, $this->_attribute);
  }

  public function getModifiersUNTYPED(): EditableNode {
    return $this->_modifiers;
  }

  public function withModifiers(EditableNode $value): this {
    if ($value === $this->_modifiers) {
      return $this;
    }
    return new self(
      $this->_attribute,
      $value,
      $this->_function_decl_header,
      $this->_function_body,
      $this->_semicolon,
    );
  }

  public function hasModifiers(): bool {
    return !$this->_modifiers->isMissing();
  }

  /**
   * @returns EditableList | Missing
   */
  public function getModifiers(): ?EditableList {
    if ($this->_modifiers->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_modifiers);
  }

  /**
   * @returns EditableList
   */
  public function getModifiersx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_modifiers);
  }

  public function getFunctionDeclHeaderUNTYPED(): EditableNode {
    return $this->_function_decl_header;
  }

  public function withFunctionDeclHeader(EditableNode $value): this {
    if ($value === $this->_function_decl_header) {
      return $this;
    }
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $value,
      $this->_function_body,
      $this->_semicolon,
    );
  }

  public function hasFunctionDeclHeader(): bool {
    return !$this->_function_decl_header->isMissing();
  }

  /**
   * @returns FunctionDeclarationHeader
   */
  public function getFunctionDeclHeader(): FunctionDeclarationHeader {
    return TypeAssert\instance_of(
      FunctionDeclarationHeader::class,
      $this->_function_decl_header,
    );
  }

  public function getFunctionBodyUNTYPED(): EditableNode {
    return $this->_function_body;
  }

  public function withFunctionBody(EditableNode $value): this {
    if ($value === $this->_function_body) {
      return $this;
    }
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $this->_function_decl_header,
      $value,
      $this->_semicolon,
    );
  }

  public function hasFunctionBody(): bool {
    return !$this->_function_body->isMissing();
  }

  /**
   * @returns CompoundStatement | Missing
   */
  public function getFunctionBody(): ?CompoundStatement {
    if ($this->_function_body->isMissing()) {
      return null;
    }
    return
      TypeAssert\instance_of(CompoundStatement::class, $this->_function_body);
  }

  /**
   * @returns CompoundStatement
   */
  public function getFunctionBodyx(): CompoundStatement {
    return
      TypeAssert\instance_of(CompoundStatement::class, $this->_function_body);
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self(
      $this->_attribute,
      $this->_modifiers,
      $this->_function_decl_header,
      $this->_function_body,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns Missing | SemicolonToken
   */
  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
