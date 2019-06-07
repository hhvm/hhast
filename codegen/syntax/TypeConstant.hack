/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<630f1fb8b66a4814196ac1680341a031>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class TypeConstant extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'type_constant';

  private Node $_left_type;
  private Node $_separator;
  private Node $_right_type;

  public function __construct(
    Node $left_type,
    Node $separator,
    Node $right_type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_type = $left_type;
    $this->_separator = $separator;
    $this->_right_type = $right_type;
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
    $left_type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_constant_left_type'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $left_type->getWidth();
    $separator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_constant_separator'],
      $file,
      $offset,
      $source,
      'ColonColonToken',
    );
    $offset += $separator->getWidth();
    $right_type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['type_constant_right_type'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $offset += $right_type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_type, $separator, $right_type, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_type' => $this->_left_type,
      'separator' => $this->_separator,
      'right_type' => $this->_right_type,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_type = $rewriter($this->_left_type, $parents);
    $separator = $rewriter($this->_separator, $parents);
    $right_type = $rewriter($this->_right_type, $parents);
    if (
      $left_type === $this->_left_type &&
      $separator === $this->_separator &&
      $right_type === $this->_right_type
    ) {
      return $this;
    }
    return new static($left_type, $separator, $right_type);
  }

  public function getLeftTypeUNTYPED(): Node {
    return $this->_left_type;
  }

  public function withLeftType(Node $value): this {
    if ($value === $this->_left_type) {
      return $this;
    }
    return new static($value, $this->_separator, $this->_right_type);
  }

  public function hasLeftType(): bool {
    return !$this->_left_type->isMissing();
  }

  /**
   * @return NameToken | ParentToken | SelfToken | ThisToken | TypeConstant
   */
  public function getLeftType(): Node {
    return $this->_left_type;
  }

  /**
   * @return NameToken | ParentToken | SelfToken | ThisToken | TypeConstant
   */
  public function getLeftTypex(): Node {
    return $this->getLeftType();
  }

  public function getSeparatorUNTYPED(): Node {
    return $this->_separator;
  }

  public function withSeparator(Node $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new static($this->_left_type, $value, $this->_right_type);
  }

  public function hasSeparator(): bool {
    return !$this->_separator->isMissing();
  }

  /**
   * @return ColonColonToken
   */
  public function getSeparator(): ColonColonToken {
    return TypeAssert\instance_of(ColonColonToken::class, $this->_separator);
  }

  /**
   * @return ColonColonToken
   */
  public function getSeparatorx(): ColonColonToken {
    return $this->getSeparator();
  }

  public function getRightTypeUNTYPED(): Node {
    return $this->_right_type;
  }

  public function withRightType(Node $value): this {
    if ($value === $this->_right_type) {
      return $this;
    }
    return new static($this->_left_type, $this->_separator, $value);
  }

  public function hasRightType(): bool {
    return !$this->_right_type->isMissing();
  }

  /**
   * @return NameToken
   */
  public function getRightType(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_right_type);
  }

  /**
   * @return NameToken
   */
  public function getRightTypex(): NameToken {
    return $this->getRightType();
  }
}
