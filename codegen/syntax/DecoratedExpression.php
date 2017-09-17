<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<bc0449c8e61fa868b8959c19344926a1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class DecoratedExpression extends EditableSyntax {

  private EditableSyntax $_decorator;
  private EditableSyntax $_expression;

  public function __construct(
    EditableSyntax $decorator,
    EditableSyntax $expression,
  ) {
    parent::__construct('decorated_expression');
    $this->_decorator = $decorator;
    $this->_expression = $expression;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $decorator = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['decorated_expression_decorator'],
      $position,
      $source,
    );
    $position += $decorator->getWidth();
    $expression = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['decorated_expression_expression'],
      $position,
      $source,
    );
    $position += $expression->getWidth();
    return new self($decorator, $expression);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'decorator' => $this->_decorator;
    yield 'expression' => $this->_expression;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $decorator = $this->_decorator->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    if (
      $decorator === $this->_decorator && $expression === $this->_expression
    ) {
      return $this;
    }
    return new self($decorator, $expression);
  }

  public function getDecoratorUNTYPED(): EditableSyntax {
    return $this->_decorator;
  }

  public function withDecorator(EditableSyntax $value): this {
    if ($value === $this->_decorator) {
      return $this;
    }
    return new self($value, $this->_expression);
  }

  public function hasDecorator(): bool {
    return !$this->_decorator->isMissing();
  }

  /**
   * @returns AmpersandToken | DotDotDotToken
   */
  public function getDecorator(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_decorator);
  }

  public function getExpressionUNTYPED(): EditableSyntax {
    return $this->_expression;
  }

  public function withExpression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($this->_decorator, $value);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @returns VariableToken | VariableExpression | ArrayCreationExpression |
   * DecoratedExpression | Missing | FunctionCallExpression
   */
  public function getExpression(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_expression);
  }
}
