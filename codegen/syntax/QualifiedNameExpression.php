<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1a8f9ad2437f746fa87279002cc561a8>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class QualifiedNameExpression extends EditableSyntax {

  private EditableSyntax $_expression;

  public function __construct(EditableSyntax $expression) {
    parent::__construct('qualified_name_expression');
    $this->_expression = $expression;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['qualified_name_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($expression);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'expression' => $this->_expression;
  }

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

  public function raw_expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($value);
  }

  public function expression(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_expression);
  }
}
