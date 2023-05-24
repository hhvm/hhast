/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<798961dba01f98bb1372fbc98595bc00>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ReifiedTypeArgument extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'reified_type_argument';

  private Node $_reified;
  private Node $_type;

  public function __construct(
    Node $reified,
    Node $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_reified = $reified;
    $this->_type = $type;
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
    $reified = Node::fromJSON(
      ($json['reified_type_argument_reified']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $reified = $reified as nonnull;
    $offset += $reified->getWidth();
    $type = Node::fromJSON(
      ($json['reified_type_argument_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($reified, $type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'reified' => $this->_reified,
      'type' => $this->_type,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $reified = $rewriter($this->_reified, $parents);
    $type = $rewriter($this->_type, $parents);
    if ($reified === $this->_reified && $type === $this->_type) {
      return $this;
    }
    return new static($reified as Node, $type as Node);
  }

  public function getReifiedUNTYPED(): ?Node {
    return $this->_reified;
  }

  public function withReified(Node $value): this {
    if ($value === $this->_reified) {
      return $this;
    }
    return new static($value, $this->_type);
  }

  public function hasReified(): bool {
    return true;
  }

  /**
   * @return
   */
  public function getReified(): Node {
    return $this->_reified;
  }

  /**
   * @return
   */
  public function getReifiedx(): Node {
    return $this->getReified();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_reified, $value);
  }

  public function hasType(): bool {
    return true;
  }

  /**
   * @return
   */
  public function getType(): Node {
    return $this->_type;
  }

  /**
   * @return
   */
  public function getTypex(): Node {
    return $this->getType();
  }
}
