<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2b20f8a79c3a4cdafec65262a5423a74>>
 */
namespace Facebook\HHAST;

final class EchoToken extends EditableToken {

  public function __construct(
    EditableSyntax $leading,
    EditableSyntax $trailing,
  ) {
    parent::__construct('echo', $leading, $trailing, 'echo');
  }

  public function hasLeading(): bool {
    return !$this->getLeading()->isMissing();
  }

  <<__Override>>
  public function withLeading(EditableSyntax $value): this {
    if ($value === $this->getLeading()) {
      return $this;
    }
    return new self($value, $this->getTrailing());
  }

  public function hasTrailing(): bool {
    return !$this->getTrailing()->isMissing();
  }

  <<__Override>>
  public function withTrailing(EditableSyntax $value): this {
    if ($value === $this->getTrailing()) {
      return $this;
    }
    return new self($this->getLeading(), $value);
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $leading = $this->getLeading()->rewrite($rewriter, $parents);
    $trailing = $this->getTrailing()->rewrite($rewriter, $parents);
    if (
      $leading === $this->getLeading() && $trailing === $this->getTrailing()
    ) {
      return $this;
    }
    return new self($leading, $trailing);
  }
}
