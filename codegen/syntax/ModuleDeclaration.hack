/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<589a6f001bcc405f13627a0e9823358c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ModuleDeclaration extends Node {

  const string SYNTAX_KIND = 'module_declaration';

  private ?OldAttributeSpecification $_attribute_spec;
  private NewToken $_new_keyword;
  private ModuleToken $_module_keyword;
  private ModuleName $_name;
  private LeftBraceToken $_left_brace;
  private ?Node $_exports;
  private ?Node $_imports;
  private RightBraceToken $_right_brace;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    NewToken $new_keyword,
    ModuleToken $module_keyword,
    ModuleName $name,
    LeftBraceToken $left_brace,
    ?Node $exports,
    ?Node $imports,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_new_keyword = $new_keyword;
    $this->_module_keyword = $module_keyword;
    $this->_name = $name;
    $this->_left_brace = $left_brace;
    $this->_exports = $exports;
    $this->_imports = $imports;
    $this->_right_brace = $right_brace;
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
      ($json['module_declaration_attribute_spec'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'OldAttributeSpecification',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $new_keyword = Node::fromJSON(
      ($json['module_declaration_new_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NewToken',
    );
    $new_keyword = $new_keyword as nonnull;
    $offset += $new_keyword->getWidth();
    $module_keyword = Node::fromJSON(
      ($json['module_declaration_module_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ModuleToken',
    );
    $module_keyword = $module_keyword as nonnull;
    $offset += $module_keyword->getWidth();
    $name = Node::fromJSON(
      ($json['module_declaration_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ModuleName',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $left_brace = Node::fromJSON(
      ($json['module_declaration_left_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $exports = Node::fromJSON(
      ($json['module_declaration_exports'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $exports?->getWidth() ?? 0;
    $imports = Node::fromJSON(
      ($json['module_declaration_imports'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $imports?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['module_declaration_right_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $right_brace = $right_brace as nonnull;
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $attribute_spec as ?OldAttributeSpecification,
      $new_keyword as NewToken,
      $module_keyword as ModuleToken,
      $name as ModuleName,
      $left_brace as LeftBraceToken,
      $exports,
      $imports,
      $right_brace as RightBraceToken,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'new_keyword' => $this->_new_keyword,
      'module_keyword' => $this->_module_keyword,
      'name' => $this->_name,
      'left_brace' => $this->_left_brace,
      'exports' => $this->_exports,
      'imports' => $this->_imports,
      'right_brace' => $this->_right_brace,
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
    $new_keyword = $rewriter($this->_new_keyword, $parents);
    $module_keyword = $rewriter($this->_module_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $left_brace = $rewriter($this->_left_brace, $parents);
    $exports =
      $this->_exports === null ? null : $rewriter($this->_exports, $parents);
    $imports =
      $this->_imports === null ? null : $rewriter($this->_imports, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $new_keyword === $this->_new_keyword &&
      $module_keyword === $this->_module_keyword &&
      $name === $this->_name &&
      $left_brace === $this->_left_brace &&
      $exports === $this->_exports &&
      $imports === $this->_imports &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $attribute_spec as ?OldAttributeSpecification,
      $new_keyword as NewToken,
      $module_keyword as ModuleToken,
      $name as ModuleName,
      $left_brace as LeftBraceToken,
      $exports as ?Node,
      $imports as ?Node,
      $right_brace as RightBraceToken,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?OldAttributeSpecification $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value,
      $this->_new_keyword,
      $this->_module_keyword,
      $this->_name,
      $this->_left_brace,
      $this->_exports,
      $this->_imports,
      $this->_right_brace,
    );
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

  public function getNewKeywordUNTYPED(): ?Node {
    return $this->_new_keyword;
  }

  public function withNewKeyword(NewToken $value): this {
    if ($value === $this->_new_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_module_keyword,
      $this->_name,
      $this->_left_brace,
      $this->_exports,
      $this->_imports,
      $this->_right_brace,
    );
  }

  public function hasNewKeyword(): bool {
    return true;
  }

  /**
   * @return NewToken
   */
  public function getNewKeyword(): NewToken {
    return TypeAssert\instance_of(NewToken::class, $this->_new_keyword);
  }

  /**
   * @return NewToken
   */
  public function getNewKeywordx(): NewToken {
    return $this->getNewKeyword();
  }

  public function getModuleKeywordUNTYPED(): ?Node {
    return $this->_module_keyword;
  }

  public function withModuleKeyword(ModuleToken $value): this {
    if ($value === $this->_module_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_new_keyword,
      $value,
      $this->_name,
      $this->_left_brace,
      $this->_exports,
      $this->_imports,
      $this->_right_brace,
    );
  }

  public function hasModuleKeyword(): bool {
    return true;
  }

  /**
   * @return ModuleToken
   */
  public function getModuleKeyword(): ModuleToken {
    return TypeAssert\instance_of(ModuleToken::class, $this->_module_keyword);
  }

  /**
   * @return ModuleToken
   */
  public function getModuleKeywordx(): ModuleToken {
    return $this->getModuleKeyword();
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(ModuleName $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_new_keyword,
      $this->_module_keyword,
      $value,
      $this->_left_brace,
      $this->_exports,
      $this->_imports,
      $this->_right_brace,
    );
  }

  public function hasName(): bool {
    return true;
  }

  /**
   * @return ModuleName
   */
  public function getName(): ModuleName {
    return TypeAssert\instance_of(ModuleName::class, $this->_name);
  }

  /**
   * @return ModuleName
   */
  public function getNamex(): ModuleName {
    return $this->getName();
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_new_keyword,
      $this->_module_keyword,
      $this->_name,
      $value,
      $this->_exports,
      $this->_imports,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return true;
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getExportsUNTYPED(): ?Node {
    return $this->_exports;
  }

  public function withExports(?Node $value): this {
    if ($value === $this->_exports) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_new_keyword,
      $this->_module_keyword,
      $this->_name,
      $this->_left_brace,
      $value,
      $this->_imports,
      $this->_right_brace,
    );
  }

  public function hasExports(): bool {
    return $this->_exports !== null;
  }

  /**
   * @return null
   */
  public function getExports(): ?Node {
    return $this->_exports;
  }

  /**
   * @return
   */
  public function getExportsx(): Node {
    return TypeAssert\not_null($this->getExports());
  }

  public function getImportsUNTYPED(): ?Node {
    return $this->_imports;
  }

  public function withImports(?Node $value): this {
    if ($value === $this->_imports) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_new_keyword,
      $this->_module_keyword,
      $this->_name,
      $this->_left_brace,
      $this->_exports,
      $value,
      $this->_right_brace,
    );
  }

  public function hasImports(): bool {
    return $this->_imports !== null;
  }

  /**
   * @return null
   */
  public function getImports(): ?Node {
    return $this->_imports;
  }

  /**
   * @return
   */
  public function getImportsx(): Node {
    return TypeAssert\not_null($this->getImports());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_new_keyword,
      $this->_module_keyword,
      $this->_name,
      $this->_left_brace,
      $this->_exports,
      $this->_imports,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return true;
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
