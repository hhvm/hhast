<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3fc28440def9666cbba45a730d96f780>>
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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['fallthrough_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['fallthrough_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $semicolon);
  }

  public function keyword(): EditableSyntax {
    return $this->keywordx();
  }

  public function keywordx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_semicolon);
  }

  public function semicolon(): EditableSyntax {
    return $this->semicolonx();
  }

  public function semicolonx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_semicolon);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }
}
