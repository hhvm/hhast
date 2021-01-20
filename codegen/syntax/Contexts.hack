/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f56a27015a55068131c8b15a8d09a53a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class Contexts extends Node {

  const string SYNTAX_KIND = 'contexts';

  private ?Node $_left_bracket;
  private ?Node $_types;
  private ?Node $_right_bracket;

  public function __construct(
    ?Node $left_bracket,
    ?Node $types,
    ?Node $right_bracket,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_bracket = $left_bracket;
    $this->_types = $types;
    $this->_right_bracket = $right_bracket;
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
    $left_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['contexts_left_bracket'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_bracket?->getWidth() ?? 0;
    $types = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['contexts_types'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $types?->getWidth() ?? 0;
    $right_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['contexts_right_bracket'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $right_bracket?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_bracket,
      /* HH_IGNORE_ERROR[4110] */ $types,
      /* HH_IGNORE_ERROR[4110] */ $right_bracket,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_bracket' => $this->_left_bracket,
      'types' => $this->_types,
      'right_bracket' => $this->_right_bracket,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_bracket = $this->_left_bracket === null
      ? null
      : $rewriter($this->_left_bracket, $parents);
    $types = $this->_types === null ? null : $rewriter($this->_types, $parents);
    $right_bracket = $this->_right_bracket === null
      ? null
      : $rewriter($this->_right_bracket, $parents);
    if (
      $left_bracket === $this->_left_bracket &&
      $types === $this->_types &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $left_bracket,
      /* HH_FIXME[4110] use `as` */ $types,
      /* HH_FIXME[4110] use `as` */ $right_bracket,
    );
  }

  public function getLeftBracketUNTYPED(): ?Node {
    return $this->_left_bracket;
  }

  public function withLeftBracket(?Node $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new static($value, $this->_types, $this->_right_bracket);
  }

  public function hasLeftBracket(): bool {
    return $this->_left_bracket !== null;
  }

  /**
   * @return unknown
   */
  public function getLeftBracket(): ?Node {
    return $this->_left_bracket;
  }

  /**
   * @return unknown
   */
  public function getLeftBracketx(): Node {
    return TypeAssert\not_null($this->getLeftBracket());
  }

  public function getTypesUNTYPED(): ?Node {
    return $this->_types;
  }

  public function withTypes(?Node $value): this {
    if ($value === $this->_types) {
      return $this;
    }
    return new static($this->_left_bracket, $value, $this->_right_bracket);
  }

  public function hasTypes(): bool {
    return $this->_types !== null;
  }

  /**
   * @return unknown
   */
  public function getTypes(): ?Node {
    return $this->_types;
  }

  /**
   * @return unknown
   */
  public function getTypesx(): Node {
    return TypeAssert\not_null($this->getTypes());
  }

  public function getRightBracketUNTYPED(): ?Node {
    return $this->_right_bracket;
  }

  public function withRightBracket(?Node $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return new static($this->_left_bracket, $this->_types, $value);
  }

  public function hasRightBracket(): bool {
    return $this->_right_bracket !== null;
  }

  /**
   * @return unknown
   */
  public function getRightBracket(): ?Node {
    return $this->_right_bracket;
  }

  /**
   * @return unknown
   */
  public function getRightBracketx(): Node {
    return TypeAssert\not_null($this->getRightBracket());
  }
}
