<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<bd73b993d04fc2814c758cd6f8be7730>>
 */
namespace Facebook\HHAST;

final class ArrayToken extends EditableToken {

  public function __construct(
    EditableSyntax $leading,
    EditableSyntax $trailing,
  ) {
    parent::__construct('array', $leading, $trailing, 'array');
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
