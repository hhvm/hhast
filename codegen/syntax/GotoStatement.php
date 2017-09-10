<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<bf795c66f2db8cef04972c9ba30805de>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class GotoStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_label_name;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $label_name,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('goto_statement');
    $this->_keyword = $keyword;
    $this->_label_name = $label_name;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['goto_statement_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $label_name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['goto_statement_label_name'],
      $position,
      $source,
    );
    $position += $label_name->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['goto_statement_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $label_name, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'label_name' => $this->_label_name;
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
    $label_name = $this->_label_name->rewrite($rewriter, $child_parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $label_name === $this->_label_name &&
      $semicolon === $this->_semicolon
    ) {
      $node = $this;
    } else {
      $node = new self($keyword, $label_name, $semicolon);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): GotoToken {
    return $this->keywordx();
  }

  public function keywordx(): GotoToken {
    return TypeAssert::isInstanceOf(GotoToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_label_name, $this->_semicolon);
  }

  public function label_name(): NameToken {
    return $this->label_namex();
  }

  public function label_namex(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_label_name);
  }

  public function raw_label_name(): EditableSyntax {
    return $this->_label_name;
  }

  public function with_label_name(EditableSyntax $value): this {
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
    return new self($this->_keyword, $this->_label_name, $value);
  }
}
