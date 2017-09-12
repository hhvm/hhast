<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<152ab5ad0e144b373ed331aa1adc2786>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class QualifiedNameExpression extends EditableSyntax {

  private EditableSyntax $_expression;

  public function __construct(EditableSyntax $expression) {
    parent::__construct('qualified_name_expression');
    $this->_expression = $expression;
  }

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['qualified_name_expression'],
      $position,
      $source,
    );
    $position += $expression->getWidth();
    return new self($expression);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
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
    return !$this->_expression->isMissing();
  }

  public function getExpression(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_expression);
  }
}
