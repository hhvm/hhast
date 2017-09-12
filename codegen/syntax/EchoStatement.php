<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b820facbbc5a7fb62447f3fa5551b5f3>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class EchoStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_expressions;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $expressions,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('echo_statement');
    $this->_keyword = $keyword;
    $this->_expressions = $expressions;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['echo_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $expressions = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['echo_expressions'],
      $position,
      $source,
    );
    $position += $expressions->getWidth();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['echo_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($keyword, $expressions, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'expressions' => $this->_expressions;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $expressions = $this->_expressions->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $expressions === $this->_expressions &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $expressions, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_expressions, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  public function getKeyword(): EchoToken {
    return TypeAssert::isInstanceOf(EchoToken::class, $this->_keyword);
  }

  public function getExpressionsUNTYPED(): EditableSyntax {
    return $this->_expressions;
  }

  public function withExpressions(EditableSyntax $value): this {
    if ($value === $this->_expressions) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function hasExpressions(): bool {
    return !$this->_expressions->isMissing();
  }

  public function getExpressions(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_expressions);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_expressions, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function getSemicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
