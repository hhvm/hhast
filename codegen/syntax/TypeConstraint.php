<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d2d0e91c9dc2ae1b0cab4edf081bcaa9>>
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
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['constraint_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['constraint_type'],
      $position,
      $source,
    );
    $position += $type->getWidth();
    return new self($keyword, $type);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'type' => $this->_type;
  }

  <<__Override>>
  public function rewriteDescendants(
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
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns AsToken | SuperToken
   */
  public function getKeyword(): EditableToken {
    return TypeAssert::isInstanceOf(EditableToken::class, $this->_keyword);
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
    return !$this->_type->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier | GenericTypeSpecifier | ShapeTypeSpecifier |
   * NullableTypeSpecifier | TypeConstant | DictionaryTypeSpecifier |
   * ClassnameTypeSpecifier | KeysetTypeSpecifier
   */
  public function getType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_type);
  }
}
