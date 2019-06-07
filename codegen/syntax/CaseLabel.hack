/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<729f95cc40736b197663eb12e737393c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class CaseLabel extends Node implements ISwitchLabel {

  const string SYNTAX_KIND = 'case_label';

  private Node $_keyword;
  private Node $_expression;
  private Node $_colon;

  public function __construct(
    Node $keyword,
    Node $expression,
    Node $colon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_expression = $expression;
    $this->_colon = $colon;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['case_keyword'],
      $file,
      $offset,
      $source,
      'CaseToken',
    );
    $offset += $keyword->getWidth();
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['case_expression'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $expression->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['case_colon'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $offset += $colon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($keyword, $expression, $colon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'expression' => $this->_expression,
      'colon' => $this->_colon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
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
    return new static($keyword, $expression, $colon);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_expression, $this->_colon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
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

  public function getExpressionUNTYPED(): Node {
    return $this->_expression;
  }

  public function withExpression(Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_colon);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @return ArrayIntrinsicExpression | BinaryExpression |
   * FunctionCallExpression | InstanceofExpression | LiteralExpression |
   * PrefixUnaryExpression | ScopeResolutionExpression | NameToken |
   * VariableExpression
   */
  public function getExpression(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_expression);
  }

  /**
   * @return ArrayIntrinsicExpression | BinaryExpression |
   * FunctionCallExpression | InstanceofExpression | LiteralExpression |
   * PrefixUnaryExpression | ScopeResolutionExpression | NameToken |
   * VariableExpression
   */
  public function getExpressionx(): IExpression {
    return $this->getExpression();
  }

  public function getColonUNTYPED(): Node {
    return $this->_colon;
  }

  public function withColon(Node $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static($this->_keyword, $this->_expression, $value);
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @return ColonToken | SemicolonToken
   */
  public function getColon(): Token {
    return TypeAssert\instance_of(Token::class, $this->_colon);
  }

  /**
   * @return ColonToken | SemicolonToken
   */
  public function getColonx(): Token {
    return $this->getColon();
  }
}
