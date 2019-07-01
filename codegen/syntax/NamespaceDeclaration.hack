/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<683d026fd7db2c0b10113003373bd4ec>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
abstract class NamespaceDeclarationGeneratedBase extends Node {

  const string SYNTAX_KIND = 'namespace_declaration';

  private NamespaceToken $_keyword;
  private ?INameishNode $_name;
  private INamespaceBody $_body;

  public function __construct(
    NamespaceToken $keyword,
    ?INameishNode $name,
    INamespaceBody $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_name = $name;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_keyword'],
      $file,
      $offset,
      $source,
      'NamespaceToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_name'],
      $file,
      $offset,
      $source,
      'INameishNode',
    );
    $offset += $name?->getWidth() ?? 0;
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
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'body' => $this->_body,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $body,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(NamespaceToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_name, $this->_body);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return NamespaceToken
   */
  public function getKeyword(): NamespaceToken {
    return TypeAssert\instance_of(NamespaceToken::class, $this->_keyword);
  }

  /**
   * @return NamespaceToken
   */
  public function getKeywordx(): NamespaceToken {
    return $this->getKeyword();
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?INameishNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_body);
  }

  public function hasName(): bool {
    return $this->_name !== null;
  }

  /**
   * @return null | QualifiedName | NameToken
   */
  public function getName(): ?INameishNode {
    return $this->_name;
  }

  /**
   * @return QualifiedName | NameToken
   */
  public function getNamex(): INameishNode {
    return TypeAssert\not_null($this->getName());
  }

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(INamespaceBody $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static($this->_keyword, $this->_name, $value);
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
