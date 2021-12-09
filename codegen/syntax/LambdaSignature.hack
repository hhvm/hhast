/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<78fcbd02a02de796f774ca5978b1a075>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class LambdaSignature extends Node implements ILambdaSignature {

  const string SYNTAX_KIND = 'lambda_signature';

  private LeftParenToken $_left_paren;
  private ?NodeList<ListItem<IParameter>> $_parameters;
  private RightParenToken $_right_paren;
  private ?Contexts $_contexts;
  private ?ColonToken $_colon;
  private ?ReadonlyToken $_readonly_return;
  private ?ITypeSpecifier $_type;

  public function __construct(
    LeftParenToken $left_paren,
    ?NodeList<ListItem<IParameter>> $parameters,
    RightParenToken $right_paren,
    ?Contexts $contexts,
    ?ColonToken $colon,
    ?ReadonlyToken $readonly_return,
    ?ITypeSpecifier $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_paren = $left_paren;
    $this->_parameters = $parameters;
    $this->_right_paren = $right_paren;
    $this->_contexts = $contexts;
    $this->_colon = $colon;
    $this->_readonly_return = $readonly_return;
    $this->_type = $type;
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
    $left_paren = Node::fromJSON(
      ($json['lambda_left_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $parameters = Node::fromJSON(
      ($json['lambda_parameters'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IParameter>>',
    );
    $offset += $parameters?->getWidth() ?? 0;
    $right_paren = Node::fromJSON(
      ($json['lambda_right_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $contexts = Node::fromJSON(
      ($json['lambda_contexts'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Contexts',
    );
    $offset += $contexts?->getWidth() ?? 0;
    $colon = Node::fromJSON(
      ($json['lambda_colon'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $offset += $colon?->getWidth() ?? 0;
    $readonly_return = Node::fromJSON(
      ($json['lambda_readonly_return'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'ReadonlyToken',
    );
    $offset += $readonly_return?->getWidth() ?? 0;
    $type = Node::fromJSON(
      ($json['lambda_type'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $parameters,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $contexts,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      /* HH_IGNORE_ERROR[4110] */ $readonly_return,
      /* HH_IGNORE_ERROR[4110] */ $type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_paren' => $this->_left_paren,
      'parameters' => $this->_parameters,
      'right_paren' => $this->_right_paren,
      'contexts' => $this->_contexts,
      'colon' => $this->_colon,
      'readonly_return' => $this->_readonly_return,
      'type' => $this->_type,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_paren = $rewriter($this->_left_paren, $parents);
    $parameters = $this->_parameters === null
      ? null
      : $rewriter($this->_parameters, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $contexts =
      $this->_contexts === null ? null : $rewriter($this->_contexts, $parents);
    $colon = $this->_colon === null ? null : $rewriter($this->_colon, $parents);
    $readonly_return = $this->_readonly_return === null
      ? null
      : $rewriter($this->_readonly_return, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $parameters === $this->_parameters &&
      $right_paren === $this->_right_paren &&
      $contexts === $this->_contexts &&
      $colon === $this->_colon &&
      $readonly_return === $this->_readonly_return &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new static(
      $left_paren as LeftParenToken,
      /* HH_FIXME[4110] ?NodeList<ListItem<IParameter>> may not be enforceable */ $parameters,
      $right_paren as RightParenToken,
      $contexts as ?Contexts,
      $colon as ?ColonToken,
      $readonly_return as ?ReadonlyToken,
      $type as ?ITypeSpecifier,
    );
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $value,
      $this->_parameters,
      $this->_right_paren,
      $this->_contexts,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
    );
  }

  public function hasLeftParen(): bool {
    return true;
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return $this->getLeftParen();
  }

  public function getParametersUNTYPED(): ?Node {
    return $this->_parameters;
  }

  public function withParameters(?NodeList<ListItem<IParameter>> $value): this {
    if ($value === $this->_parameters) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_contexts,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
    );
  }

  public function hasParameters(): bool {
    return $this->_parameters !== null;
  }

  /**
   * @return NodeList<ListItem<ParameterDeclaration>> |
   * NodeList<ListItem<VariadicParameter>> | null
   */
  public function getParameters(): ?NodeList<ListItem<IParameter>> {
    return $this->_parameters;
  }

  /**
   * @return NodeList<ListItem<ParameterDeclaration>> |
   * NodeList<ListItem<VariadicParameter>>
   */
  public function getParametersx(): NodeList<ListItem<IParameter>> {
    return TypeAssert\not_null($this->getParameters());
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_parameters,
      $value,
      $this->_contexts,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
    );
  }

  public function hasRightParen(): bool {
    return true;
  }

  /**
   * @return RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return $this->getRightParen();
  }

  public function getContextsUNTYPED(): ?Node {
    return $this->_contexts;
  }

  public function withContexts(?Contexts $value): this {
    if ($value === $this->_contexts) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $value,
      $this->_colon,
      $this->_readonly_return,
      $this->_type,
    );
  }

  public function hasContexts(): bool {
    return $this->_contexts !== null;
  }

  /**
   * @return Contexts | null
   */
  public function getContexts(): ?Contexts {
    return $this->_contexts;
  }

  /**
   * @return Contexts
   */
  public function getContextsx(): Contexts {
    return TypeAssert\not_null($this->getContexts());
  }

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(?ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_contexts,
      $value,
      $this->_readonly_return,
      $this->_type,
    );
  }

  public function hasColon(): bool {
    return $this->_colon !== null;
  }

  /**
   * @return null | ColonToken
   */
  public function getColon(): ?ColonToken {
    return $this->_colon;
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return TypeAssert\not_null($this->getColon());
  }

  public function getReadonlyReturnUNTYPED(): ?Node {
    return $this->_readonly_return;
  }

  public function withReadonlyReturn(?ReadonlyToken $value): this {
    if ($value === $this->_readonly_return) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_contexts,
      $this->_colon,
      $value,
      $this->_type,
    );
  }

  public function hasReadonlyReturn(): bool {
    return $this->_readonly_return !== null;
  }

  /**
   * @return null | ReadonlyToken
   */
  public function getReadonlyReturn(): ?ReadonlyToken {
    return $this->_readonly_return;
  }

  /**
   * @return ReadonlyToken
   */
  public function getReadonlyReturnx(): ReadonlyToken {
    return TypeAssert\not_null($this->getReadonlyReturn());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_contexts,
      $this->_colon,
      $this->_readonly_return,
      $value,
    );
  }

  public function hasType(): bool {
    return $this->_type !== null;
  }

  /**
   * @return GenericTypeSpecifier | KeysetTypeSpecifier | null |
   * SimpleTypeSpecifier
   */
  public function getType(): ?ITypeSpecifier {
    return $this->_type;
  }

  /**
   * @return GenericTypeSpecifier | KeysetTypeSpecifier | SimpleTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return TypeAssert\not_null($this->getType());
  }
}
