/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3e68678d56698c046f309c928ca615b8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class GenericTypeSpecifier
  extends Node
  implements ISimpleCreationSpecifier, ITypeSpecifier {

  const string SYNTAX_KIND = 'generic_type_specifier';

  private Node $_class_type;
  private Node $_argument_list;

  public function __construct(
    Node $class_type,
    Node $argument_list,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_class_type = $class_type;
    $this->_argument_list = $argument_list;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $class_type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['generic_class_type'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $class_type->getWidth();
    $argument_list = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['generic_argument_list'],
      $file,
      $offset,
      $source,
      'TypeArguments',
    );
    $offset += $argument_list->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($class_type, $argument_list, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'class_type' => $this->_class_type,
      'argument_list' => $this->_argument_list,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $class_type = $rewriter($this->_class_type, $parents);
    $argument_list = $rewriter($this->_argument_list, $parents);
    if (
      $class_type === $this->_class_type &&
      $argument_list === $this->_argument_list
    ) {
      return $this;
    }
    return new static($class_type, $argument_list);
  }

  public function getClassTypeUNTYPED(): Node {
    return $this->_class_type;
  }

  public function withClassType(Node $value): this {
    if ($value === $this->_class_type) {
      return $this;
    }
    return new static($value ?? Missing(), $this->_argument_list);
  }

  public function hasClassType(): bool {
    return !$this->_class_type->isMissing();
  }

  /**
   * @return QualifiedName | XHPClassNameToken | NameToken | StringToken
   */
  public function getClassType(): Node {
    return $this->_class_type;
  }

  /**
   * @return QualifiedName | XHPClassNameToken | NameToken | StringToken
   */
  public function getClassTypex(): Node {
    return $this->getClassType();
  }

  public function getArgumentListUNTYPED(): Node {
    return $this->_argument_list;
  }

  public function withArgumentList(TypeArguments $value): this {
    if ($value === $this->_argument_list) {
      return $this;
    }
    return new static($this->_class_type, $value ?? Missing());
  }

  public function hasArgumentList(): bool {
    return !$this->_argument_list->isMissing();
  }

  /**
   * @return TypeArguments
   */
  public function getArgumentList(): TypeArguments {
    return TypeAssert\instance_of(TypeArguments::class, $this->_argument_list);
  }

  /**
   * @return TypeArguments
   */
  public function getArgumentListx(): TypeArguments {
    return $this->getArgumentList();
  }
}
