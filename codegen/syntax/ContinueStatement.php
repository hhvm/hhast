<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b38885bf84b753fd669af60d304dc887>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ContinueStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_level;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $level,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('continue_statement');
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
      /* UNSAFE_EXPR */ $json['continue_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $level = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['continue_level'],
      $position,
      $source,
    );
    $position += $level->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['continue_semicolon'],
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

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $level = $this->_level->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $level === $this->_level &&
      $semicolon === $this->_semicolon
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $level, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): ContinueToken {
    return $this->keywordx();
  }

  public function keywordx(): ContinueToken {
    return TypeAssert::isInstanceOf(ContinueToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_level, $this->_semicolon);
  }

  public function level(): EditableSyntax {
    return $this->levelx();
  }

  public function levelx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_level);
  }

  public function raw_level(): EditableSyntax {
    return $this->_level;
  }

  public function with_level(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): SemicolonToken {
    return $this->semicolonx();
  }

  public function semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_level, $value);
  }
}
