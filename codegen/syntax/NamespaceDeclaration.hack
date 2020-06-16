/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<99fe0821bf7ad1c9ec153cdffef27f5f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
abstract class NamespaceDeclarationGeneratedBase extends Node {

  const string SYNTAX_KIND = 'namespace_declaration';

  private NamespaceDeclarationHeader $_header;
  private INamespaceBody $_body;

  public function __construct(
    NamespaceDeclarationHeader $header,
    INamespaceBody $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_header = $header;
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
    $header = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_header'],
      $file,
      $offset,
      $source,
      'NamespaceDeclarationHeader',
    );
    $header = $header as nonnull;
    $offset += $header->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_body'],
      $file,
      $offset,
      $source,
      'INamespaceBody',
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
      /* HH_IGNORE_ERROR[4110] */ $header,
      /* HH_IGNORE_ERROR[4110] */ $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'header' => $this->_header,
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
    $header = $rewriter($this->_header, $parents);
    $body = $rewriter($this->_body, $parents);
    if ($header === $this->_header && $body === $this->_body) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $header,
      /* HH_FIXME[4110] use `as` */ $body,
    );
  }

  public function getHeaderUNTYPED(): ?Node {
    return $this->_header;
  }

  public function withHeader(NamespaceDeclarationHeader $value): this {
    if ($value === $this->_header) {
      return $this;
    }
    return new static($value, $this->_body);
  }

  public function hasHeader(): bool {
    return $this->_header !== null;
  }

  /**
   * @return NamespaceDeclarationHeader
   */
  public function getHeader(): NamespaceDeclarationHeader {
    return TypeAssert\instance_of(
      NamespaceDeclarationHeader::class,
      $this->_header,
    );
  }

  /**
   * @return NamespaceDeclarationHeader
   */
  public function getHeaderx(): NamespaceDeclarationHeader {
    return $this->getHeader();
  }

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(INamespaceBody $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static($this->_header, $value);
  }

  public function hasBody(): bool {
    return $this->_body !== null;
  }

  /**
   * @return NamespaceBody | NamespaceEmptyBody
   */
  public function getBody(): INamespaceBody {
    return TypeAssert\instance_of(INamespaceBody::class, $this->_body);
  }

  /**
   * @return NamespaceBody | NamespaceEmptyBody
   */
  public function getBodyx(): INamespaceBody {
    return $this->getBody();
  }
}
