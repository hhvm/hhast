/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1ff0ad15cbdece948748d5635edac542>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class FunctionCtxTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'function_ctx_type_specifier';

  private ?Node $_keyword;
  private ?Node $_variable;

  public function __construct(
    ?Node $keyword,
    ?Node $variable,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_variable = $variable;
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
      /* HH_FIXME[4110] */ $json['function_ctx_type_keyword'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $keyword?->getWidth() ?? 0;
    $variable = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['function_ctx_type_variable'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $variable?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $variable,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'variable' => $this->_variable,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $this->_keyword === null
      ? null
      : $rewriter($this->_keyword, $parents);
    $variable = $this->_variable === null
      ? null
      : $rewriter($this->_variable, $parents);
    if ($keyword === $this->_keyword && $variable === $this->_variable) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $keyword,
      /* HH_FIXME[4110] use `as` */ $variable,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(?Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_variable);
  }

  public function hasKeyword(): bool {
    return $this->_keyword !== null;
  }

  /**
   * @return unknown
   */
  public function getKeyword(): ?Node {
    return $this->_keyword;
  }

  /**
   * @return unknown
   */
  public function getKeywordx(): Node {
    return TypeAssert\not_null($this->getKeyword());
  }

  public function getVariableUNTYPED(): ?Node {
    return $this->_variable;
  }

  public function withVariable(?Node $value): this {
    if ($value === $this->_variable) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasVariable(): bool {
    return $this->_variable !== null;
  }

  /**
   * @return unknown
   */
  public function getVariable(): ?Node {
    return $this->_variable;
  }

  /**
   * @return unknown
   */
  public function getVariablex(): Node {
    return TypeAssert\not_null($this->getVariable());
  }
}
