/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<dd869654a74e819f3244d356f3a65d12>>
 */
namespace Facebook\HHAST;

final class HexadecimalLiteralToken extends TokenWithVariableText {

  const string KIND = 'hexadecimal_literal';

  public function __construct(
    Node $leading,
    Node $trailing,
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($leading, $trailing, $text, $source_ref);
  }

  public function hasLeading(): bool {
    return !$this->getLeading()->isMissing();
  }

  <<__Override>>
  public function withLeading(Node $value): this {
    if ($value === $this->getLeading()) {
      return $this;
    }
    return new self($value, $this->getTrailing(), $this->getText());
  }

  public function hasTrailing(): bool {
    return !$this->getTrailing()->isMissing();
  }

  <<__Override>>
  public function withTrailing(Node $value): this {
    if ($value === $this->getTrailing()) {
      return $this;
    }
    return new self($this->getLeading(), $value, $this->getText());
  }

  public function withText(string $value): this {
    if ($value === $this->getText()) {
      return $this;
    }
    return new self($this->getLeading(), $this->getTrailing(), $value);
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $leading = $rewriter($this->getLeading(), $parents);
    $trailing = $rewriter($this->getTrailing(), $parents);
    $text = $this->getText();
    if (
      $leading === $this->getLeading() &&
      $trailing === $this->getTrailing() &&
      $text === $this->getText()
    ) {
      return $this;
    }
    return new self($leading, $trailing, $text);
  }
}
