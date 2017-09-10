<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e5c1151deeae34603da2a8052e1f73a5>>
 */
namespace Facebook\HHAST;

final class NewtypeToken extends EditableToken {

  public function __construct(
    EditableSyntax $leading,
    EditableSyntax $trailing,
  ) {
    parent::__construct('newtype', $leading, $trailing, 'newtype');
  }

  public function with_leading(EditableSyntax $leading): this {
    return new self($leading, $this->trailing());
  }

  public function with_trailing(EditableSyntax $trailing): this {
    return new self($this->leading(), $trailing);
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $leading = $this->leading()->rewrite($rewriter, $parents);
    $trailing = $this->trailing()->rewrite($rewriter, $parents);
    if (
      $leading === $this->leading() &&
      $trailing === $this->trailing()
    ) {
      return $this;
    }
    return new self($leading, $trailing);
  }
}
