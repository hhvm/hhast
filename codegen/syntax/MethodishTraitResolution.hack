/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a6c7ace6be4736542a333baf9dd0f20e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class MethodishTraitResolution
  extends Node
  implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'methodish_trait_resolution';

  private ?Node $_attribute;
  private ?Node $_function_decl_header;
  private ?Node $_equal;
  private ?Node $_name;
  private ?Node $_semicolon;

  public function __construct(
    ?Node $attribute,
    ?Node $function_decl_header,
    ?Node $equal,
    ?Node $name,
    ?Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute = $attribute;
    $this->_function_decl_header = $function_decl_header;
    $this->_equal = $equal;
    $this->_name = $name;
    $this->_semicolon = $semicolon;
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
    $attribute = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['methodish_trait_attribute'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $attribute?->getWidth() ?? 0;
    $function_decl_header = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['methodish_trait_function_decl_header'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $function_decl_header?->getWidth() ?? 0;
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['methodish_trait_equal'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $equal?->getWidth() ?? 0;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['methodish_trait_name'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['methodish_trait_semicolon'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $semicolon?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $attribute,
      /* HH_IGNORE_ERROR[4110] */ $function_decl_header,
      /* HH_IGNORE_ERROR[4110] */ $equal,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute' => $this->_attribute,
      'function_decl_header' => $this->_function_decl_header,
      'equal' => $this->_equal,
      'name' => $this->_name,
      'semicolon' => $this->_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $attribute = $this->_attribute === null
      ? null
      : $rewriter($this->_attribute, $parents);
    $function_decl_header = $this->_function_decl_header === null
      ? null
      : $rewriter($this->_function_decl_header, $parents);
    $equal = $this->_equal === null ? null : $rewriter($this->_equal, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $semicolon = $this->_semicolon === null
      ? null
      : $rewriter($this->_semicolon, $parents);
    if (
      $attribute === $this->_attribute &&
      $function_decl_header === $this->_function_decl_header &&
      $equal === $this->_equal &&
      $name === $this->_name &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $attribute,
      /* HH_FIXME[4110] use `as` */ $function_decl_header,
      /* HH_FIXME[4110] use `as` */ $equal,
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getAttributeUNTYPED(): ?Node {
    return $this->_attribute;
  }

  public function withAttribute(?Node $value): this {
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
    return $this->_attribute !== null;
  }

  /**
   * @return unknown
   */
  public function getAttribute(): ?Node {
    return $this->_attribute;
  }

  /**
   * @return unknown
   */
  public function getAttributex(): Node {
    return TypeAssert\not_null($this->getAttribute());
  }

  public function getFunctionDeclHeaderUNTYPED(): ?Node {
    return $this->_function_decl_header;
  }

  public function withFunctionDeclHeader(?Node $value): this {
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
    return $this->_function_decl_header !== null;
  }

  /**
   * @return unknown
   */
  public function getFunctionDeclHeader(): ?Node {
    return $this->_function_decl_header;
  }

  /**
   * @return unknown
   */
  public function getFunctionDeclHeaderx(): Node {
    return TypeAssert\not_null($this->getFunctionDeclHeader());
  }

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(?Node $value): this {
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
    return $this->_equal !== null;
  }

  /**
   * @return unknown
   */
  public function getEqual(): ?Node {
    return $this->_equal;
  }

  /**
   * @return unknown
   */
  public function getEqualx(): Node {
    return TypeAssert\not_null($this->getEqual());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
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
    return $this->_name !== null;
  }

  /**
   * @return unknown
   */
  public function getName(): ?Node {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): Node {
    return TypeAssert\not_null($this->getName());
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(?Node $value): this {
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
    return $this->_semicolon !== null;
  }

  /**
   * @return unknown
   */
  public function getSemicolon(): ?Node {
    return $this->_semicolon;
  }

  /**
   * @return unknown
   */
  public function getSemicolonx(): Node {
    return TypeAssert\not_null($this->getSemicolon());
  }
}
