<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0d6b7124e69a328833d7d64b48d1f109>>
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

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $prefix = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_prefix'],
      $position,
      $source,
    );
    $position += $prefix->getWidth();
    $text = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_text'],
      $position,
      $source,
    );
    $position += $text->getWidth();
    $suffix = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_suffix'],
      $position,
      $source,
    );
    $position += $suffix->getWidth();
    $expression = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_expression'],
      $position,
      $source,
    );
    $position += $expression->getWidth();
    return new self($prefix, $text, $suffix, $expression);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'prefix' => $this->_prefix;
    yield 'text' => $this->_text;
    yield 'suffix' => $this->_suffix;
    yield 'expression' => $this->_expression;
  }

  <<__Override>>
  public function rewriteDescendants(
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

  public function withPrefix(EditableSyntax $value): this {
    if ($value === $this->_prefix) {
      return $this;
    }
    return new self($value, $this->_text, $this->_suffix, $this->_expression);
  }

  public function hasPrefix(): bool {
    return !$this->_prefix->isMissing();
  }

  /**
   * @returns Missing | QuestionGreaterThanToken
   */
  public function getPrefix(): ?QuestionGreaterThanToken {
    if ($this->_prefix->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(QuestionGreaterThanToken::class, $this->_prefix);
  }

  /**
   * @returns QuestionGreaterThanToken
   */
  public function getPrefixx(): QuestionGreaterThanToken {
    return TypeAssert::isInstanceOf(QuestionGreaterThanToken::class, $this->_prefix);
  }

  public function getTextUNTYPED(): EditableSyntax {
    return $this->_text;
  }

  public function withText(EditableSyntax $value): this {
    if ($value === $this->_text) {
      return $this;
    }
    return new self($this->_prefix, $value, $this->_suffix, $this->_expression);
  }

  public function hasText(): bool {
    return !$this->_text->isMissing();
  }

  /**
   * @returns MarkupToken | Missing
   */
  public function getText(): ?MarkupToken {
    if ($this->_text->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(MarkupToken::class, $this->_text);
  }

  /**
   * @returns MarkupToken
   */
  public function getTextx(): MarkupToken {
    return TypeAssert::isInstanceOf(MarkupToken::class, $this->_text);
  }

  public function getSuffixUNTYPED(): EditableSyntax {
    return $this->_suffix;
  }

  public function withSuffix(EditableSyntax $value): this {
    if ($value === $this->_suffix) {
      return $this;
    }
    return new self($this->_prefix, $this->_text, $value, $this->_expression);
  }

  public function hasSuffix(): bool {
    return !$this->_suffix->isMissing();
  }

  /**
   * @returns MarkupSuffix | Missing
   */
  public function getSuffix(): ?MarkupSuffix {
    if ($this->_suffix->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(MarkupSuffix::class, $this->_suffix);
  }

  /**
   * @returns MarkupSuffix
   */
  public function getSuffixx(): MarkupSuffix {
    return TypeAssert::isInstanceOf(MarkupSuffix::class, $this->_suffix);
  }

  public function getExpressionUNTYPED(): EditableSyntax {
    return $this->_expression;
  }

  public function withExpression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($this->_prefix, $this->_text, $this->_suffix, $value);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @returns Missing | ExpressionStatement
   */
  public function getExpression(): ?ExpressionStatement {
    if ($this->_expression->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(ExpressionStatement::class, $this->_expression);
  }

  /**
   * @returns ExpressionStatement
   */
  public function getExpressionx(): ExpressionStatement {
    return TypeAssert::isInstanceOf(ExpressionStatement::class, $this->_expression);
  }
}
