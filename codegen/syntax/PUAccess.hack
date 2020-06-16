/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<40514c292bd82c796d76f11b87d0b581>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PUAccess extends Node {

  const string SYNTAX_KIND = 'pu_access';

  private ?Node $_left_type;
  private ?Node $_separator;
  private ?Node $_right_type;

  public function __construct(
    ?Node $left_type,
    ?Node $separator,
    ?Node $right_type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_type = $left_type;
    $this->_separator = $separator;
    $this->_right_type = $right_type;
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
    $left_type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pu_access_left_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_type?->getWidth() ?? 0;
    $separator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pu_access_separator'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $separator?->getWidth() ?? 0;
    $right_type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pu_access_right_type'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_type?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_type,
      /* HH_IGNORE_ERROR[4110] */ $separator,
      /* HH_IGNORE_ERROR[4110] */ $right_type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_type' => $this->_left_type,
      'separator' => $this->_separator,
      'right_type' => $this->_right_type,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_type = $this->_left_type === null
      ? null
      : $rewriter($this->_left_type, $parents);
    $separator = $this->_separator === null
      ? null
      : $rewriter($this->_separator, $parents);
    $right_type = $this->_right_type === null
      ? null
      : $rewriter($this->_right_type, $parents);
    if (
      $left_type === $this->_left_type &&
      $separator === $this->_separator &&
      $right_type === $this->_right_type
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $left_type,
      /* HH_FIXME[4110] use `as` */ $separator,
      /* HH_FIXME[4110] use `as` */ $right_type,
    );
  }

  public function getLeftTypeUNTYPED(): ?Node {
    return $this->_left_type;
  }

  public function withLeftType(?Node $value): this {
    if ($value === $this->_left_type) {
      return $this;
    }
    return new static($value, $this->_separator, $this->_right_type);
  }

  public function hasLeftType(): bool {
    return $this->_left_type !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftType(): ?Node {
    return $this->_left_type;
  }

  /**
   * @return unknown
   */
  public function getLeftTypex(): Node {
    return TypeAssert\not_null($this->getLeftType());
  }

  public function getSeparatorUNTYPED(): ?Node {
    return $this->_separator;
  }

  public function withSeparator(?Node $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new static($this->_left_type, $value, $this->_right_type);
  }

  public function hasSeparator(): bool {
    return $this->_separator !== null;
  }

  /**
   * @return unknown
   */
  public function getSeparator(): ?Node {
    return $this->_separator;
  }

  /**
   * @return unknown
   */
  public function getSeparatorx(): Node {
    return TypeAssert\not_null($this->getSeparator());
  }

  public function getRightTypeUNTYPED(): ?Node {
    return $this->_right_type;
  }

  public function withRightType(?Node $value): this {
    if ($value === $this->_right_type) {
      return $this;
    }
    return new static($this->_left_type, $this->_separator, $value);
  }

  public function hasRightType(): bool {
    return $this->_right_type !== null;
  }

  /**
   * @return unknown
   */
  public function getRightType(): ?Node {
    return $this->_right_type;
  }

  /**
   * @return unknown
   */
  public function getRightTypex(): Node {
    return TypeAssert\not_null($this->getRightType());
  }
}
