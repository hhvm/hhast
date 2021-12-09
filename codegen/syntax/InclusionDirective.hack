/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e0777e108bd0b42b18b984a5cec53926>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $expression = Node::fromJSON(
      ($json['inclusion_expression']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $expression = $expression as nonnull;
    $offset += $expression->getWidth();
    $semicolon = Node::fromJSON(
      ($json['inclusion_semicolon']) as dict<_, _>,
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
    return new static($expression as Node, $semicolon as Node);
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
    return true;
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
    return true;
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
