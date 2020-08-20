/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<d8f1e351e292f1f6dd05ed597c5e1188>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class NamespaceBody extends Node implements INamespaceBody {

  const string SYNTAX_KIND = 'namespace_body';

  private LeftBraceToken $_left_brace;
  private ?NodeList<Node> $_declarations;
  private RightBraceToken $_right_brace;

  public function __construct(
    LeftBraceToken $left_brace,
    ?NodeList<Node> $declarations,
    RightBraceToken $right_brace,
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
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $declarations = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_declarations'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<Node>',
    );
    $offset += $declarations?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['namespace_right_brace'],
      $file,
      $offset,
      $source,
      'RightBraceToken',
    );
    $right_brace = $right_brace as nonnull;
    $offset += $right_brace->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_brace,
      /* HH_IGNORE_ERROR[4110] */ $declarations,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_brace' => $this->_left_brace,
      'declarations' => $this->_declarations,
      'right_brace' => $this->_right_brace,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_brace = $rewriter($this->_left_brace, $parents);
    $declarations = $this->_declarations === null
      ? null
      : $rewriter($this->_declarations, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $declarations === $this->_declarations &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $left_brace,
      /* HH_FIXME[4110] use `as` */ $declarations,
      /* HH_FIXME[4110] use `as` */ $right_brace,
    );
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static($value, $this->_declarations, $this->_right_brace);
  }

  public function hasLeftBrace(): bool {
    return $this->_left_brace !== null;
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

  public function getDeclarationsUNTYPED(): ?Node {
    return $this->_declarations;
  }

  public function withDeclarations(?NodeList<Node> $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new static($this->_left_brace, $value, $this->_right_brace);
  }

  public function hasDeclarations(): bool {
    return $this->_declarations !== null;
  }

  /**
   * @return NodeList<AliasDeclaration> | NodeList<Node> |
   * NodeList<IHasAttributeSpec> | NodeList<ClassishDeclaration> |
   * NodeList<ConstDeclaration> | NodeList<EnumDeclaration> |
   * NodeList<FunctionDeclaration> | NodeList<NamespaceGroupUseDeclaration> |
   * NodeList<INamespaceUseDeclaration> | NodeList<NamespaceUseDeclaration> |
   * null
   */
  public function getDeclarations(): ?NodeList<Node> {
    return $this->_declarations;
  }

  /**
   * @return NodeList<AliasDeclaration> | NodeList<Node> |
   * NodeList<IHasAttributeSpec> | NodeList<ClassishDeclaration> |
   * NodeList<ConstDeclaration> | NodeList<EnumDeclaration> |
   * NodeList<FunctionDeclaration> | NodeList<NamespaceGroupUseDeclaration> |
   * NodeList<INamespaceUseDeclaration> | NodeList<NamespaceUseDeclaration>
   */
  public function getDeclarationsx(): NodeList<Node> {
    return TypeAssert\not_null($this->getDeclarations());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static($this->_left_brace, $this->_declarations, $value);
  }

  public function hasRightBrace(): bool {
    return $this->_right_brace !== null;
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
