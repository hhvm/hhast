/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b0a4c8639f71de5fc8329cb8744910b2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class CaseLabel extends Node implements ISwitchLabel {

  const string SYNTAX_KIND = 'case_label';

  private CaseToken $_keyword;
  private IExpression $_expression;
  private ColonToken $_colon;

  public function __construct(
    CaseToken $keyword,
    IExpression $expression,
    ColonToken $colon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_expression = $expression;
    $this->_colon = $colon;
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
    $keyword = Node::fromJSON(
      ($json['case_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'CaseToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $expression = Node::fromJSON(
      ($json['case_expression']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $expression = $expression as nonnull;
    $offset += $expression->getWidth();
    $colon = Node::fromJSON(
      ($json['case_colon']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $expression,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'expression' => $this->_expression,
      'colon' => $this->_colon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $expression = $rewriter($this->_expression, $parents);
    $colon = $rewriter($this->_colon, $parents);
    if (
      $keyword === $this->_keyword &&
      $expression === $this->_expression &&
      $colon === $this->_colon
    ) {
      return $this;
    }
    return new static(
      $keyword as CaseToken,
      $expression as IExpression,
      $colon as ColonToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(CaseToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_expression, $this->_colon);
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return CaseToken
   */
  public function getKeyword(): CaseToken {
    return TypeAssert\instance_of(CaseToken::class, $this->_keyword);
  }

  /**
   * @return CaseToken
   */
  public function getKeywordx(): CaseToken {
    return $this->getKeyword();
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(IExpression $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_colon);
  }

  public function hasExpression(): bool {
    return true;
  }

  /**
   * @return CastExpression | CollectionLiteralExpression |
   * FunctionCallExpression | LiteralExpression | ObjectCreationExpression |
   * PrefixUnaryExpression | ScopeResolutionExpression | NameToken |
   * VariableExpression | VectorIntrinsicExpression
   */
  public function getExpression(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_expression);
  }

  /**
   * @return CastExpression | CollectionLiteralExpression |
   * FunctionCallExpression | LiteralExpression | ObjectCreationExpression |
   * PrefixUnaryExpression | ScopeResolutionExpression | NameToken |
   * VariableExpression | VectorIntrinsicExpression
   */
  public function getExpressionx(): IExpression {
    return $this->getExpression();
  }

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static($this->_keyword, $this->_expression, $value);
  }

  public function hasColon(): bool {
    return true;
  }

  /**
   * @return ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return $this->getColon();
  }
}
