<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<acd6d37f2b2e1e4d1da9f1bdd2815c5e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class MethodishTraitResolution extends EditableNode {

  private EditableNode $_attribute;
  private EditableNode $_function_decl_header;
  private EditableNode $_equal;
  private EditableNode $_name;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $attribute,
    EditableNode $function_decl_header,
    EditableNode $equal,
    EditableNode $name,
    EditableNode $semicolon,
  ) {
    parent::__construct('methodish_trait_resolution');
    $this->_attribute = $attribute;
    $this->_function_decl_header = $function_decl_header;
    $this->_equal = $equal;
    $this->_name = $name;
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
      /* UNSAFE_EXPR */ $json['methodish_trait_attribute'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute->getWidth();
    $function_decl_header = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['methodish_trait_function_decl_header'],
      $file,
      $offset,
      $source,
    );
    $offset += $function_decl_header->getWidth();
    $equal = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['methodish_trait_equal'],
      $file,
      $offset,
      $source,
    );
    $offset += $equal->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['methodish_trait_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['methodish_trait_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return
      new static($attribute, $function_decl_header, $equal, $name, $semicolon);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'attribute' => $this->_attribute,
      'function_decl_header' => $this->_function_decl_header,
      'equal' => $this->_equal,
      'name' => $this->_name,
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
    $function_decl_header =
      $this->_function_decl_header->rewrite($rewriter, $parents);
    $equal = $this->_equal->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $attribute === $this->_attribute &&
      $function_decl_header === $this->_function_decl_header &&
      $equal === $this->_equal &&
      $name === $this->_name &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return
      new static($attribute, $function_decl_header, $equal, $name, $semicolon);
  }

  public function getAttributeUNTYPED(): EditableNode {
    return $this->_attribute;
  }

  public function withAttribute(EditableNode $value): this {
    if ($value === $this->_attribute) {
      return $this;
    }
    return new static(
      $value,
      $this->_function_decl_header,
      $this->_equal,
      $this->_name,
      $this->_semicolon,
    );
  }

  public function hasAttribute(): bool {
    return !$this->_attribute->isMissing();
  }

  /**
   * @return null
   */
  public function getAttribute(): ?EditableNode {
    if ($this->_attribute->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_attribute);
  }

  /**
   * @return
   */
  public function getAttributex(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_attribute);
  }

  public function getFunctionDeclHeaderUNTYPED(): EditableNode {
    return $this->_function_decl_header;
  }

  public function withFunctionDeclHeader(EditableNode $value): this {
    if ($value === $this->_function_decl_header) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $value,
      $this->_equal,
      $this->_name,
      $this->_semicolon,
    );
  }

  public function hasFunctionDeclHeader(): bool {
    return !$this->_function_decl_header->isMissing();
  }

  /**
   * @return FunctionDeclarationHeader
   */
  public function getFunctionDeclHeader(): FunctionDeclarationHeader {
    return TypeAssert\instance_of(
      FunctionDeclarationHeader::class,
      $this->_function_decl_header,
    );
  }

  /**
   * @return FunctionDeclarationHeader
   */
  public function getFunctionDeclHeaderx(): FunctionDeclarationHeader {
    return $this->getFunctionDeclHeader();
  }

  public function getEqualUNTYPED(): EditableNode {
    return $this->_equal;
  }

  public function withEqual(EditableNode $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_function_decl_header,
      $value,
      $this->_name,
      $this->_semicolon,
    );
  }

  public function hasEqual(): bool {
    return !$this->_equal->isMissing();
  }

  /**
   * @return EqualToken
   */
  public function getEqual(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  /**
   * @return EqualToken
   */
  public function getEqualx(): EqualToken {
    return $this->getEqual();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_function_decl_header,
      $this->_equal,
      $value,
      $this->_semicolon,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return ScopeResolutionExpression
   */
  public function getName(): ScopeResolutionExpression {
    return
      TypeAssert\instance_of(ScopeResolutionExpression::class, $this->_name);
  }

  /**
   * @return ScopeResolutionExpression
   */
  public function getNamex(): ScopeResolutionExpression {
    return $this->getName();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_function_decl_header,
      $this->_equal,
      $this->_name,
      $value,
    );
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
