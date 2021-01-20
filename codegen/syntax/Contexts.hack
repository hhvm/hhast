/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<076067d6803f6c4904beff394c687113>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class Contexts extends Node {

  const string SYNTAX_KIND = 'contexts';

  private LeftBracketToken $_left_bracket;
  private ?NodeList<ListItem<ITypeSpecifier>> $_types;
  private RightBracketToken $_right_bracket;

  public function __construct(
    LeftBracketToken $left_bracket,
    ?NodeList<ListItem<ITypeSpecifier>> $types,
    RightBracketToken $right_bracket,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_bracket = $left_bracket;
    $this->_types = $types;
    $this->_right_bracket = $right_bracket;
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
    $left_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['contexts_left_bracket'],
      $file,
      $offset,
      $source,
      'LeftBracketToken',
    );
    $left_bracket = $left_bracket as nonnull;
    $offset += $left_bracket->getWidth();
    $types = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['contexts_types'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'NodeList<ListItem<ITypeSpecifier>>',
    );
    $offset += $types?->getWidth() ?? 0;
    $right_bracket = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['contexts_right_bracket'],
      $file,
      $offset,
      $source,
      'RightBracketToken',
    );
    $right_bracket = $right_bracket as nonnull;
    $offset += $right_bracket->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_bracket,
      /* HH_IGNORE_ERROR[4110] */ $types,
      /* HH_IGNORE_ERROR[4110] */ $right_bracket,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_bracket' => $this->_left_bracket,
      'types' => $this->_types,
      'right_bracket' => $this->_right_bracket,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_bracket = $rewriter($this->_left_bracket, $parents);
    $types = $this->_types === null ? null : $rewriter($this->_types, $parents);
    $right_bracket = $rewriter($this->_right_bracket, $parents);
    if (
      $left_bracket === $this->_left_bracket &&
      $types === $this->_types &&
      $right_bracket === $this->_right_bracket
    ) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $left_bracket,
      /* HH_FIXME[4110] use `as` */ $types,
      /* HH_FIXME[4110] use `as` */ $right_bracket,
    );
  }

  public function getLeftBracketUNTYPED(): ?Node {
    return $this->_left_bracket;
  }

  public function withLeftBracket(LeftBracketToken $value): this {
    if ($value === $this->_left_bracket) {
      return $this;
    }
    return new static($value, $this->_types, $this->_right_bracket);
  }

  public function hasLeftBracket(): bool {
    return $this->_left_bracket !== null;
  }

  /**
   * @return LeftBracketToken
   */
  public function getLeftBracket(): LeftBracketToken {
    return TypeAssert\instance_of(
      LeftBracketToken::class,
      $this->_left_bracket,
    );
  }

  /**
   * @return LeftBracketToken
   */
  public function getLeftBracketx(): LeftBracketToken {
    return $this->getLeftBracket();
  }

  public function getTypesUNTYPED(): ?Node {
    return $this->_types;
  }

  public function withTypes(?NodeList<ListItem<ITypeSpecifier>> $value): this {
    if ($value === $this->_types) {
      return $this;
    }
    return new static($this->_left_bracket, $value, $this->_right_bracket);
  }

  public function hasTypes(): bool {
    return $this->_types !== null;
  }

  /**
   * @return NodeList<ListItem<FunctionCtxTypeSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> | NodeList<ListItem<TypeConstant>>
   * | null
   */
  public function getTypes(): ?NodeList<ListItem<ITypeSpecifier>> {
    return $this->_types;
  }

  /**
   * @return NodeList<ListItem<FunctionCtxTypeSpecifier>> |
   * NodeList<ListItem<ITypeSpecifier>> |
   * NodeList<ListItem<SimpleTypeSpecifier>> | NodeList<ListItem<TypeConstant>>
   */
  public function getTypesx(): NodeList<ListItem<ITypeSpecifier>> {
    return TypeAssert\not_null($this->getTypes());
  }

  public function getRightBracketUNTYPED(): ?Node {
    return $this->_right_bracket;
  }

  public function withRightBracket(RightBracketToken $value): this {
    if ($value === $this->_right_bracket) {
      return $this;
    }
    return new static($this->_left_bracket, $this->_types, $value);
  }

  public function hasRightBracket(): bool {
    return $this->_right_bracket !== null;
  }

  /**
   * @return RightBracketToken
   */
  public function getRightBracket(): RightBracketToken {
    return TypeAssert\instance_of(
      RightBracketToken::class,
      $this->_right_bracket,
    );
  }

  /**
   * @return RightBracketToken
   */
  public function getRightBracketx(): RightBracketToken {
    return $this->getRightBracket();
  }
}
