/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e3a04ad4b403c4061b136d837a2b70c8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
abstract class MethodishDeclarationGeneratedBase
  extends Node
  implements
    IClassBodyDeclaration,
    IFunctionishDeclaration,
    IHasFunctionBody,
    IHasAttributeSpec {

  const string SYNTAX_KIND = 'methodish_declaration';

  private ?OldAttributeSpecification $_attribute;
  private FunctionDeclarationHeader $_function_decl_header;
  private ?CompoundStatement $_function_body;
  private ?SemicolonToken $_semicolon;

  public function __construct(
    ?OldAttributeSpecification $attribute,
    FunctionDeclarationHeader $function_decl_header,
    ?CompoundStatement $function_body,
    ?SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute = $attribute;
    $this->_function_decl_header = $function_decl_header;
    $this->_function_body = $function_body;
    $this->_semicolon = $semicolon;
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
    $attribute = Node::fromJSON(
      ($json['methodish_attribute'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute?->getWidth() ?? 0;
    $function_decl_header = Node::fromJSON(
      ($json['methodish_function_decl_header']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'FunctionDeclarationHeader',
    );
    $function_decl_header = $function_decl_header as nonnull;
    $offset += $function_decl_header->getWidth();
    $function_body = Node::fromJSON(
      ($json['methodish_function_body'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'CompoundStatement',
    );
    $offset += $function_body?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      ($json['methodish_semicolon'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'SemicolonToken',
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
      /* HH_IGNORE_ERROR[4110] */ $function_body,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute' => $this->_attribute,
      'function_decl_header' => $this->_function_decl_header,
      'function_body' => $this->_function_body,
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
    $function_body = $this->_function_body === null
      ? null
      : $rewriter($this->_function_body, $parents);
    $semicolon = $this->_semicolon === null
      ? null
      : $rewriter($this->_semicolon, $parents);
    if (
      $attribute === $this->_attribute &&
      $function_decl_header === $this->_function_decl_header &&
      $function_body === $this->_function_body &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $attribute as ?OldAttributeSpecification,
      $function_decl_header as FunctionDeclarationHeader,
      $function_body as ?CompoundStatement,
      $semicolon as ?SemicolonToken,
    );
  }

  public function getAttributeUNTYPED(): ?Node {
    return $this->_attribute;
  }

  public function withAttribute(?OldAttributeSpecification $value): this {
    if ($value === $this->_attribute) {
      return $this;
    }
    return new static(
      $value,
      $this->_function_decl_header,
      $this->_function_body,
      $this->_semicolon,
    );
  }

  public function hasAttribute(): bool {
    return $this->_attribute !== null;
  }

  /**
   * @return null | OldAttributeSpecification
   */
  public function getAttribute(): ?OldAttributeSpecification {
    return $this->_attribute;
  }

  /**
   * @return OldAttributeSpecification
   */
  public function getAttributex(): OldAttributeSpecification {
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
      $this->_function_body,
      $this->_semicolon,
    );
  }

  public function hasFunctionDeclHeader(): bool {
    return true;
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

  public function getFunctionBodyUNTYPED(): ?Node {
    return $this->_function_body;
  }

  public function withFunctionBody(?CompoundStatement $value): this {
    if ($value === $this->_function_body) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_function_decl_header,
      $value,
      $this->_semicolon,
    );
  }

  public function hasFunctionBody(): bool {
    return $this->_function_body !== null;
  }

  /**
   * @return CompoundStatement | null
   */
  public function getFunctionBody(): ?CompoundStatement {
    return $this->_function_body;
  }

  /**
   * @return CompoundStatement
   */
  public function getFunctionBodyx(): CompoundStatement {
    return TypeAssert\not_null($this->getFunctionBody());
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(?SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_attribute,
      $this->_function_decl_header,
      $this->_function_body,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
  }

  /**
   * @return null | SemicolonToken
   */
  public function getSemicolon(): ?SemicolonToken {
    return $this->_semicolon;
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return TypeAssert\not_null($this->getSemicolon());
  }
}
