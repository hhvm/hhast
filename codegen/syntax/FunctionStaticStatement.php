<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5f3d9f90f1971cdbca0eb1e24d217156>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $static_keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['static_static_keyword'],
      $position,
      $source,
    );
    $position += $static_keyword->width();
    $declarations = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['static_declarations'],
      $position,
      $source,
    );
    $position += $declarations->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['static_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($static_keyword, $declarations, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'static_keyword' => $this->_static_keyword;
    yield 'declarations' => $this->_declarations;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite_children(
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

  public function static_keyword(): StaticToken {
    return $this->static_keywordx();
  }

  public function static_keywordx(): StaticToken {
    return TypeAssert::isInstanceOf(StaticToken::class, $this->_static_keyword);
  }

  public function raw_static_keyword(): EditableSyntax {
    return $this->_static_keyword;
  }

  public function with_static_keyword(EditableSyntax $value): this {
    if ($value === $this->_static_keyword) {
      return $this;
    }
    return new self($value, $this->_declarations, $this->_semicolon);
  }

  public function declarations(): EditableList {
    return $this->declarationsx();
  }

  public function declarationsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_declarations);
  }

  public function raw_declarations(): EditableSyntax {
    return $this->_declarations;
  }

  public function with_declarations(EditableSyntax $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new self($this->_static_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): ?SemicolonToken {
    return $this->_semicolon->is_missing() ? null : TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_static_keyword, $this->_declarations, $value);
  }
}
