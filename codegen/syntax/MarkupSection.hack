/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3f8d2ef4b88e87752d4bcd6d4c1f80d1>>
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
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_prefix = $prefix;
    $this->_text = $text;
    $this->_suffix = $suffix;
    $this->_expression = $expression;
    parent::__construct('markup_section', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($prefix, $text, $suffix, $expression, $source_ref);
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
    vec<EditableNode> $parents = vec[],
  ): this {
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
   * @return null
   */
  public function getPrefix(): ?EditableNode {
    if ($this->_prefix->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_prefix);
  }

  /**
   * @return
   */
  public function getPrefixx(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_prefix);
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
   * @return MarkupToken
   */
  public function getText(): MarkupToken {
    return TypeAssert\instance_of(MarkupToken::class, $this->_text);
  }

  /**
   * @return MarkupToken
   */
  public function getTextx(): MarkupToken {
    return $this->getText();
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
   * @return MarkupSuffix
   */
  public function getSuffix(): MarkupSuffix {
    return TypeAssert\instance_of(MarkupSuffix::class, $this->_suffix);
  }

  /**
   * @return MarkupSuffix
   */
  public function getSuffixx(): MarkupSuffix {
    return $this->getSuffix();
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
   * @return null
   */
  public function getExpression(): ?EditableNode {
    if ($this->_expression->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }

  /**
   * @return
   */
  public function getExpressionx(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }
}
