<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f09afd37d8cfd461c53ee6cdb117f886>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPChildrenDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_expression;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $expression,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('xhp_children_declaration');
    $this->_keyword = $keyword;
    $this->_expression = $expression;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_children_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $expression, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'expression' => $this->_expression;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $expression === $this->_expression &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $expression, $semicolon);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_expression, $this->_semicolon);
  }

  public function keyword(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_keyword);
  }

  public function raw_expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function expression(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_expression);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_expression, $value);
  }

  public function semicolon(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_semicolon);
  }
}
