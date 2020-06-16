/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<aca3236bc0c11deaa7ff3522e8b7c4fe>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class MarkupSection extends Node {

  const string SYNTAX_KIND = 'markup_section';

  private MarkupToken $_text;
  private MarkupSuffix $_suffix;

  public function __construct(
    MarkupToken $text,
    MarkupSuffix $suffix,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_text = $text;
    $this->_suffix = $suffix;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $text,
      /* HH_IGNORE_ERROR[4110] */ $suffix,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'text' => $this->_text,
      'suffix' => $this->_suffix,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $text = $rewriter($this->_text, $parents);
    $suffix = $rewriter($this->_suffix, $parents);
    if ($text === $this->_text && $suffix === $this->_suffix) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $text,
      /* HH_FIXME[4110] use `as` */ $suffix,
    );
  }

  public function getTextUNTYPED(): ?Node {
    return $this->_text;
  }

  public function withText(MarkupToken $value): this {
    if ($value === $this->_text) {
      return $this;
    }
    return new static($value, $this->_suffix);
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
    return new static($this->_text, $value);
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
}
