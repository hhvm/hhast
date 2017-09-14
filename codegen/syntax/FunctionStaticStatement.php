<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<848cbb8d27a603478997034fcaf05765>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class FunctionStaticStatement extends EditableSyntax {

  private EditableSyntax $_static_keyword;
  private EditableSyntax $_declarations;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $static_keyword,
    EditableSyntax $declarations,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('function_static_statement');
    $this->_static_keyword = $static_keyword;
    $this->_declarations = $declarations;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $static_keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['static_static_keyword'],
      $position,
      $source,
    );
    $position += $static_keyword->getWidth();
    $declarations = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['static_declarations'],
      $position,
      $source,
    );
    $position += $declarations->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['static_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($static_keyword, $declarations, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'static_keyword' => $this->_static_keyword;
    yield 'declarations' => $this->_declarations;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $static_keyword = $this->_static_keyword->rewrite($rewriter, $parents);
    $declarations = $this->_declarations->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $static_keyword === $this->_static_keyword &&
      $declarations === $this->_declarations &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($static_keyword, $declarations, $semicolon);
  }

  public function getStaticKeywordUNTYPED(): EditableSyntax {
    return $this->_static_keyword;
  }

  public function withStaticKeyword(EditableSyntax $value): this {
    if ($value === $this->_static_keyword) {
      return $this;
    }
    return new self($value, $this->_declarations, $this->_semicolon);
  }

  public function hasStaticKeyword(): bool {
    return !$this->_static_keyword->isMissing();
  }

  /**
   * @returns StaticToken
   */
  public function getStaticKeyword(): StaticToken {
    return TypeAssert::isInstanceOf(StaticToken::class, $this->_static_keyword);
  }

  public function getDeclarationsUNTYPED(): EditableSyntax {
    return $this->_declarations;
  }

  public function withDeclarations(EditableSyntax $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new self($this->_static_keyword, $value, $this->_semicolon);
  }

  public function hasDeclarations(): bool {
    return !$this->_declarations->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getDeclarations(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_declarations);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_static_keyword, $this->_declarations, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
