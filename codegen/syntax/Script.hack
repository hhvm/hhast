/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<819e521e21ab5038912886707d5d60ee>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $declarations = Node::fromJSON(
      ($json['script_declarations']) as dict<_, _>,
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
    return new static(
      /* HH_FIXME[4110] NodeList<Node> may not be enforceable */ $declarations,
    );
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
    return true;
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
