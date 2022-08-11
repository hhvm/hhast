/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4cce7c2ecfcdefa1bd56e2cbd86295cd>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ModuleImports extends Node {

  const string SYNTAX_KIND = 'module_imports';

  private ?Node $_imports_keyword;
  private ?Node $_left_brace;
  private ?Node $_imports;
  private ?Node $_right_brace;

  public function __construct(
    ?Node $imports_keyword,
    ?Node $left_brace,
    ?Node $imports,
    ?Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_imports_keyword = $imports_keyword;
    $this->_left_brace = $left_brace;
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
    $imports_keyword = Node::fromJSON(
      ($json['module_imports_imports_keyword'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $imports_keyword?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      ($json['module_imports_left_brace'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace?->getWidth() ?? 0;
    $imports = Node::fromJSON(
      ($json['module_imports_imports'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $imports?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['module_imports_right_brace'] ?? dict['kind' => 'missing'])
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
      /* HH_IGNORE_ERROR[4110] */ $imports_keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $imports,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'imports_keyword' => $this->_imports_keyword,
      'left_brace' => $this->_left_brace,
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
    $imports_keyword = $this->_imports_keyword === null
      ? null
      : $rewriter($this->_imports_keyword, $parents);
    $left_brace = $this->_left_brace === null
      ? null
      : $rewriter($this->_left_brace, $parents);
    $imports =
      $this->_imports === null ? null : $rewriter($this->_imports, $parents);
    $right_brace = $this->_right_brace === null
      ? null
      : $rewriter($this->_right_brace, $parents);
    if (
      $imports_keyword === $this->_imports_keyword &&
      $left_brace === $this->_left_brace &&
      $imports === $this->_imports &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $imports_keyword as ?Node,
      $left_brace as ?Node,
      $imports as ?Node,
      $right_brace as ?Node,
    );
  }

  public function getImportsKeywordUNTYPED(): ?Node {
    return $this->_imports_keyword;
  }

  public function withImportsKeyword(?Node $value): this {
    if ($value === $this->_imports_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_brace,
      $this->_imports,
      $this->_right_brace,
    );
  }

  public function hasImportsKeyword(): bool {
    return $this->_imports_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getImportsKeyword(): ?Node {
    return $this->_imports_keyword;
  }

  /**
   * @return unknown
   */
  public function getImportsKeywordx(): Node {
    return TypeAssert\not_null($this->getImportsKeyword());
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(?Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_imports_keyword,
      $value,
      $this->_imports,
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

  public function getImportsUNTYPED(): ?Node {
    return $this->_imports;
  }

  public function withImports(?Node $value): this {
    if ($value === $this->_imports) {
      return $this;
    }
    return new static(
      $this->_imports_keyword,
      $this->_left_brace,
      $value,
      $this->_right_brace,
    );
  }

  public function hasImports(): bool {
    return $this->_imports !== null;
  }

  /**
   * @return unknown
   */
  public function getImports(): ?Node {
    return $this->_imports;
  }

  /**
   * @return unknown
   */
  public function getImportsx(): Node {
    return TypeAssert\not_null($this->getImports());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(?Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_imports_keyword,
      $this->_left_brace,
      $this->_imports,
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
