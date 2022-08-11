/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b9b93431bd62ffaa7c83f249c7954a22>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ModuleName extends Node {

  const string SYNTAX_KIND = 'module_name';

  private NodeList<ListItem<NameToken>> $_parts;

  public function __construct(
    NodeList<ListItem<NameToken>> $parts,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_parts = $parts;
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
    $parts = Node::fromJSON(
      ($json['module_name_parts']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<NameToken>>',
    );
    $parts = $parts as nonnull;
    $offset += $parts->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(/* HH_IGNORE_ERROR[4110] */ $parts, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'parts' => $this->_parts,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $parts = $rewriter($this->_parts, $parents);
    if ($parts === $this->_parts) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] NodeList<ListItem<NameToken>> may not be enforceable */ $parts,
    );
  }

  public function getPartsUNTYPED(): ?Node {
    return $this->_parts;
  }

  public function withParts(NodeList<ListItem<NameToken>> $value): this {
    if ($value === $this->_parts) {
      return $this;
    }
    return new static($value);
  }

  public function hasParts(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<NameToken>>
   */
  public function getParts(): NodeList<ListItem<NameToken>> {
    return TypeAssert\instance_of(NodeList::class, $this->_parts);
  }

  /**
   * @return NodeList<ListItem<NameToken>>
   */
  public function getPartsx(): NodeList<ListItem<NameToken>> {
    return $this->getParts();
  }
}
