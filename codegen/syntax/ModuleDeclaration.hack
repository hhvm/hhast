/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<066bf009dfdf1ba8c04e96cc1482b4bb>>
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
  private NameToken $_name;
  private LeftBraceToken $_left_brace;
  private RightBraceToken $_right_brace;

  public function __construct(
    ?OldAttributeSpecification $attribute_spec,
    NewToken $new_keyword,
    ModuleToken $module_keyword,
    NameToken $name,
    LeftBraceToken $left_brace,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_new_keyword = $new_keyword;
    $this->_module_keyword = $module_keyword;
    $this->_name = $name;
    $this->_left_brace = $left_brace;
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
      'NameToken',
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
      /* HH_IGNORE_ERROR[4110] */ $attribute_spec,
      /* HH_IGNORE_ERROR[4110] */ $new_keyword,
      /* HH_IGNORE_ERROR[4110] */ $module_keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
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
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $new_keyword === $this->_new_keyword &&
      $module_keyword === $this->_module_keyword &&
      $name === $this->_name &&
      $left_brace === $this->_left_brace &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $attribute_spec as ?OldAttributeSpecification,
      $new_keyword as NewToken,
      $module_keyword as ModuleToken,
      $name as NameToken,
      $left_brace as LeftBraceToken,
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

  public function withName(NameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_new_keyword,
      $this->_module_keyword,
      $value,
      $this->_left_brace,
      $this->_right_brace,
    );
  }

  public function hasName(): bool {
    return true;
  }

  /**
   * @return NameToken
   */
  public function getName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  /**
   * @return NameToken
   */
  public function getNamex(): NameToken {
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
