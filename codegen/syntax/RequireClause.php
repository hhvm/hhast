<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a907ca57e831fafbd3989ddd6842d0e8>>
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

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $kind = $this->_kind->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $kind === $this->_kind &&
      $name === $this->_name &&
      $semicolon === $this->_semicolon
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $kind, $name, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): RequireToken {
    return $this->keywordx();
  }

  public function keywordx(): RequireToken {
    return TypeAssert::isInstanceOf(RequireToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_kind, $this->_name, $this->_semicolon);
  }

  public function kind(): EditableSyntax {
    return $this->kindx();
  }

  public function kindx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_kind);
  }

  public function raw_kind(): EditableSyntax {
    return $this->_kind;
  }

  public function with_kind(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_name, $this->_semicolon);
  }

  public function name(): EditableSyntax {
    return $this->namex();
  }

  public function namex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_kind, $value, $this->_semicolon);
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
    return new self($this->_keyword, $this->_kind, $this->_name, $value);
  }
}
