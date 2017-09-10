<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<681f59714839774ec5c6a3a2237f3007>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class TraitUse extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_names;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $names,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('trait_use');
    $this->_keyword = $keyword;
    $this->_names = $names;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $names = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_names'],
      $position,
      $source,
    );
    $position += $names->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['trait_use_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $names, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'names' => $this->_names;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $names = $this->_names->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $names === $this->_names &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $names, $semicolon);
  }

  public function keyword(): UseToken {
    return $this->keywordx();
  }

  public function keywordx(): UseToken {
    return TypeAssert::isInstanceOf(UseToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_names, $this->_semicolon);
  }

  public function names(): EditableList {
    return $this->namesx();
  }

  public function namesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_names);
  }

  public function raw_names(): EditableSyntax {
    return $this->_names;
  }

  public function with_names(EditableSyntax $value): this {
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
    return new self($this->_keyword, $this->_names, $value);
  }
}
