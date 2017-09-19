<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7ae8f629d268bea35d1a9f3b63efc95d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class GenericTypeSpecifier extends EditableNode {

  private EditableNode $_class_type;
  private EditableNode $_argument_list;

  public function __construct(
    EditableNode $class_type,
    EditableNode $argument_list,
  ) {
    parent::__construct('generic_type_specifier');
    $this->_class_type = $class_type;
    $this->_argument_list = $argument_list;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $class_type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['generic_class_type'],
      $position,
      $source,
    );
    $position += $class_type->getWidth();
    $argument_list = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['generic_argument_list'],
      $position,
      $source,
    );
    $position += $argument_list->getWidth();
    return new self($class_type, $argument_list);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    yield 'class_type' => $this->_class_type;
    yield 'argument_list' => $this->_argument_list;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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

  public function getClassTypeUNTYPED(): EditableNode {
    return $this->_class_type;
  }

  public function withClassType(EditableNode $value): this {
    if ($value === $this->_class_type) {
      return $this;
    }
    return new self($value, $this->_argument_list);
  }

  public function hasClassType(): bool {
    return !$this->_class_type->isMissing();
  }

  /**
   * @returns NameToken | QualifiedNameExpression | QualifiedNameToken |
   * XHPClassNameToken
   */
  public function getClassType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_class_type);
  }

  public function getArgumentListUNTYPED(): EditableNode {
    return $this->_argument_list;
  }

  public function withArgumentList(EditableNode $value): this {
    if ($value === $this->_argument_list) {
      return $this;
    }
    return new self($this->_class_type, $value);
  }

  public function hasArgumentList(): bool {
    return !$this->_argument_list->isMissing();
  }

  /**
   * @returns TypeArguments
   */
  public function getArgumentList(): TypeArguments {
    return TypeAssert\instance_of(TypeArguments::class, $this->_argument_list);
  }
}
