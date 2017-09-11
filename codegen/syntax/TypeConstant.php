<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ecffc539c7e01b530a73efcb7974a335>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class TypeConstant extends EditableSyntax {

  private EditableSyntax $_left_type;
  private EditableSyntax $_separator;
  private EditableSyntax $_right_type;

  public function __construct(
    EditableSyntax $left_type,
    EditableSyntax $separator,
    EditableSyntax $right_type,
  ) {
    parent::__construct('type_constant');
    $this->_left_type = $left_type;
    $this->_separator = $separator;
    $this->_right_type = $right_type;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_constant_left_type'],
      $position,
      $source,
    );
    $position += $left_type->width();
    $separator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_constant_separator'],
      $position,
      $source,
    );
    $position += $separator->width();
    $right_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['type_constant_right_type'],
      $position,
      $source,
    );
    $position += $right_type->width();
    return new self($left_type, $separator, $right_type);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_type' => $this->_left_type;
    yield 'separator' => $this->_separator;
    yield 'right_type' => $this->_right_type;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $left_type = $this->_left_type->rewrite($rewriter, $parents);
    $separator = $this->_separator->rewrite($rewriter, $parents);
    $right_type = $this->_right_type->rewrite($rewriter, $parents);
    if (
      $left_type === $this->_left_type &&
      $separator === $this->_separator &&
      $right_type === $this->_right_type
    ) {
      return $this;
    }
    return new self($left_type, $separator, $right_type);
  }

  public function left_type(): EditableSyntax {
    return $this->left_typex();
  }

  public function left_typex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_left_type);
  }

  public function raw_left_type(): EditableSyntax {
    return $this->_left_type;
  }

  public function with_left_type(EditableSyntax $value): this {
    if ($value === $this->_left_type) {
      return $this;
    }
    return new self($value, $this->_separator, $this->_right_type);
  }

  public function separator(): ColonColonToken {
    return $this->separatorx();
  }

  public function separatorx(): ColonColonToken {
    return TypeAssert::isInstanceOf(ColonColonToken::class, $this->_separator);
  }

  public function raw_separator(): EditableSyntax {
    return $this->_separator;
  }

  public function with_separator(EditableSyntax $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new self($this->_left_type, $value, $this->_right_type);
  }

  public function right_type(): NameToken {
    return $this->right_typex();
  }

  public function right_typex(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_right_type);
  }

  public function raw_right_type(): EditableSyntax {
    return $this->_right_type;
  }

  public function with_right_type(EditableSyntax $value): this {
    if ($value === $this->_right_type) {
      return $this;
    }
    return new self($this->_left_type, $this->_separator, $value);
  }
}
