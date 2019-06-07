/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a04291c78f6bd9f23074270f4e2a2625>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class NamespaceBody extends Node implements INamespaceBody {

  const string SYNTAX_KIND = 'namespace_body';

  private Node $_left_brace;
  private Node $_declarations;
  private Node $_right_brace;

  public function __construct(
    Node $left_brace,
    Node $declarations,
    Node $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_brace = $left_brace;
    $this->_declarations = $declarations;
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
      /* HH_FIXME[4110] */ $json['namespace_left_brace'],
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $offset += $left_brace->getWidth();
    $declarations = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_declarations'],
      $file,
      $offset,
      $source,
      'NodeList<Node>',
    );
    $offset += $declarations->getWidth();
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_right_brace'],
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
    return new static($left_brace, $declarations, $right_brace, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_brace' => $this->_left_brace,
      'declarations' => $this->_declarations,
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
    $declarations = $rewriter($this->_declarations, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $declarations === $this->_declarations &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static($left_brace, $declarations, $right_brace);
  }

  public function getLeftBraceUNTYPED(): Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(Node $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static($value, $this->_declarations, $this->_right_brace);
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

  public function getDeclarationsUNTYPED(): Node {
    return $this->_declarations;
  }

  public function withDeclarations(Node $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new static($this->_left_brace, $value, $this->_right_brace);
  }

  public function hasDeclarations(): bool {
    return !$this->_declarations->isMissing();
  }

  /**
   * @return NodeList<Node> | NodeList<ClassishDeclaration> |
   * NodeList<IHasAttributeSpec> | NodeList<ConstDeclaration> |
   * NodeList<EchoStatement> | NodeList<IStatement> | NodeList<EnumDeclaration>
   * | NodeList<ExpressionStatement> | NodeList<ForeachStatement> |
   * NodeList<FunctionDeclaration> | NodeList<InclusionDirective> |
   * NodeList<NamespaceGroupUseDeclaration> |
   * NodeList<INamespaceUseDeclaration> | NodeList<NamespaceUseDeclaration> |
   * null
   */
  public function getDeclarations(): ?NodeList<Node> {
    if ($this->_declarations->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_declarations);
  }

  /**
   * @return NodeList<Node> | NodeList<ClassishDeclaration> |
   * NodeList<IHasAttributeSpec> | NodeList<ConstDeclaration> |
   * NodeList<EchoStatement> | NodeList<IStatement> | NodeList<EnumDeclaration>
   * | NodeList<ExpressionStatement> | NodeList<ForeachStatement> |
   * NodeList<FunctionDeclaration> | NodeList<InclusionDirective> |
   * NodeList<NamespaceGroupUseDeclaration> |
   * NodeList<INamespaceUseDeclaration> | NodeList<NamespaceUseDeclaration>
   */
  public function getDeclarationsx(): NodeList<Node> {
    return TypeAssert\not_null($this->getDeclarations());
  }

  public function getRightBraceUNTYPED(): Node {
    return $this->_right_brace;
  }

  public function withRightBrace(Node $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static($this->_left_brace, $this->_declarations, $value);
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
