<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f55d50c92eb13cfcfced73d6886b98a2>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class GenericTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_class_type;
  private EditableSyntax $_argument_list;

  public function __construct(
    EditableSyntax $class_type,
    EditableSyntax $argument_list,
  ) {
    parent::__construct('generic_type_specifier');
    $this->_class_type = $class_type;
    $this->_argument_list = $argument_list;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $class_type = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['generic_class_type'],
      $position,
      $source,
    );
    $position += $class_type->width();
    $argument_list = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['generic_argument_list'],
      $position,
      $source,
    );
    $position += $argument_list->width();
    return new self($class_type, $argument_list);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'class_type' => $this->_class_type;
    yield 'argument_list' => $this->_argument_list;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $class_type = $this->_class_type->rewrite($rewriter, $parents);
    $argument_list = $this->_argument_list->rewrite($rewriter, $parents);
    if (
      $class_type === $this->_class_type &&
      $argument_list === $this->_argument_list
    ) {
      return $this;
    }
    return new self($class_type, $argument_list);
  }

  public function getClassTypeUNTYPED(): EditableSyntax {
    return $this->_class_type;
  }

  public function withClassType(EditableSyntax $value): this {
    if ($value === $this->_class_type) {
      return $this;
    }
    return new self($value, $this->_argument_list);
  }

  public function hasClassType(): bool {
    return !$this->_class_type->is_missing();
  }

  public function getClassType(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_class_type);
  }

  public function getArgumentListUNTYPED(): EditableSyntax {
    return $this->_argument_list;
  }

  public function withArgumentList(EditableSyntax $value): this {
    if ($value === $this->_argument_list) {
      return $this;
    }
    return new self($this->_class_type, $value);
  }

  public function hasArgumentList(): bool {
    return !$this->_argument_list->is_missing();
  }

  public function getArgumentList(): TypeArguments {
    return TypeAssert::isInstanceOf(TypeArguments::class, $this->_argument_list);
  }
}
