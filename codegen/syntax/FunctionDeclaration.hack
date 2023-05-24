/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1002045f59014e9f1f70af80457c70c8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class FunctionDeclaration
  extends Node
  implements IFunctionishDeclaration, IHasFunctionBody, IHasAttributeSpec {

  const string SYNTAX_KIND = 'function_declaration';

  private ?OldAttributeSpecification $_attribute_spec;
  private FunctionDeclarationHeader $_declaration_header;
  private Node $_body;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    FunctionDeclarationHeader $declaration_header,
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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $attribute_spec = Node::fromJSON(
      ($json['function_attribute_spec'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $declaration_header = Node::fromJSON(
      ($json['function_declaration_header']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'FunctionDeclarationHeader',
    );
    $declaration_header = $declaration_header as nonnull;
    $offset += $declaration_header->getWidth();
    $body = Node::fromJSON(
      ($json['function_body']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $body = $body as nonnull;
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $attribute_spec as ?OldAttributeSpecification,
      $declaration_header as FunctionDeclarationHeader,
      $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'declaration_header' => $this->_declaration_header,
      'body' => $this->_body,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute_spec = $this->_attribute_spec === null
      ? null
      : $rewriter($this->_attribute_spec, $parents);
    $declaration_header = $rewriter($this->_declaration_header, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $declaration_header === $this->_declaration_header &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      $attribute_spec as ?OldAttributeSpecification,
      $declaration_header as FunctionDeclarationHeader,
      $body as Node,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?OldAttributeSpecification $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static($value, $this->_declaration_header, $this->_body);
  }

  public function hasAttributeSpec(): bool {
    return $this->_attribute_spec !== null;
  }

  /**
   * @return null | OldAttributeSpecification
   */
  public function getAttributeSpec(): ?OldAttributeSpecification {
    return $this->_attribute_spec;
  }

  /**
   * @return OldAttributeSpecification
   */
  public function getAttributeSpecx(): OldAttributeSpecification {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getDeclarationHeaderUNTYPED(): ?Node {
    return $this->_declaration_header;
  }

  public function withDeclarationHeader(
    FunctionDeclarationHeader $value,
  ): this {
    if ($value === $this->_declaration_header) {
      return $this;
    }
    return new static($this->_attribute_spec, $value, $this->_body);
  }

  public function hasDeclarationHeader(): bool {
    return true;
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

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(Node $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return
      new static($this->_attribute_spec, $this->_declaration_header, $value);
  }

  public function hasBody(): bool {
    return true;
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
