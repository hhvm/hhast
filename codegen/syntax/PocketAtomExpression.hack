/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f7e83c65b5e15766166d74b0e112ab37>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PocketAtomExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'pocket_atom_expression';

  private ?Node $_glyph;
  private ?Node $_expression;

  public function __construct(
    ?Node $glyph,
    ?Node $expression,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_glyph = $glyph;
    $this->_expression = $expression;
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
    $glyph = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_glyph'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $glyph?->getWidth() ?? 0;
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_expression'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $expression?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $glyph,
      /* HH_IGNORE_ERROR[4110] */ $expression,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'glyph' => $this->_glyph,
      'expression' => $this->_expression,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $glyph = $this->_glyph === null ? null : $rewriter($this->_glyph, $parents);
    $expression = $this->_expression === null
      ? null
      : $rewriter($this->_expression, $parents);
    if ($glyph === $this->_glyph && $expression === $this->_expression) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $glyph,
      /* HH_FIXME[4110] use `as` */ $expression,
    );
  }

  public function getGlyphUNTYPED(): ?Node {
    return $this->_glyph;
  }

  public function withGlyph(?Node $value): this {
    if ($value === $this->_glyph) {
      return $this;
    }
    return new static($value, $this->_expression);
  }

  public function hasGlyph(): bool {
    return $this->_glyph !== null;
  }

  /**
   * @return unknown
   */
  public function getGlyph(): ?Node {
    return $this->_glyph;
  }

  /**
   * @return unknown
   */
  public function getGlyphx(): Node {
    return TypeAssert\not_null($this->getGlyph());
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(?Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_glyph, $value);
  }

  public function hasExpression(): bool {
    return $this->_expression !== null;
  }

  /**
   * @return unknown
   */
  public function getExpression(): ?Node {
    return $this->_expression;
  }

  /**
   * @return unknown
   */
  public function getExpressionx(): Node {
    return TypeAssert\not_null($this->getExpression());
  }
}
