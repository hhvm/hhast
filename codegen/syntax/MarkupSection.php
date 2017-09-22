<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<dfb5be56f0c635620ba14738116af92d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class MarkupSection extends EditableNode {

  private EditableNode $_prefix;
  private EditableNode $_text;
  private EditableNode $_suffix;
  private EditableNode $_expression;

  public function __construct(
    EditableNode $prefix,
    EditableNode $text,
    EditableNode $suffix,
    EditableNode $expression,
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
    $prefix = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_prefix'],
      $position,
      $source,
    );
    $position += $prefix->getWidth();
    $text = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_text'],
      $position,
      $source,
    );
    $position += $text->getWidth();
    $suffix = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_suffix'],
      $position,
      $source,
    );
    $position += $suffix->getWidth();
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_expression'],
      $position,
      $source,
    );
    $position += $expression->getWidth();
    return new self($prefix, $text, $suffix, $expression);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'prefix' => $this->_prefix,
      'text' => $this->_text,
      'suffix' => $this->_suffix,
      'expression' => $this->_expression,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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

  public function getPrefixUNTYPED(): EditableNode {
    return $this->_prefix;
  }

  public function withPrefix(EditableNode $value): this {
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
    return
      TypeAssert\instance_of(QuestionGreaterThanToken::class, $this->_prefix);
  }

  /**
   * @returns QuestionGreaterThanToken
   */
  public function getPrefixx(): QuestionGreaterThanToken {
    return
      TypeAssert\instance_of(QuestionGreaterThanToken::class, $this->_prefix);
  }

  public function getTextUNTYPED(): EditableNode {
    return $this->_text;
  }

  public function withText(EditableNode $value): this {
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
    return TypeAssert\instance_of(MarkupToken::class, $this->_text);
  }

  /**
   * @returns MarkupToken
   */
  public function getTextx(): MarkupToken {
    return TypeAssert\instance_of(MarkupToken::class, $this->_text);
  }

  public function getSuffixUNTYPED(): EditableNode {
    return $this->_suffix;
  }

  public function withSuffix(EditableNode $value): this {
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
    return TypeAssert\instance_of(MarkupSuffix::class, $this->_suffix);
  }

  /**
   * @returns MarkupSuffix
   */
  public function getSuffixx(): MarkupSuffix {
    return TypeAssert\instance_of(MarkupSuffix::class, $this->_suffix);
  }

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
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
    return
      TypeAssert\instance_of(ExpressionStatement::class, $this->_expression);
  }

  /**
   * @returns ExpressionStatement
   */
  public function getExpressionx(): ExpressionStatement {
    return
      TypeAssert\instance_of(ExpressionStatement::class, $this->_expression);
  }
}
