/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<665e8a082776f9b3a6a91aef9d8377c1>>
 */
namespace Facebook\HHAST;

final class AfterHaltCompiler extends EditableTrivia {

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct('after_halt_compiler', $text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class DelimitedComment extends EditableTrivia implements IComment {

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct('delimited_comment', $text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class EndOfLine extends EditableTrivia {

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct('end_of_line', $text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class ExtraTokenError extends EditableTrivia {

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct('extra_token_error', $text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class FallThrough extends EditableTrivia {

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct('fall_through', $text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class FixMe extends EditableTrivia {

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct('fix_me', $text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class IgnoreError extends EditableTrivia {

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct('ignore_error', $text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class SingleLineComment extends EditableTrivia implements IComment {

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct('single_line_comment', $text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class Unsafe extends EditableTrivia {

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct('unsafe', $text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class UnsafeExpression extends EditableTrivia {

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct('unsafe_expression', $text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class WhiteSpace extends EditableTrivia {

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct('whitespace', $text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}
