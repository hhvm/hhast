<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<817ad3557680a51e1b7e34ec87849c84>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class MarkupSection extends EditableSyntax {

  private EditableSyntax $_prefix;
  private EditableSyntax $_text;
  private EditableSyntax $_suffix;
  private EditableSyntax $_expression;

  public function __construct(
    EditableSyntax $prefix,
    EditableSyntax $text,
    EditableSyntax $suffix,
    EditableSyntax $expression,
  ) {
    parent::__construct('markup_section');
    $this->_prefix = $prefix;
    $this->_text = $text;
    $this->_suffix = $suffix;
    $this->_expression = $expression;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $prefix = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_prefix'],
      $position,
      $source,
    );
    $position += $prefix->width();
    $text = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_text'],
      $position,
      $source,
    );
    $position += $text->width();
    $suffix = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_suffix'],
      $position,
      $source,
    );
    $position += $suffix->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['markup_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($prefix, $text, $suffix, $expression);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'prefix' => $this->_prefix;
    yield 'text' => $this->_text;
    yield 'suffix' => $this->_suffix;
    yield 'expression' => $this->_expression;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $prefix = $this->_prefix->rewrite($rewriter, $parents);
    $text = $this->_text->rewrite($rewriter, $parents);
    $suffix = $this->_suffix->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    if (
      $prefix === $this->_prefix &&
      $text === $this->_text &&
      $suffix === $this->_suffix &&
      $expression === $this->_expression
    ) {
      return $this;
    }
    return new self($prefix, $text, $suffix, $expression);
  }

  public function raw_prefix(): EditableSyntax {
    return $this->_prefix;
  }

  public function with_prefix(EditableSyntax $value): this {
    if ($value === $this->_prefix) {
      return $this;
    }
    return new self($value, $this->_text, $this->_suffix, $this->_expression);
  }

  public function prefix(): ?QuestionGreaterThanToken {
    if ($this->_prefix->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(QuestionGreaterThanToken::class, $this->_prefix);
  }

  public function prefixx(): QuestionGreaterThanToken {
    return TypeAssert::isInstanceOf(QuestionGreaterThanToken::class, $this->_prefix);
  }

  public function raw_text(): EditableSyntax {
    return $this->_text;
  }

  public function with_text(EditableSyntax $value): this {
    if ($value === $this->_text) {
      return $this;
    }
    return new self($this->_prefix, $value, $this->_suffix, $this->_expression);
  }

  public function text(): ?MarkupToken {
    if ($this->_text->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(MarkupToken::class, $this->_text);
  }

  public function textx(): MarkupToken {
    return TypeAssert::isInstanceOf(MarkupToken::class, $this->_text);
  }

  public function raw_suffix(): EditableSyntax {
    return $this->_suffix;
  }

  public function with_suffix(EditableSyntax $value): this {
    if ($value === $this->_suffix) {
      return $this;
    }
    return new self($this->_prefix, $this->_text, $value, $this->_expression);
  }

  public function suffix(): ?MarkupSuffix {
    if ($this->_suffix->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(MarkupSuffix::class, $this->_suffix);
  }

  public function suffixx(): MarkupSuffix {
    return TypeAssert::isInstanceOf(MarkupSuffix::class, $this->_suffix);
  }

  public function raw_expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($this->_prefix, $this->_text, $this->_suffix, $value);
  }

  public function expression(): ?ExpressionStatement {
    if ($this->_expression->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(ExpressionStatement::class, $this->_expression);
  }

  public function expressionx(): ExpressionStatement {
    return TypeAssert::isInstanceOf(ExpressionStatement::class, $this->_expression);
  }
}
