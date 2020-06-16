/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2d59bd3c0bc907955ddea4538b5ba6a5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
abstract class ScriptGeneratedBase extends Node {

  const string SYNTAX_KIND = 'script';

  private NodeList<Node> $_declarations;

  public function __construct(
    NodeList<Node> $declarations,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_declarations = $declarations;
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
    $declarations = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['script_declarations'],
      $file,
      $offset,
      $source,
      'NodeList<Node>',
    );
    $declarations = $declarations as nonnull;
    $offset += $declarations->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(/* HH_IGNORE_ERROR[4110] */ $declarations, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'declarations' => $this->_declarations,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $declarations = $rewriter($this->_declarations, $parents);
    if ($declarations === $this->_declarations) {
      return $this;
    }
    return new static(/* HH_FIXME[4110] use `as` */ $declarations);
  }

  public function getDeclarationsUNTYPED(): ?Node {
    return $this->_declarations;
  }

  public function withDeclarations(NodeList<Node> $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new static($value);
  }

  public function hasDeclarations(): bool {
    return $this->_declarations !== null;
  }

  /**
   * @return NodeList<Node>
   */
  public function getDeclarations(): NodeList<Node> {
    return TypeAssert\instance_of(NodeList::class, $this->_declarations);
  }

  /**
   * @return NodeList<Node>
   */
  public function getDeclarationsx(): NodeList<Node> {
    return $this->getDeclarations();
  }
}
