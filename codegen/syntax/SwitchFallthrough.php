<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<042dcf4af8247c91db50fca97fd1c4f4>>
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

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_semicolon);
  }

  public function keyword(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_keyword);
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

  public function semicolon(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_semicolon);
  }
}
