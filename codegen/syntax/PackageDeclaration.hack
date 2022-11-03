/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<75d2329eb34236a7ab79901cedc637f9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class PackageDeclaration extends Node {

  const string SYNTAX_KIND = 'package_declaration';

  private ?Node $_attribute_spec;
  private ?Node $_package_keyword;
  private ?Node $_name;
  private ?Node $_left_brace;
  private ?Node $_uses;
  private ?Node $_includes;
  private ?Node $_right_brace;

  public function __construct(
    ?Node $attribute_spec,
    ?Node $package_keyword,
    ?Node $name,
    ?Node $left_brace,
    ?Node $uses,
    ?Node $includes,
    ?Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_attribute_spec = $attribute_spec;
    $this->_package_keyword = $package_keyword;
    $this->_name = $name;
    $this->_left_brace = $left_brace;
    $this->_uses = $uses;
    $this->_includes = $includes;
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
      ($json['package_declaration_attribute_spec'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $attribute_spec?->getWidth() ?? 0;
    $package_keyword = Node::fromJSON(
      (
        $json['package_declaration_package_keyword'] ??
        dict['kind' => 'missing']
      ) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $package_keyword?->getWidth() ?? 0;
    $name = Node::fromJSON(
      ($json['package_declaration_name'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      ($json['package_declaration_left_brace'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace?->getWidth() ?? 0;
    $uses = Node::fromJSON(
      ($json['package_declaration_uses'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $uses?->getWidth() ?? 0;
    $includes = Node::fromJSON(
      ($json['package_declaration_includes'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $includes?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['package_declaration_right_brace'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_brace?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $attribute_spec,
      /* HH_IGNORE_ERROR[4110] */ $package_keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $uses,
      /* HH_IGNORE_ERROR[4110] */ $includes,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'attribute_spec' => $this->_attribute_spec,
      'package_keyword' => $this->_package_keyword,
      'name' => $this->_name,
      'left_brace' => $this->_left_brace,
      'uses' => $this->_uses,
      'includes' => $this->_includes,
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
    $package_keyword = $this->_package_keyword === null
      ? null
      : $rewriter($this->_package_keyword, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $left_brace = $this->_left_brace === null
      ? null
      : $rewriter($this->_left_brace, $parents);
    $uses = $this->_uses === null ? null : $rewriter($this->_uses, $parents);
    $includes =
      $this->_includes === null ? null : $rewriter($this->_includes, $parents);
    $right_brace = $this->_right_brace === null
      ? null
      : $rewriter($this->_right_brace, $parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $package_keyword === $this->_package_keyword &&
      $name === $this->_name &&
      $left_brace === $this->_left_brace &&
      $uses === $this->_uses &&
      $includes === $this->_includes &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $attribute_spec as ?Node,
      $package_keyword as ?Node,
      $name as ?Node,
      $left_brace as ?Node,
      $uses as ?Node,
      $includes as ?Node,
      $right_brace as ?Node,
    );
  }

  public function getAttributeSpecUNTYPED(): ?Node {
    return $this->_attribute_spec;
  }

  public function withAttributeSpec(?Node $value): this {
    if ($value === $this->_attribute_spec) {
      return $this;
    }
    return new static(
      $value,
      $this->_package_keyword,
      $this->_name,
      $this->_left_brace,
      $this->_uses,
      $this->_includes,
      $this->_right_brace,
    );
  }

  public function hasAttributeSpec(): bool {
    return $this->_attribute_spec !== null;
  }

  /**
   * @return unknown
   */
  public function getAttributeSpec(): ?Node {
    return $this->_attribute_spec;
  }

  /**
   * @return unknown
   */
  public function getAttributeSpecx(): Node {
    return TypeAssert\not_null($this->getAttributeSpec());
  }

  public function getPackageKeywordUNTYPED(): ?Node {
    return $this->_package_keyword;
  }

  public function withPackageKeyword(?Node $value): this {
    if ($value === $this->_package_keyword) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $value,
      $this->_name,
      $this->_left_brace,
      $this->_uses,
      $this->_includes,
      $this->_right_brace,
    );
  }

  public function hasPackageKeyword(): bool {
    return $this->_package_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getPackageKeyword(): ?Node {
    return $this->_package_keyword;
  }

  /**
   * @return unknown
   */
  public function getPackageKeywordx(): Node {
    return TypeAssert\not_null($this->getPackageKeyword());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_package_keyword,
      $value,
      $this->_left_brace,
      $this->_uses,
      $this->_includes,
      $this->_right_brace,
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

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(?Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_package_keyword,
      $this->_name,
      $value,
      $this->_uses,
      $this->_includes,
      $this->_right_brace,
    );
  }

  public function hasLeftBrace(): bool {
    return $this->_left_brace !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftBrace(): ?Node {
    return $this->_left_brace;
  }

  /**
   * @return unknown
   */
  public function getLeftBracex(): Node {
    return TypeAssert\not_null($this->getLeftBrace());
  }

  public function getUsesUNTYPED(): ?Node {
    return $this->_uses;
  }

  public function withUses(?Node $value): this {
    if ($value === $this->_uses) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_package_keyword,
      $this->_name,
      $this->_left_brace,
      $value,
      $this->_includes,
      $this->_right_brace,
    );
  }

  public function hasUses(): bool {
    return $this->_uses !== null;
  }

  /**
   * @return unknown
   */
  public function getUses(): ?Node {
    return $this->_uses;
  }

  /**
   * @return unknown
   */
  public function getUsesx(): Node {
    return TypeAssert\not_null($this->getUses());
  }

  public function getIncludesUNTYPED(): ?Node {
    return $this->_includes;
  }

  public function withIncludes(?Node $value): this {
    if ($value === $this->_includes) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_package_keyword,
      $this->_name,
      $this->_left_brace,
      $this->_uses,
      $value,
      $this->_right_brace,
    );
  }

  public function hasIncludes(): bool {
    return $this->_includes !== null;
  }

  /**
   * @return unknown
   */
  public function getIncludes(): ?Node {
    return $this->_includes;
  }

  /**
   * @return unknown
   */
  public function getIncludesx(): Node {
    return TypeAssert\not_null($this->getIncludes());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(?Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_attribute_spec,
      $this->_package_keyword,
      $this->_name,
      $this->_left_brace,
      $this->_uses,
      $this->_includes,
      $value,
    );
  }

  public function hasRightBrace(): bool {
    return $this->_right_brace !== null;
  }

  /**
   * @return unknown
   */
  public function getRightBrace(): ?Node {
    return $this->_right_brace;
  }

  /**
   * @return unknown
   */
  public function getRightBracex(): Node {
    return TypeAssert\not_null($this->getRightBrace());
  }
}
