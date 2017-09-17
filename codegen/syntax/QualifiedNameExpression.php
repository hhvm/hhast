<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<07d35ad1d1e451db1084314acf3a68f3>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class QualifiedNameExpression extends EditableSyntax {

  private EditableSyntax $_expression;

  public function __construct(EditableSyntax $expression) {
    parent::__construct('qualified_name_expression');
    $this->_expression = $expression;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $parents);
    if ($expression === $this->_expression) {
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

  /**
   * @returns unknown
   */
  public function getExpression(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_expression);
  }
}
