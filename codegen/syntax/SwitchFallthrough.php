<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4a47761f3ef3bac7e85a4c594a2bb1fe>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class SwitchFallthrough extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('switch_fallthrough');
    $this->_keyword = $keyword;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['fallthrough_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['fallthrough_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($keyword, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
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
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if ($keyword === $this->_keyword && $semicolon === $this->_semicolon) {
      return $this;
    }
    return new self($keyword, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getKeyword(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_keyword);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns unknown
   */
  public function getSemicolon(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_semicolon);
  }
}
