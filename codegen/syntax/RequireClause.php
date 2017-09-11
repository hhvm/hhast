<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<83304600e314ba70ea83b449f2cddc1f>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class RequireClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_kind;
  private EditableSyntax $_name;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $kind,
    EditableSyntax $name,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('require_clause');
    $this->_keyword = $keyword;
    $this->_kind = $kind;
    $this->_name = $name;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['require_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $kind = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['require_kind'],
      $position,
      $source,
    );
    $position += $kind->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['require_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['require_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $kind, $name, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'kind' => $this->_kind;
    yield 'name' => $this->_name;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $kind = $this->_kind->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $kind === $this->_kind &&
      $name === $this->_name &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $kind, $name, $semicolon);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_kind, $this->_name, $this->_semicolon);
  }

  public function keyword(): RequireToken {
    return TypeAssert::isInstanceOf(RequireToken::class, $this->_keyword);
  }

  public function raw_kind(): EditableSyntax {
    return $this->_kind;
  }

  public function with_kind(EditableSyntax $value): this {
    if ($value === $this->_kind) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_name, $this->_semicolon);
  }

  public function kind(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_kind);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_keyword, $this->_kind, $value, $this->_semicolon);
  }

  public function name(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_kind, $this->_name, $value);
  }

  public function semicolon(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
