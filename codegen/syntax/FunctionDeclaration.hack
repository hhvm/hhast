/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<bae6b513ad0627bb0471b8d96ffbbb2e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class FunctionDeclaration
  extends Node
  implements IFunctionishDeclaration, IHasFunctionBody, IHasAttributeSpec {

  const string SYNTAX_KIND = 'function_declaration';

  private Node $_attribute_spec;
  private Node $_declaration_header;
  private Node $_body;

  public function __construct(
    Node $attribute_spec,
    Node $declaration_header,
    Node $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_declaration_header = $declaration_header;
    $this->_body = $body;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $attribute_spec = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_attribute_spec'],
      $file,
      $offset,
      $source,
      'AttributeSpecification',
    );
    $offset += $attribute_spec->getWidth();
    $declaration_header = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_declaration_header'],
      $file,
      $offset,
      $source,
      'FunctionDeclarationHeader',
    );
    $offset += $declaration_header->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_body'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($attribute_spec, $declaration_header, $body, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'declaration_header' => $this->_declaration_header,
      'body' => $this->_body,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $rewriter($this->_attribute_spec, $parents);
    $declaration_header = $rewriter($this->_declaration_header, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $declaration_header === $this->_declaration_header &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static($attribute_spec, $declaration_header, $body);
  }

  public function getAttributeSpecUNTYPED(): Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?AttributeSpecification $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_declaration_header,
      $this->_body,
    );
  }

  public function hasAttributeSpec(): bool {
    return !$this->_attribute_spec->isMissing();
  }

  /**
   * @return AttributeSpecification | null
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
   * @return AttributeSpecification
   */
  public function getAttributeSpecx(): AttributeSpecification {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getDeclarationHeaderUNTYPED(): Node {
    return $this->_declaration_header;
  }

  public function withDeclarationHeader(
    FunctionDeclarationHeader $value,
  ): this {
    if ($value === $this->_declaration_header) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value ?? Missing(),
      $this->_body,
    );
  }

  public function hasDeclarationHeader(): bool {
    return !$this->_declaration_header->isMissing();
  }

  /**
   * @return FunctionDeclarationHeader
   */
  public function getDeclarationHeader(): FunctionDeclarationHeader {
    return TypeAssert\instance_of(
      FunctionDeclarationHeader::class,
      $this->_declaration_header,
    );
  }

  /**
   * @return FunctionDeclarationHeader
   */
  public function getDeclarationHeaderx(): FunctionDeclarationHeader {
    return $this->getDeclarationHeader();
  }

  public function getBodyUNTYPED(): Node {
    return $this->_body;
  }

  public function withBody(Node $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_declaration_header,
      $value ?? Missing(),
    );
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @return CompoundStatement | SemicolonToken
   */
  public function getBody(): Node {
    return $this->_body;
  }

  /**
   * @return CompoundStatement | SemicolonToken
   */
  public function getBodyx(): Node {
    return $this->getBody();
  }
}
