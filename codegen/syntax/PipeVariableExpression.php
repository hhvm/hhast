<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d19bee80938c1b33a7aefc38bd313811>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class PipeVariableExpression extends EditableSyntax {

  private EditableSyntax $_expression;

  public function __construct(EditableSyntax $expression) {
    parent::__construct('pipe_variable_expression');
    $this->_expression = $expression;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['pipe_variable_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($expression);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'expression' => $this->_expression;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $parents);
    if (
      $expression === $this->_expression
    ) {
      return $this;
    }
    return new self($expression);
  }

  public function getExpressionUNTYPED(): EditableSyntax {
    return $this->_expression;
  }

  public function withExpression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($value);
  }

  public function hasExpression(): bool {
    return !$this->_expression->is_missing();
  }

  public function getExpression(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_expression);
  }
}
