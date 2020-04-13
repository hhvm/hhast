/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b7d2d83c8348c39fe711554070362be0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class InclusionDirective extends Node
  implements
    IStatement {

  const string SYNTAX_KIND = 'inclusion_directive';

  private InclusionExpression $_expression;
  private SemicolonToken $_semicolon;

  public function __construct(
    InclusionExpression $expression,
    SemicolonToken $semicolon,
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
      'InclusionExpression',
    );
    $expression = $expression as nonnull;
    $offset += $expression->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['inclusion_semicolon'],
      $file,
      $offset,
      $source,
      'SemicolonToken',
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
    ] |> Dict\filter_nulls($$);
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
      $expression === $this->_expression &&
      $semicolon === $this->_semicolon
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

  public function withExpression(InclusionExpression $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($value, $this->_semicolon);
  }

  public function hasExpression(): bool {
    return $this->_expression !== null;
  }

  /**
   * @return InclusionExpression
   */
  public function getExpression(): InclusionExpression {
    return TypeAssert\instance_of(InclusionExpression::class, $this->_expression);
  }

  /**
   * @return InclusionExpression
   */
  public function getExpressionx(): InclusionExpression {
    return $this->getExpression();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_expression, $value);
  }

  public function hasSemicolon(): bool {
    return $this->_semicolon !== null;
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
