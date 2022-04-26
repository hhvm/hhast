/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0e6cfa879a9d9a7d44b3ff489904981d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ModuleMembershipDeclaration extends Node {

  const string SYNTAX_KIND = 'module_membership_declaration';

  private ?Node $_module_keyword;
  private ?Node $_name;
  private ?Node $_semicolon;

  public function __construct(
    ?Node $module_keyword,
    ?Node $name,
    ?Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_module_keyword = $module_keyword;
    $this->_name = $name;
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
    $module_keyword = Node::fromJSON(
      (
        $json['module_membership_declaration_module_keyword'] ??
        dict['kind' => 'missing']
      ) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $module_keyword?->getWidth() ?? 0;
    $name = Node::fromJSON(
      ($json['module_membership_declaration_name'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $semicolon = Node::fromJSON(
      (
        $json['module_membership_declaration_semicolon'] ??
        dict['kind' => 'missing']
      ) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $module_keyword,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'module_keyword' => $this->_module_keyword,
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
    $module_keyword = $this->_module_keyword === null
      ? null
      : $rewriter($this->_module_keyword, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $semicolon = $this->_semicolon === null
      ? null
      : $rewriter($this->_semicolon, $parents);
    if (
      $module_keyword === $this->_module_keyword &&
      $name === $this->_name &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return
      new static($module_keyword as ?Node, $name as ?Node, $semicolon as ?Node);
  }

  public function getModuleKeywordUNTYPED(): ?Node {
    return $this->_module_keyword;
  }

  public function withModuleKeyword(?Node $value): this {
    if ($value === $this->_module_keyword) {
      return $this;
    }
    return new static($value, $this->_name, $this->_semicolon);
  }

  public function hasModuleKeyword(): bool {
    return $this->_module_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getModuleKeyword(): ?Node {
    return $this->_module_keyword;
  }

  /**
   * @return unknown
   */
  public function getModuleKeywordx(): Node {
    return TypeAssert\not_null($this->getModuleKeyword());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_module_keyword, $value, $this->_semicolon);
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
    return new static($this->_module_keyword, $this->_name, $value);
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
