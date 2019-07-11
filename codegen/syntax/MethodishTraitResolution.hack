/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<64839851419cf832b421c3b78631d9d3>>
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
  private FunctionDeclarationHeader $_function_decl_header;
  private EqualToken $_equal;
  private ScopeResolutionExpression $_name;
  private SemicolonToken $_semicolon;

  public function __construct(
    ?Node $attribute,
    FunctionDeclarationHeader $function_decl_header,
    EqualToken $equal,
    ScopeResolutionExpression $name,
    SemicolonToken $semicolon,
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
      /* HH_FIXME[4110] */ $json['methodish_trait_attribute'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $attribute?->getWidth() ?? 0;
    $function_decl_header = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['methodish_trait_function_decl_header'],
      $file,
      $offset,
      $source,
      'FunctionDeclarationHeader',
    );
    $function_decl_header = $function_decl_header as nonnull;
    $offset += $function_decl_header->getWidth();
    $equal = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['methodish_trait_equal'],
      $file,
      $offset,
      $source,
      'EqualToken',
    );
    $equal = $equal as nonnull;
    $offset += $equal->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['methodish_trait_name'],
      $file,
      $offset,
      $source,
      'ScopeResolutionExpression',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['methodish_trait_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
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
    $function_decl_header = $rewriter($this->_function_decl_header, $parents);
    $equal = $rewriter($this->_equal, $parents);
    $name = $rewriter($this->_name, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
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
   * @return null
   */
  public function getAttribute(): ?Node {
    return $this->_attribute;
  }

  /**
   * @return
   */
  public function getAttributex(): Node {
    return TypeAssert\not_null($this->getAttribute());
  }

  public function getFunctionDeclHeaderUNTYPED(): ?Node {
    return $this->_function_decl_header;
  }

  public function withFunctionDeclHeader(
    FunctionDeclarationHeader $value,
  ): this {
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

  public function getEqualUNTYPED(): ?Node {
    return $this->_equal;
  }

  public function withEqual(EqualToken $value): this {
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

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(ScopeResolutionExpression $value): this {
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
   * @return ScopeResolutionExpression
   */
  public function getName(): ScopeResolutionExpression {
    return TypeAssert\instance_of(
      ScopeResolutionExpression::class,
      $this->_name,
    );
  }

  /**
   * @return ScopeResolutionExpression
   */
  public function getNamex(): ScopeResolutionExpression {
    return $this->getName();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
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
