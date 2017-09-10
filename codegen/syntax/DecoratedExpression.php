<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2f26951305c64ab60dbbc7bca7f9dbc3>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $decorator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['decorated_expression_decorator'],
      $position,
      $source,
    );
    $position += $decorator->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['decorated_expression_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($decorator, $expression);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'decorator' => $this->_decorator;
    yield 'expression' => $this->_expression;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $decorator = $this->_decorator->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    if (
      $decorator === $this->_decorator && $expression === $this->_expression
    ) {
      $node = $this;
    } else {
      $node = new self($decorator, $expression);
    }
    return $rewriter($node, $parents);
  }

  public function decorator(): EditableSyntax {
    return $this->decoratorx();
  }

  public function decoratorx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_decorator);
  }

  public function raw_decorator(): EditableSyntax {
    return $this->_decorator;
  }

  public function with_decorator(EditableSyntax $value): this {
    return new self($value, $this->_expression);
  }

  public function expression(): EditableSyntax {
    return $this->expressionx();
  }

  public function expressionx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_expression);
  }

  public function raw_expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_decorator, $value);
  }
}
