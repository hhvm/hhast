<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b5d7b0c07812076dc5f0eb07932992ad>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPRequired extends EditableSyntax {

  private EditableSyntax $_at;
  private EditableSyntax $_keyword;

  public function __construct(EditableSyntax $at, EditableSyntax $keyword) {
    parent::__construct('xhp_required');
    $this->_at = $at;
    $this->_keyword = $keyword;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $at = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_required_at'],
      $position,
      $source,
    );
    $position += $at->width();
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_required_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    return new self($at, $keyword);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'at' => $this->_at;
    yield 'keyword' => $this->_keyword;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $at = $this->_at->rewrite($rewriter, $child_parents);
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    if ($at === $this->_at && $keyword === $this->_keyword) {
      $node = $this;
    } else {
      $node = new self($at, $keyword);
    }
    return $rewriter($node, $parents);
  }

  public function at(): AtToken {
    return $this->atx();
  }

  public function atx(): AtToken {
    return TypeAssert::isInstanceOf(AtToken::class, $this->_at);
  }

  public function raw_at(): EditableSyntax {
    return $this->_at;
  }

  public function with_at(EditableSyntax $value): this {
    return new self($value, $this->_keyword);
  }

  public function keyword(): RequiredToken {
    return $this->keywordx();
  }

  public function keywordx(): RequiredToken {
    return TypeAssert::isInstanceOf(RequiredToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($this->_at, $value);
  }
}
