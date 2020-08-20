/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d614f4c599c70c2d0050438193714d5c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class InclusionDirective extends Node implements IStatement {

  const string SYNTAX_KIND = 'inclusion_directive';

  private Node $_expression;
  private Node $_semicolon;

  public function __construct(
    Node $expression,
    Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
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
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['inclusion_expression'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $expression = $expression as nonnull;
    $offset += $expression->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['inclusion_semicolon'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $expression,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'expression' => $this->_expression,
      'semicolon' => $this->_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $expression = $rewriter($this->_expression, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $expression === $this->_expression && $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $expression,
      /* HH_FIXME[4110] use `as` */ $semicolon,
    );
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($value, $this->_semicolon);
  }

  public function hasExpression(): bool {
    return $this->_expression !== null;
  }

  /**
   * @return
   */
  public function getExpression(): Node {
    return $this->_expression;
  }

  /**
   * @return
   */
  public function getExpressionx(): Node {
    return $this->getExpression();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_expression, $value);
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
  }

  /**
   * @return
   */
  public function getSemicolon(): Node {
    return $this->_semicolon;
  }

  /**
   * @return
   */
  public function getSemicolonx(): Node {
    return $this->getSemicolon();
  }
}
