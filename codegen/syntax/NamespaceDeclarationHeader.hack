/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<dad5163d50e032ae609bd3d7c7cb59ef>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class NamespaceDeclarationHeader extends Node {

  const string SYNTAX_KIND = 'namespace_declaration_header';

  private NamespaceToken $_keyword;
  private ?INameishNode $_name;

  public function __construct(
    NamespaceToken $keyword,
    ?INameishNode $name,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_name = $name;
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
    $keyword = Node::fromJSON(
      ($json['namespace_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NamespaceToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $name = Node::fromJSON(
      ($json['namespace_name'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'INameishNode',
    );
    $offset += $name?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'name' => $this->_name,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    if ($keyword === $this->_keyword && $name === $this->_name) {
      return $this;
    }
    return new static($keyword as NamespaceToken, $name as ?INameishNode);
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(NamespaceToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_name);
  }

  public function hasKeyword(): bool {
    return true;
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
    return new static($this->_keyword, $value);
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
}
