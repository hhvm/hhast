<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8a7d64e67c686dc9dc282b145d1e5f02>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ExpressionStatement extends EditableNode {

  private EditableNode $_expression;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $expression,
    EditableNode $semicolon,
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
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['expression_statement_expression'],
      $position,
      $source,
    );
    $position += $expression->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['expression_statement_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($expression, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'expression' => $this->_expression,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
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
  public function getExpression(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
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
