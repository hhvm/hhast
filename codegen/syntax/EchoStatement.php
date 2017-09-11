<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c97e1533c6e67bd7a2797c1cf2b3d4aa>>
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
    $position += $keyword->width();
    $expressions = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['echo_expressions'],
      $position,
      $source,
    );
    $position += $expressions->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['echo_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $expressions, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'expressions' => $this->_expressions;
    yield 'semicolon' => $this->_semicolon;
  }

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

  public function keyword(): EchoToken {
    return $this->keywordx();
  }

  public function keywordx(): EchoToken {
    return TypeAssert::isInstanceOf(EchoToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_expressions, $this->_semicolon);
  }

  public function expressions(): EditableList {
    return $this->expressionsx();
  }

  public function expressionsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_expressions);
  }

  public function raw_expressions(): EditableSyntax {
    return $this->_expressions;
  }

  public function with_expressions(EditableSyntax $value): this {
    if ($value === $this->_expressions) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_semicolon);
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
    return new self($this->_keyword, $this->_expressions, $value);
  }
}
