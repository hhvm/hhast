<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7b3e714ce243e77d2a300c01a26c9813>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class InclusionDirective extends EditableSyntax {

  private EditableSyntax $_expression;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $expression,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('inclusion_directive');
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['inclusion_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['inclusion_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($expression, $semicolon);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'expression' => $this->_expression;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $expression === $this->_expression &&
      $semicolon === $this->_semicolon
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
    return !$this->_expression->is_missing();
  }

  public function getExpression(): InclusionExpression {
    return TypeAssert::isInstanceOf(InclusionExpression::class, $this->_expression);
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
    return !$this->_semicolon->is_missing();
  }

  public function getSemicolon(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
