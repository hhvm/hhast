<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7f32c6ba7b4ac26107447a84ac1a3c4b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class YieldExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_operand;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $operand,
  ) {
    parent::__construct('yield_expression');
    $this->_keyword = $keyword;
    $this->_operand = $operand;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['yield_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $operand = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['yield_operand'],
      $position,
      $source,
    );
    $position += $operand->getWidth();
    return new self($keyword, $operand);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'operand' => $this->_operand;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $operand = $this->_operand->rewrite($rewriter, $parents);
    if ($keyword === $this->_keyword && $operand === $this->_operand) {
      return $this;
    }
    return new self($keyword, $operand);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_operand);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns YieldToken
   */
  public function getKeyword(): YieldToken {
    return TypeAssert\instance_of(YieldToken::class, $this->_keyword);
  }

  public function getOperandUNTYPED(): EditableSyntax {
    return $this->_operand;
  }

  public function withOperand(EditableSyntax $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }

  public function hasOperand(): bool {
    return !$this->_operand->isMissing();
  }

  /**
   * @returns LiteralExpression | VariableExpression |
   * MemberSelectionExpression | FunctionCallExpression | BinaryExpression |
   * ElementInitializer | PrefixUnaryExpression | PostfixUnaryExpression |
   * ParenthesizedExpression | Missing | LambdaExpression |
   * QualifiedNameExpression | SubscriptExpression | BreakToken |
   * ObjectCreationExpression | AnonymousFunction | TupleExpression
   */
  public function getOperand(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_operand);
  }
}
