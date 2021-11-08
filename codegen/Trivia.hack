/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<de086f4b1e2edad58d783942ae977ea4>>
 */
namespace Facebook\HHAST;

final class DelimitedComment extends Trivia implements IComment {

  const string SYNTAX_KIND = 'delimited_comment';

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class EndOfLine extends Trivia {

  const string SYNTAX_KIND = 'end_of_line';

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class ExtraTokenError extends Trivia {

  const string SYNTAX_KIND = 'extra_token_error';

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class FallThrough extends Trivia {

  const string SYNTAX_KIND = 'fall_through';

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class FixMe extends Trivia {

  const string SYNTAX_KIND = 'fix_me';

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class IgnoreError extends Trivia {

  const string SYNTAX_KIND = 'ignore_error';

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class SingleLineComment extends Trivia implements IComment {

  const string SYNTAX_KIND = 'single_line_comment';

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}

final class WhiteSpace extends Trivia {

  const string SYNTAX_KIND = 'whitespace';

  public function __construct(
    string $text,
    ?__Private\SourceRef $source_ref = null,
  ) {
    parent::__construct($text, $source_ref);
  }

  public function withText(string $text): this {
    if ($text === $this->getText()) {
      return $this;
    }
    return new self($text);
  }
}
