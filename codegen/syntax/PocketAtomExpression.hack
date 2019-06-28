/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0a1296976532f556d78b6027cdc5273c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketAtomExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'pocket_atom_expression';

  private Node $_glyph;
  private Node $_expression;

  public function __construct(
    Node $glyph,
    Node $expression,
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
      /* HH_FIXME[4110] */ $json['pocket_atom_glyph'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $glyph->getWidth();
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['pocket_atom_expression'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $expression->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($glyph, $expression, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'glyph' => $this->_glyph,
      'expression' => $this->_expression,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $glyph = $rewriter($this->_glyph, $parents);
    $expression = $rewriter($this->_expression, $parents);
    if ($glyph === $this->_glyph && $expression === $this->_expression) {
      return $this;
    }
    return new static($glyph, $expression);
  }

  public function getGlyphUNTYPED(): Node {
    return $this->_glyph;
  }

  public function withGlyph(Node $value): this {
    if ($value === $this->_glyph) {
      return $this;
    }
    return new static($value ?? Missing(), $this->_expression);
  }

  public function hasGlyph(): bool {
    return !$this->_glyph->isMissing();
  }

  /**
   * @return unknown
   */
  public function getGlyph(): Node {
    return $this->_glyph;
  }

  /**
   * @return unknown
   */
  public function getGlyphx(): Node {
    return $this->getGlyph();
  }

  public function getExpressionUNTYPED(): Node {
    return $this->_expression;
  }

  public function withExpression(Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_glyph, $value ?? Missing());
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @return unknown
   */
  public function getExpression(): Node {
    return $this->_expression;
  }

  /**
   * @return unknown
   */
  public function getExpressionx(): Node {
    return $this->getExpression();
  }
}
