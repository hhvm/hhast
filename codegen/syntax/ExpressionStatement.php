<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b60a13a06e099509847c642742e0f32f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ExpressionStatement extends EditableSyntax {

  private EditableSyntax $_expression;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $expression,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('expression_statement');
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['expression_statement_expression'],
      $position,
      $source,
    );
    $position += $expression->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['expression_statement_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($expression, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
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
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $expression === $this->_expression && $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($expression, $semicolon);
  }

  public function getExpressionUNTYPED(): EditableSyntax {
    return $this->_expression;
  }

  public function withExpression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($value, $this->_semicolon);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @returns BinaryExpression | FunctionCallExpression | PrefixUnaryExpression
   * | YieldExpression | PostfixUnaryExpression | Missing |
   * ObjectCreationExpression | InclusionExpression | DefineExpression |
   * SubscriptExpression | VariableExpression | ScopeResolutionExpression |
   * IssetExpression | EmptyExpression | EvalExpression |
   * QualifiedNameExpression | RightBraceToken | ParenthesizedExpression |
   * LiteralExpression | MemberSelectionExpression | XHPExpression |
   * CollectionLiteralExpression | AnonymousFunction | LambdaExpression |
   * ColonToken | CommaToken | RightParenToken | EqualGreaterThanToken |
   * ConditionalExpression | SafeMemberSelectionExpression | TupleExpression |
   * RightBracketToken | ArrayIntrinsicExpression | EqualEqualEqualToken |
   * SlashToken | DarrayIntrinsicExpression | VarrayIntrinsicExpression |
   * DotDotDotToken
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
    return new self($this->_expression, $value);
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
