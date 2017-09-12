<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5eb08041e742a78798971f89a26973b0>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ShapeTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_fields;
  private EditableSyntax $_ellipsis;
  private EditableSyntax $_right_paren;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $fields,
    EditableSyntax $ellipsis,
    EditableSyntax $right_paren,
  ) {
    parent::__construct('shape_type_specifier');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_fields = $fields;
    $this->_ellipsis = $ellipsis;
    $this->_right_paren = $right_paren;
  }

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_type_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $left_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_type_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->getWidth();
    $fields = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_type_fields'],
      $position,
      $source,
    );
    $position += $fields->getWidth();
    $ellipsis = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_type_ellipsis'],
      $position,
      $source,
    );
    $position += $ellipsis->getWidth();
    $right_paren = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['shape_type_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->getWidth();
    return new self($keyword, $left_paren, $fields, $ellipsis, $right_paren);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'fields' => $this->_fields;
    yield 'ellipsis' => $this->_ellipsis;
    yield 'right_paren' => $this->_right_paren;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $fields = $this->_fields->rewrite($rewriter, $parents);
    $ellipsis = $this->_ellipsis->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $fields === $this->_fields &&
      $ellipsis === $this->_ellipsis &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new self($keyword, $left_paren, $fields, $ellipsis, $right_paren);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self(
      $value,
      $this->_left_paren,
      $this->_fields,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  public function getKeyword(): ShapeToken {
    return TypeAssert::isInstanceOf(ShapeToken::class, $this->_keyword);
  }

  public function getLeftParenUNTYPED(): EditableSyntax {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableSyntax $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $value,
      $this->_fields,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  public function getLeftParen(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function getFieldsUNTYPED(): EditableSyntax {
    return $this->_fields;
  }

  public function withFields(EditableSyntax $value): this {
    if ($value === $this->_fields) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_ellipsis,
      $this->_right_paren,
    );
  }

  public function hasFields(): bool {
    return !$this->_fields->isMissing();
  }

  public function getFields(): ?EditableList {
    if ($this->_fields->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_fields);
  }

  public function getFieldsx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_fields);
  }

  public function getEllipsisUNTYPED(): EditableSyntax {
    return $this->_ellipsis;
  }

  public function withEllipsis(EditableSyntax $value): this {
    if ($value === $this->_ellipsis) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_fields,
      $value,
      $this->_right_paren,
    );
  }

  public function hasEllipsis(): bool {
    return !$this->_ellipsis->isMissing();
  }

  public function getEllipsis(): ?DotDotDotToken {
    if ($this->_ellipsis->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(DotDotDotToken::class, $this->_ellipsis);
  }

  public function getEllipsisx(): DotDotDotToken {
    return TypeAssert::isInstanceOf(DotDotDotToken::class, $this->_ellipsis);
  }

  public function getRightParenUNTYPED(): EditableSyntax {
    return $this->_right_paren;
  }

  public function withRightParen(EditableSyntax $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_fields,
      $this->_ellipsis,
      $value,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  public function getRightParen(): RightParenToken {
    return TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }
}
