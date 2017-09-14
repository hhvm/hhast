<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8d2f66194a57b3c03babcab45f25c7e5>>
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

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['break_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $level = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['break_level'],
      $position,
      $source,
    );
    $position += $level->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['break_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($keyword, $level, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'level' => $this->_level;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewriteDescendants(
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

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_level, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns BreakToken
   */
  public function getKeyword(): BreakToken {
    return TypeAssert::isInstanceOf(BreakToken::class, $this->_keyword);
  }

  public function getLevelUNTYPED(): EditableSyntax {
    return $this->_level;
  }

  public function withLevel(EditableSyntax $value): this {
    if ($value === $this->_level) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function hasLevel(): bool {
    return !$this->_level->isMissing();
  }

  /**
   * @returns LiteralExpression | VariableExpression
   */
  public function getLevel(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_level);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_level, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
