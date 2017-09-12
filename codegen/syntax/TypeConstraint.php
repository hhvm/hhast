<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d44493f50cd38045734ef9db28e6070a>>
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

  <<__Override>>
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

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'type' => $this->_type;
  }

  <<__Override>>
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

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_type);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->is_missing();
  }

  public function getKeyword(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_keyword);
  }

  public function getTypeUNTYPED(): EditableSyntax {
    return $this->_type;
  }

  public function withType(EditableSyntax $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }

  public function hasType(): bool {
    return !$this->_type->is_missing();
  }

  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }
}
