/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<91bc9351db081e6e635dcbd37d89efc0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
abstract class ScriptGeneratedBase extends Node {

  const string SYNTAX_KIND = 'script';

  private Node $_declarations;

  public function __construct(
    Node $declarations,
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
  ): this {
    $offset = $initial_offset;
    $declarations = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['script_declarations'],
      $file,
      $offset,
      $source,
    );
    $offset += $declarations->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($declarations, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'declarations' => $this->_declarations,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $declarations = $rewriter($this->_declarations, $parents);
    if ($declarations === $this->_declarations) {
      return $this;
    }
    return new static($declarations);
  }

  public function getDeclarationsUNTYPED(): Node {
    return $this->_declarations;
  }

  public function withDeclarations(Node $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new static($value);
  }

  public function hasDeclarations(): bool {
    return !$this->_declarations->isMissing();
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
