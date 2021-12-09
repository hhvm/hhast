/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5c019ba73df8de236d172bc7cc3875f7>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ClassishBody extends Node {

  const string SYNTAX_KIND = 'classish_body';

  private LeftBraceToken $_left_brace;
  private ?NodeList<IClassBodyDeclaration> $_elements;
  private RightBraceToken $_right_brace;

  public function __construct(
    LeftBraceToken $left_brace,
    ?NodeList<IClassBodyDeclaration> $elements,
    RightBraceToken $right_brace,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_brace = $left_brace;
    $this->_elements = $elements;
    $this->_right_brace = $right_brace;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $left_brace = Node::fromJSON(
      ($json['classish_body_left_brace']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftBraceToken',
    );
    $left_brace = $left_brace as nonnull;
    $offset += $left_brace->getWidth();
    $elements = Node::fromJSON(
      ($json['classish_body_elements'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<IClassBodyDeclaration>',
    );
    $offset += $elements?->getWidth() ?? 0;
    $right_brace = Node::fromJSON(
      ($json['classish_body_right_brace']) as dict<_, _>,
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
      /* HH_IGNORE_ERROR[4110] */ $elements,
      /* HH_IGNORE_ERROR[4110] */ $right_brace,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_brace' => $this->_left_brace,
      'elements' => $this->_elements,
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
    $elements =
      $this->_elements === null ? null : $rewriter($this->_elements, $parents);
    $right_brace = $rewriter($this->_right_brace, $parents);
    if (
      $left_brace === $this->_left_brace &&
      $elements === $this->_elements &&
      $right_brace === $this->_right_brace
    ) {
      return $this;
    }
    return new static(
      $left_brace as LeftBraceToken,
      /* HH_FIXME[4110] ?NodeList<IClassBodyDeclaration> may not be enforceable */ $elements,
      $right_brace as RightBraceToken,
    );
  }

  public function getLeftBraceUNTYPED(): ?Node {
    return $this->_left_brace;
  }

  public function withLeftBrace(LeftBraceToken $value): this {
    if ($value === $this->_left_brace) {
      return $this;
    }
    return new static($value, $this->_elements, $this->_right_brace);
  }

  public function hasLeftBrace(): bool {
    return true;
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

  public function getElementsUNTYPED(): ?Node {
    return $this->_elements;
  }

  public function withElements(?NodeList<IClassBodyDeclaration> $value): this {
    if ($value === $this->_elements) {
      return $this;
    }
    return new static($this->_left_brace, $value, $this->_right_brace);
  }

  public function hasElements(): bool {
    return $this->_elements !== null;
  }

  /**
   * @return NodeList<ConstDeclaration> | NodeList<IClassBodyDeclaration> |
   * NodeList<ContextConstDeclaration> | NodeList<MethodishDeclaration> |
   * NodeList<IHasAttributeSpec> | NodeList<PropertyDeclaration> |
   * NodeList<RequireClause> | NodeList<TraitUse> |
   * NodeList<TraitUseConflictResolution> | NodeList<TypeConstDeclaration> |
   * NodeList<XHPChildrenDeclaration> | NodeList<XHPClassAttributeDeclaration>
   * | null
   */
  public function getElements(): ?NodeList<IClassBodyDeclaration> {
    return $this->_elements;
  }

  /**
   * @return NodeList<ConstDeclaration> | NodeList<IClassBodyDeclaration> |
   * NodeList<ContextConstDeclaration> | NodeList<MethodishDeclaration> |
   * NodeList<IHasAttributeSpec> | NodeList<PropertyDeclaration> |
   * NodeList<RequireClause> | NodeList<TraitUse> |
   * NodeList<TraitUseConflictResolution> | NodeList<TypeConstDeclaration> |
   * NodeList<XHPChildrenDeclaration> | NodeList<XHPClassAttributeDeclaration>
   */
  public function getElementsx(): NodeList<IClassBodyDeclaration> {
    return TypeAssert\not_null($this->getElements());
  }

  public function getRightBraceUNTYPED(): ?Node {
    return $this->_right_brace;
  }

  public function withRightBrace(RightBraceToken $value): this {
    if ($value === $this->_right_brace) {
      return $this;
    }
    return new static($this->_left_brace, $this->_elements, $value);
  }

  public function hasRightBrace(): bool {
    return true;
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
