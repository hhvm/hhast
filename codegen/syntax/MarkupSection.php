<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e04c0bf8e21ef39b0c4eb2b68a249f85>>
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

  public function getPrefixUNTYPED(): EditableSyntax {
    return $this->_prefix;
  }

  public function with_prefix(EditableSyntax $value): this {
    if ($value === $this->_prefix) {
      return $this;
    }
    return new self($value, $this->_text, $this->_suffix, $this->_expression);
  }

  public function hasPrefix(): bool {
    return !$this->_prefix->is_missing();
  }

  public function getPrefix(): ?QuestionGreaterThanToken {
    if ($this->_prefix->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(QuestionGreaterThanToken::class, $this->_prefix);
  }

  public function getPrefixx(): QuestionGreaterThanToken {
    return TypeAssert::isInstanceOf(QuestionGreaterThanToken::class, $this->_prefix);
  }

  public function getTextUNTYPED(): EditableSyntax {
    return $this->_text;
  }

  public function with_text(EditableSyntax $value): this {
    if ($value === $this->_text) {
      return $this;
    }
    return new self($this->_prefix, $value, $this->_suffix, $this->_expression);
  }

  public function hasText(): bool {
    return !$this->_text->is_missing();
  }

  public function getText(): ?MarkupToken {
    if ($this->_text->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(MarkupToken::class, $this->_text);
  }

  public function getTextx(): MarkupToken {
    return TypeAssert::isInstanceOf(MarkupToken::class, $this->_text);
  }

  public function getSuffixUNTYPED(): EditableSyntax {
    return $this->_suffix;
  }

  public function with_suffix(EditableSyntax $value): this {
    if ($value === $this->_suffix) {
      return $this;
    }
    return new self($this->_prefix, $this->_text, $value, $this->_expression);
  }

  public function hasSuffix(): bool {
    return !$this->_suffix->is_missing();
  }

  public function getSuffix(): ?MarkupSuffix {
    if ($this->_suffix->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(MarkupSuffix::class, $this->_suffix);
  }

  public function getSuffixx(): MarkupSuffix {
    return TypeAssert::isInstanceOf(MarkupSuffix::class, $this->_suffix);
  }

  public function getExpressionUNTYPED(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($this->_prefix, $this->_text, $this->_suffix, $value);
  }

  public function hasExpression(): bool {
    return !$this->_expression->is_missing();
  }

  public function getExpression(): ?ExpressionStatement {
    if ($this->_expression->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(ExpressionStatement::class, $this->_expression);
  }

  public function getExpressionx(): ExpressionStatement {
    return TypeAssert::isInstanceOf(ExpressionStatement::class, $this->_expression);
  }
}
