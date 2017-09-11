<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4e5ea77e814cc40586d437fdd13b2bd2>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class BreakStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_level;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $level,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('break_statement');
    $this->_keyword = $keyword;
    $this->_level = $level;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['break_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $level = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['break_level'],
      $position,
      $source,
    );
    $position += $level->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['break_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $level, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'level' => $this->_level;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $level = $this->_level->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $level === $this->_level &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $level, $semicolon);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_level, $this->_semicolon);
  }

  public function keyword(): BreakToken {
    return TypeAssert::isInstanceOf(BreakToken::class, $this->_keyword);
  }

  public function raw_level(): EditableSyntax {
    return $this->_level;
  }

  public function with_level(EditableSyntax $value): this {
    if ($value === $this->_level) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function level(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_level);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_level, $value);
  }

  public function semicolon(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
