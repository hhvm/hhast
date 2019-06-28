/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4277b0e5b9ecc0ff1d4ad97be3d9ce07>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $reified = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['reified_type_argument_reified'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $reified->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['reified_type_argument_type'],
      $file,
      $offset,
      $source,
      'Node',
    );
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
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $reified = $rewriter($this->_reified, $parents);
    $type = $rewriter($this->_type, $parents);
    if ($reified === $this->_reified && $type === $this->_type) {
      return $this;
    }
    return new static($reified, $type);
  }

  public function getReifiedUNTYPED(): Node {
    return $this->_reified;
  }

  public function withReified(Node $value): this {
    if ($value === $this->_reified) {
      return $this;
    }
    return new static($value ?? Missing(), $this->_type);
  }

  public function hasReified(): bool {
    return !$this->_reified->isMissing();
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

  public function getTypeUNTYPED(): Node {
    return $this->_type;
  }

  public function withType(Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_reified, $value ?? Missing());
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
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
