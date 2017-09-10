<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b47c8995b56e1bea267126a042faa4b4>>
 */
namespace Facebook\HHAST;

final class WhiteSpace extends EditableTrivia {

  public function __construct(string $text) {
    parent::__construct('whitespace', $text);
  }

  public function with_text(string $text): this {
    return new self($text);
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    return $this;
  }
}

final class EndOfLine extends EditableTrivia {

  public function __construct(string $text) {
    parent::__construct('end_of_line', $text);
  }

  public function with_text(string $text): this {
    return new self($text);
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    return $this;
  }
}

final class DelimitedComment extends EditableTrivia {

  public function __construct(string $text) {
    parent::__construct('delimited_comment', $text);
  }

  public function with_text(string $text): this {
    return new self($text);
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    return $this;
  }
}

final class SingleLineComment extends EditableTrivia {

  public function __construct(string $text) {
    parent::__construct('single_line_comment', $text);
  }

  public function with_text(string $text): this {
    return new self($text);
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    return $this;
  }
}

final class Unsafe extends EditableTrivia {

  public function __construct(string $text) {
    parent::__construct('unsafe', $text);
  }

  public function with_text(string $text): this {
    return new self($text);
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    return $this;
  }
}

final class UnsafeExpression extends EditableTrivia {

  public function __construct(string $text) {
    parent::__construct('unsafe_expression', $text);
  }

  public function with_text(string $text): this {
    return new self($text);
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    return $this;
  }
}

final class FixMe extends EditableTrivia {

  public function __construct(string $text) {
    parent::__construct('fix_me', $text);
  }

  public function with_text(string $text): this {
    return new self($text);
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    return $this;
  }
}

final class IgnoreError extends EditableTrivia {

  public function __construct(string $text) {
    parent::__construct('ignore_error', $text);
  }

  public function with_text(string $text): this {
    return new self($text);
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    return $this;
  }
}

final class FallThrough extends EditableTrivia {

  public function __construct(string $text) {
    parent::__construct('fall_through', $text);
  }

  public function with_text(string $text): this {
    return new self($text);
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    return $this;
  }
}
