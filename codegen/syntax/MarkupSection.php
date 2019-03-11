<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7f773ccdd106c56e80c23613ce086a98>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
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
    string $file,
    int $offset,
    string $source,
  ): this {
    $prefix = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_prefix'],
      $file,
      $offset,
      $source,
    );
    $offset += $prefix->getWidth();
    $text = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_text'],
      $file,
      $offset,
      $source,
    );
    $offset += $text->getWidth();
    $suffix = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_suffix'],
      $file,
      $offset,
      $source,
    );
    $offset += $suffix->getWidth();
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['markup_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    return new static($prefix, $text, $suffix, $expression);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
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
    ?vec<EditableNode> $parents = null,
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
    return new static($prefix, $text, $suffix, $expression);
  }

  public function getPrefixUNTYPED(): EditableNode {
    return $this->_prefix;
  }

  public function withPrefix(EditableNode $value): this {
    if ($value === $this->_prefix) {
      return $this;
    }
    return new static($value, $this->_text, $this->_suffix, $this->_expression);
  }

  public function hasPrefix(): bool {
    return !$this->_prefix->isMissing();
  }

  /**
   * @return null | QuestionGreaterThanToken
   */
  public function getPrefix(): ?QuestionGreaterThanToken {
    if ($this->_prefix->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      QuestionGreaterThanToken::class,
      $this->_prefix,
    );
  }

  /**
   * @return QuestionGreaterThanToken
   */
  public function getPrefixx(): QuestionGreaterThanToken {
    return TypeAssert\instance_of(
      QuestionGreaterThanToken::class,
      $this->_prefix,
    );
  }

  public function getTextUNTYPED(): EditableNode {
    return $this->_text;
  }

  public function withText(EditableNode $value): this {
    if ($value === $this->_text) {
      return $this;
    }
    return new static(
      $this->_prefix,
      $value,
      $this->_suffix,
      $this->_expression,
    );
  }

  public function hasText(): bool {
    return !$this->_text->isMissing();
  }

  /**
   * @return null | MarkupToken
   */
  public function getText(): ?MarkupToken {
    if ($this->_text->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(MarkupToken::class, $this->_text);
  }

  /**
   * @return MarkupToken
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
    return new static($this->_prefix, $this->_text, $value, $this->_expression);
  }

  public function hasSuffix(): bool {
    return !$this->_suffix->isMissing();
  }

  /**
   * @return MarkupSuffix | null
   */
  public function getSuffix(): ?MarkupSuffix {
    if ($this->_suffix->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(MarkupSuffix::class, $this->_suffix);
  }

  /**
   * @return MarkupSuffix
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
    return new static($this->_prefix, $this->_text, $this->_suffix, $value);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @return ExpressionStatement | null
   */
  public function getExpression(): ?ExpressionStatement {
    if ($this->_expression->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(
      ExpressionStatement::class,
      $this->_expression,
    );
  }

  /**
   * @return ExpressionStatement
   */
  public function getExpressionx(): ExpressionStatement {
    return TypeAssert\instance_of(
      ExpressionStatement::class,
      $this->_expression,
    );
  }
}
