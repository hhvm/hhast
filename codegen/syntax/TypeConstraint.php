<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<57e1b03ef1e95036ee064d8ae33595f6>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class TypeConstraint extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_type;

  public function __construct(EditableSyntax $keyword, EditableSyntax $type) {
    parent::__construct('type_constraint');
    $this->_keyword = $keyword;
    $this->_type = $type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['constraint_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['constraint_type'],
      $position,
      $source,
    );
    $position += $type->width();
    return new self($keyword, $type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'type' => $this->_type;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new self($keyword, $type);
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
    return new self($value, $this->_type);
  }

  public function type(): EditableSyntax {
    return $this->typex();
  }

  public function typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }

  public function raw_type(): EditableSyntax {
    return $this->_type;
  }

  public function with_type(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }
}
