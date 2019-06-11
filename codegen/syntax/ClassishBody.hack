/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<80d952c366c9abf0c03a44ed44e6fd11>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ClassishBody extends Node {

  const string SYNTAX_KIND = 'classish_body';

  private Node $_left_brace;
  private Node $_elements;
  private Node $_right_brace;

  public function __construct(
    Node $left_brace,
    Node $elements,
    Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_brace = $left_brace;
    $this->_elements = $elements;
    $this->_right_brace = $right_brace;
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
    $left_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_body_left_brace'],
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $offset += $left_brace->getWidth();
    $elements = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_body_elements'],
      $file,
      $offset,
      $source,
      'NodeList<IClassBodyDeclaration>',
    );
    $offset += $elements->getWidth();
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['classish_body_right_brace'],
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($left_brace, $elements, $right_brace, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_brace' => $this->_left_brace,
      'elements' => $this->_elements,
      'right_brace' => $this->_right_brace,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_brace = $rewriter($this->_left_brace, $parents);
    $elements = $rewriter($this->_elements, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $elements === $this->_elements &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static($left_brace, $elements, $right_brace);
  }

  public function getLeftBraceUNTYPED(): Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static($value, $this->_elements, $this->_right_brace);
  }

  public function hasLeftBrace(): bool {
    return !$this->_left_brace->isMissing();
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBrace(): LeftBraceToken {
    return TypeAssert\instance_of(LeftBraceToken::class, $this->_left_brace);
  }

  /**
   * @return LeftBraceToken
   */
  public function getLeftBracex(): LeftBraceToken {
    return $this->getLeftBrace();
  }

  public function getElementsUNTYPED(): Node {
    return $this->_elements;
  }

  public function withElements(Node $value): this {
    if ($value === $this->_elements) {
      return $this;
    }
    return new static($this->_left_brace, $value, $this->_right_brace);
  }

  public function hasElements(): bool {
    return !$this->_elements->isMissing();
  }

  /**
   * @return NodeList<ConstDeclaration> | NodeList<IClassBodyDeclaration> |
   * NodeList<MethodishDeclaration> | NodeList<IHasAttributeSpec> |
   * NodeList<PropertyDeclaration> | NodeList<RequireClause> |
   * NodeList<TraitUse> | NodeList<TraitUseConflictResolution> |
   * NodeList<TypeConstDeclaration> | NodeList<XHPClassAttributeDeclaration> |
   * null
   */
  public function getElements(): ?NodeList<IClassBodyDeclaration> {
    if ($this->_elements->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_elements);
  }

  /**
   * @return NodeList<ConstDeclaration> | NodeList<IClassBodyDeclaration> |
   * NodeList<MethodishDeclaration> | NodeList<IHasAttributeSpec> |
   * NodeList<PropertyDeclaration> | NodeList<RequireClause> |
   * NodeList<TraitUse> | NodeList<TraitUseConflictResolution> |
   * NodeList<TypeConstDeclaration> | NodeList<XHPClassAttributeDeclaration>
   */
  public function getElementsx(): NodeList<IClassBodyDeclaration> {
    return TypeAssert\not_null($this->getElements());
  }

  public function getRightBraceUNTYPED(): Node {
    return $this->_right_brace;
  }

  public function withRightBrace(Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static($this->_left_brace, $this->_elements, $value);
  }

  public function hasRightBrace(): bool {
    return !$this->_right_brace->isMissing();
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBrace(): RightBraceToken {
    return TypeAssert\instance_of(RightBraceToken::class, $this->_right_brace);
  }

  /**
   * @return RightBraceToken
   */
  public function getRightBracex(): RightBraceToken {
    return $this->getRightBrace();
  }
}
