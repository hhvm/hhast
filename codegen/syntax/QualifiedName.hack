/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7ac8e17a37d886e765d4382176dcc884>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class QualifiedName extends Node implements INameishNode {

  const string SYNTAX_KIND = 'qualified_name';

  private Node $_parts;

  public function __construct(
    Node $parts,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_parts = $parts;
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
    $parts = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['qualified_name_parts'],
      $file,
      $offset,
      $source,
    );
    $offset += $parts->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($parts, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'parts' => $this->_parts,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $parts = $rewriter($this->_parts, $parents);
    if ($parts === $this->_parts) {
      return $this;
    }
    return new static($parts);
  }

  public function getPartsUNTYPED(): Node {
    return $this->_parts;
  }

  public function withParts(Node $value): this {
    if ($value === $this->_parts) {
      return $this;
    }
    return new static($value);
  }

  public function hasParts(): bool {
    return !$this->_parts->isMissing();
  }

  /**
   * @return NodeList<?NameToken> | NodeList<NameToken>
   */
  public function getParts(): NodeList<?NameToken> {
    return TypeAssert\instance_of(NodeList::class, $this->_parts);
  }

  /**
   * @return NodeList<?NameToken> | NodeList<NameToken>
   */
  public function getPartsx(): NodeList<?NameToken> {
    return $this->getParts();
  }
}
