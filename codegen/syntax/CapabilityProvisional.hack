/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a3a54b93f129fa79829848e03069a0ae>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class CapabilityProvisional extends Node {

  const string SYNTAX_KIND = 'capability_provisional';

  private ?Node $_at;
  private ?Node $_left_brace;
  private ?Node $_type;
  private ?Node $_unsafe_plus;
  private ?Node $_unsafe_type;
  private ?Node $_right_brace;

  public function __construct(
    ?Node $at,
    ?Node $left_brace,
    ?Node $type,
    ?Node $unsafe_plus,
    ?Node $unsafe_type,
    ?Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_at = $at;
    $this->_left_brace = $left_brace;
    $this->_type = $type;
    $this->_unsafe_plus = $unsafe_plus;
    $this->_unsafe_type = $unsafe_type;
    $this->_right_brace = $right_brace;
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
    $at = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['capability_provisional_at'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $at?->getWidth() ?? 0;
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['capability_provisional_left_brace'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_brace?->getWidth() ?? 0;
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['capability_provisional_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $type?->getWidth() ?? 0;
    $unsafe_plus = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['capability_provisional_unsafe_plus'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $unsafe_plus?->getWidth() ?? 0;
    $unsafe_type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['capability_provisional_unsafe_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $unsafe_type?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['capability_provisional_right_brace'] ?? dict['kind' => 'missing'],
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
      /* HH_IGNORE_ERROR[4110] */ $at,
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $unsafe_plus,
      /* HH_IGNORE_ERROR[4110] */ $unsafe_type,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'at' => $this->_at,
      'left_brace' => $this->_left_brace,
      'type' => $this->_type,
      'unsafe_plus' => $this->_unsafe_plus,
      'unsafe_type' => $this->_unsafe_type,
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
    $at = $this->_at === null ? null : $rewriter($this->_at, $parents);
    $left_brace = $this->_left_brace === null
      ? null
      : $rewriter($this->_left_brace, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $unsafe_plus = $this->_unsafe_plus === null
      ? null
      : $rewriter($this->_unsafe_plus, $parents);
    $unsafe_type = $this->_unsafe_type === null
      ? null
      : $rewriter($this->_unsafe_type, $parents);
    $right_brace = $this->_right_brace === null
      ? null
      : $rewriter($this->_right_brace, $parents);
    if (
      $at === $this->_at &&
      $left_brace === $this->_left_brace &&
      $type === $this->_type &&
      $unsafe_plus === $this->_unsafe_plus &&
      $unsafe_type === $this->_unsafe_type &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $at,
      /* HH_FIXME[4110] use `as` */ $left_brace,
      /* HH_FIXME[4110] use `as` */ $type,
      /* HH_FIXME[4110] use `as` */ $unsafe_plus,
      /* HH_FIXME[4110] use `as` */ $unsafe_type,
      /* HH_FIXME[4110] use `as` */ $right_brace,
    );
  }

  public function getAtUNTYPED(): ?Node {
    return $this->_at;
  }

  public function withAt(?Node $value): this {
    if ($value === $this->_at) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_brace,
      $this->_type,
      $this->_unsafe_plus,
      $this->_unsafe_type,
      $this->_right_brace,
    );
  }

  public function hasAt(): bool {
    return $this->_at !== null;
  }

  /**
   * @return unknown
   */
  public function getAt(): ?Node {
    return $this->_at;
  }

  /**
   * @return unknown
   */
  public function getAtx(): Node {
    return TypeAssert\not_null($this->getAt());
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(?Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static(
      $this->_at,
      $value,
      $this->_type,
      $this->_unsafe_plus,
      $this->_unsafe_type,
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

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_at,
      $this->_left_brace,
      $value,
      $this->_unsafe_plus,
      $this->_unsafe_type,
      $this->_right_brace,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return unknown
   */
  public function getType(): ?Node {
    return $this->_type;
  }

  /**
   * @return unknown
   */
  public function getTypex(): Node {
    return TypeAssert\not_null($this->getType());
  }

  public function getUnsafePlusUNTYPED(): ?Node {
    return $this->_unsafe_plus;
  }

  public function withUnsafePlus(?Node $value): this {
    if ($value === $this->_unsafe_plus) {
      return $this;
    }
    return new static(
      $this->_at,
      $this->_left_brace,
      $this->_type,
      $value,
      $this->_unsafe_type,
      $this->_right_brace,
    );
  }

  public function hasUnsafePlus(): bool {
    return $this->_unsafe_plus !== null;
  }

  /**
   * @return unknown
   */
  public function getUnsafePlus(): ?Node {
    return $this->_unsafe_plus;
  }

  /**
   * @return unknown
   */
  public function getUnsafePlusx(): Node {
    return TypeAssert\not_null($this->getUnsafePlus());
  }

  public function getUnsafeTypeUNTYPED(): ?Node {
    return $this->_unsafe_type;
  }

  public function withUnsafeType(?Node $value): this {
    if ($value === $this->_unsafe_type) {
      return $this;
    }
    return new static(
      $this->_at,
      $this->_left_brace,
      $this->_type,
      $this->_unsafe_plus,
      $value,
      $this->_right_brace,
    );
  }

  public function hasUnsafeType(): bool {
    return $this->_unsafe_type !== null;
  }

  /**
   * @return unknown
   */
  public function getUnsafeType(): ?Node {
    return $this->_unsafe_type;
  }

  /**
   * @return unknown
   */
  public function getUnsafeTypex(): Node {
    return TypeAssert\not_null($this->getUnsafeType());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(?Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static(
      $this->_at,
      $this->_left_brace,
      $this->_type,
      $this->_unsafe_plus,
      $this->_unsafe_type,
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
