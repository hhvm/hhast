<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a81e82d905f0673fa31c075216f2525f>>
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

  <<__Override>>
  public static function fromJSON(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $left_type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['type_constant_left_type'],
      $position,
      $source,
    );
    $position += $left_type->getWidth();
    $separator = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['type_constant_separator'],
      $position,
      $source,
    );
    $position += $separator->getWidth();
    $right_type = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['type_constant_right_type'],
      $position,
      $source,
    );
    $position += $right_type->getWidth();
    return new self($left_type, $separator, $right_type);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'left_type' => $this->_left_type;
    yield 'separator' => $this->_separator;
    yield 'right_type' => $this->_right_type;
  }

  <<__Override>>
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

  public function getLeftTypeUNTYPED(): EditableSyntax {
    return $this->_left_type;
  }

  public function withLeftType(EditableSyntax $value): this {
    if ($value === $this->_left_type) {
      return $this;
    }
    return new self($value, $this->_separator, $this->_right_type);
  }

  public function hasLeftType(): bool {
    return !$this->_left_type->isMissing();
  }

  public function getLeftType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_left_type);
  }

  public function getSeparatorUNTYPED(): EditableSyntax {
    return $this->_separator;
  }

  public function withSeparator(EditableSyntax $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new self($this->_left_type, $value, $this->_right_type);
  }

  public function hasSeparator(): bool {
    return !$this->_separator->isMissing();
  }

  public function getSeparator(): ColonColonToken {
    return TypeAssert::isInstanceOf(ColonColonToken::class, $this->_separator);
  }

  public function getRightTypeUNTYPED(): EditableSyntax {
    return $this->_right_type;
  }

  public function withRightType(EditableSyntax $value): this {
    if ($value === $this->_right_type) {
      return $this;
    }
    return new self($this->_left_type, $this->_separator, $value);
  }

  public function hasRightType(): bool {
    return !$this->_right_type->isMissing();
  }

  public function getRightType(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_right_type);
  }
}
