<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7ede35c36ceca20b569659d3f3db903c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ReturnStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_expression;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $expression,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('return_statement');
    $this->_keyword = $keyword;
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['return_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $expression = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['return_expression'],
      $position,
      $source,
    );
    $position += $expression->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['return_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($keyword, $expression, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'expression' => $this->_expression;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $expression === $this->_expression &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $expression, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_expression, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns ReturnToken
   */
  public function getKeyword(): ReturnToken {
    return TypeAssert\instance_of(ReturnToken::class, $this->_keyword);
  }

  public function getExpressionUNTYPED(): EditableSyntax {
    return $this->_expression;
  }

  public function withExpression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @returns LiteralExpression | ArrayIntrinsicExpression |
   * FunctionCallExpression | ObjectCreationExpression | VariableExpression |
   * MemberSelectionExpression | ConditionalExpression | IssetExpression |
   * BinaryExpression | SubscriptExpression | AnonymousFunction |
   * CastExpression | QualifiedNameExpression | ArrayCreationExpression |
   * DictionaryIntrinsicExpression | ScopeResolutionExpression |
   * PrefixUnaryExpression | ParenthesizedExpression | PostfixUnaryExpression |
   * VectorIntrinsicExpression | InstanceofExpression |
   * KeysetIntrinsicExpression | LambdaExpression | Missing | ShapeExpression |
   * TupleExpression | CollectionLiteralExpression |
   * SafeMemberSelectionExpression | YieldExpression | EvalExpression |
   * DarrayIntrinsicExpression | VarrayIntrinsicExpression |
   * AwaitableCreationExpression | XHPExpression
   */
  public function getExpression(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_expression);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_expression, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken | Missing
   */
  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
