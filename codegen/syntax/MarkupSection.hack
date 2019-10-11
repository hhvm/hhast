/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<67bed238d8b5ec73973b9924b119ea4f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class MarkupSection extends Node {

  const string SYNTAX_KIND = 'markup_section';

  private ?Node $_prefix;
  private MarkupToken $_text;
  private MarkupSuffix $_suffix;
  private ?Node $_expression;

  public function __construct(
    ?Node $prefix,
    MarkupToken $text,
    MarkupSuffix $suffix,
    ?Node $expression,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_prefix = $prefix;
    $this->_text = $text;
    $this->_suffix = $suffix;
    $this->_expression = $expression;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $prefix = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['markup_prefix'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $prefix?->getWidth() ?? 0;
    $text = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['markup_text'],
      $file,
      $offset,
      $source,
      'MarkupToken',
    );
    $text = $text as nonnull;
    $offset += $text->getWidth();
    $suffix = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['markup_suffix'],
      $file,
      $offset,
      $source,
      'MarkupSuffix',
    );
    $suffix = $suffix as nonnull;
    $offset += $suffix->getWidth();
    $expression = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['markup_expression'] ??
        dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $expression?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $prefix,
      /* HH_IGNORE_ERROR[4110] */ $text,
      /* HH_IGNORE_ERROR[4110] */ $suffix,
      /* HH_IGNORE_ERROR[4110] */ $expression,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'prefix' => $this->_prefix,
      'text' => $this->_text,
      'suffix' => $this->_suffix,
      'expression' => $this->_expression,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $prefix = $this->_prefix === null
      ? null
      : $rewriter($this->_prefix, $parents);
    $text = $rewriter($this->_text, $parents);
    $suffix = $rewriter($this->_suffix, $parents);
    $expression = $this->_expression === null
      ? null
      : $rewriter($this->_expression, $parents);
    if (
      $prefix === $this->_prefix &&
      $text === $this->_text &&
      $suffix === $this->_suffix &&
      $expression === $this->_expression
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $prefix,
      /* HH_FIXME[4110] use `as` */ $text,
      /* HH_FIXME[4110] use `as` */ $suffix,
      /* HH_FIXME[4110] use `as` */ $expression,
    );
  }

  public function getPrefixUNTYPED(): ?Node {
    return $this->_prefix;
  }

  public function withPrefix(?Node $value): this {
    if ($value === $this->_prefix) {
      return $this;
    }
    return new static($value, $this->_text, $this->_suffix, $this->_expression);
  }

  public function hasPrefix(): bool {
    return $this->_prefix !== null;
  }

  /**
   * @return null
   */
  public function getPrefix(): ?Node {
    return $this->_prefix;
  }

  /**
   * @return
   */
  public function getPrefixx(): Node {
    return TypeAssert\not_null($this->getPrefix());
  }

  public function getTextUNTYPED(): ?Node {
    return $this->_text;
  }

  public function withText(MarkupToken $value): this {
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
    return $this->_text !== null;
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

  public function getSuffixUNTYPED(): ?Node {
    return $this->_suffix;
  }

  public function withSuffix(MarkupSuffix $value): this {
    if ($value === $this->_suffix) {
      return $this;
    }
    return new static($this->_prefix, $this->_text, $value, $this->_expression);
  }

  public function hasSuffix(): bool {
    return $this->_suffix !== null;
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

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(?Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_prefix, $this->_text, $this->_suffix, $value);
  }

  public function hasExpression(): bool {
    return $this->_expression !== null;
  }

  /**
   * @return null
   */
  public function getExpression(): ?Node {
    return $this->_expression;
  }

  /**
   * @return
   */
  public function getExpressionx(): Node {
    return TypeAssert\not_null($this->getExpression());
  }
}
