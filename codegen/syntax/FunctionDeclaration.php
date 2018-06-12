<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8ee59ad4dddb860c7026d2fcb8459ec0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class FunctionDeclaration
  extends EditableNode
  implements IFunctionishDeclaration {

  private EditableNode $_attribute_spec;
  private EditableNode $_declaration_header;
  private EditableNode $_body;

  public function __construct(
    EditableNode $attribute_spec,
    EditableNode $declaration_header,
    EditableNode $body,
  ) {
    parent::__construct('function_declaration');
    $this->_attribute_spec = $attribute_spec;
    $this->_declaration_header = $declaration_header;
    $this->_body = $body;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $attribute_spec = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_attribute_spec'],
      $file,
      $offset,
      $source,
    );
    $offset += $attribute_spec->getWidth();
    $declaration_header = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_declaration_header'],
      $file,
      $offset,
      $source,
    );
    $offset += $declaration_header->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['function_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
    return new static($attribute_spec, $declaration_header, $body);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'declaration_header' => $this->_declaration_header,
      'body' => $this->_body,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $attribute_spec = $this->_attribute_spec->rewrite($rewriter, $parents);
    $declaration_header =
      $this->_declaration_header->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $declaration_header === $this->_declaration_header &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static($attribute_spec, $declaration_header, $body);
  }

  public function getAttributeSpecUNTYPED(): EditableNode {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(EditableNode $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static($value, $this->_declaration_header, $this->_body);
  }

  public function hasAttributeSpec(): bool {
    return !$this->_attribute_spec->isMissing();
  }

  /**
   * @returns AttributeSpecification | Missing
   */
  public function getAttributeSpec(): ?AttributeSpecification {
    if ($this->_attribute_spec->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  /**
   * @returns AttributeSpecification
   */
  public function getAttributeSpecx(): AttributeSpecification {
    return TypeAssert\instance_of(
      AttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  public function getDeclarationHeaderUNTYPED(): EditableNode {
    return $this->_declaration_header;
  }

  public function withDeclarationHeader(EditableNode $value): this {
    if ($value === $this->_declaration_header) {
      return $this;
    }
    return new static($this->_attribute_spec, $value, $this->_body);
  }

  public function hasDeclarationHeader(): bool {
    return !$this->_declaration_header->isMissing();
  }

  /**
   * @returns FunctionDeclarationHeader
   */
  public function getDeclarationHeader(): FunctionDeclarationHeader {
    return TypeAssert\instance_of(
      FunctionDeclarationHeader::class,
      $this->_declaration_header,
    );
  }

  /**
   * @returns FunctionDeclarationHeader
   */
  public function getDeclarationHeaderx(): FunctionDeclarationHeader {
    return $this->getDeclarationHeader();
  }

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return
      new static($this->_attribute_spec, $this->_declaration_header, $value);
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @returns CompoundStatement
   */
  public function getBody(): CompoundStatement {
    return TypeAssert\instance_of(CompoundStatement::class, $this->_body);
  }

  /**
   * @returns CompoundStatement
   */
  public function getBodyx(): CompoundStatement {
    return $this->getBody();
  }
}
