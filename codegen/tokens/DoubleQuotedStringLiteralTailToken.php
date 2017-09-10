<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0c4745ec3c1bcee2925720b07a5faaee>>
 */
namespace Facebook\HHAST;

final class DoubleQuotedStringLiteralTailToken extends EditableToken {

  public function __construct(
    EditableSyntax $leading,
    EditableSyntax $trailing,
    string $text,
  ) {
    parent::__construct(
      'double_quoted_string_literal_tail',
      $leading,
      $trailing,
      $text,
    );
  }

  public function with_leading(EditableSyntax $leading): this {
    return new self($leading, $this->trailing(), $this->text());
  }

  public function with_trailing(EditableSyntax $trailing): this {
    return new self($this->leading(), $trailing, $this->text());
  }

  public function with_text(string $text): this {
    return new self($this->leading(), $this->trailing(), $text);
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $leading = $this->leading()->rewrite($rewriter, $parents);
    $trailing = $this->trailing()->rewrite($rewriter, $parents);
    $text = $this->text();
    if (
      $leading === $this->leading() &&
      $trailing === $this->trailing() &&
      $text === $this->text()
    ) {
      return $this;
    }
    return new self($leading, $trailing, $text);
  }
}
