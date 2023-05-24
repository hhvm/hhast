/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<de74dfdc120986891e9c115ee6b7953c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class IssetExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'isset_expression';

  private IssetToken $_keyword;
  private LeftParenToken $_left_paren;
  private NodeList<ListItem<IExpression>> $_argument_list;
  private RightParenToken $_right_paren;

  public function __construct(
    IssetToken $keyword,
    LeftParenToken $left_paren,
    NodeList<ListItem<IExpression>> $argument_list,
    RightParenToken $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_argument_list = $argument_list;
    $this->_right_paren = $right_paren;
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
    $keyword = Node::fromJSON(
      ($json['isset_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IssetToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      ($json['isset_left_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $argument_list = Node::fromJSON(
      ($json['isset_argument_list']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<IExpression>>',
    );
    $argument_list = $argument_list as nonnull;
    $offset += $argument_list->getWidth();
    $right_paren = Node::fromJSON(
      ($json['isset_right_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword as IssetToken,
      $left_paren as LeftParenToken,
      \HH\FIXME\UNSAFE_CAST<NodeList<Node>, NodeList<ListItem<IExpression>>>(
        $argument_list as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_paren as RightParenToken,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'argument_list' => $this->_argument_list,
      'right_paren' => $this->_right_paren,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $argument_list = $rewriter($this->_argument_list, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $argument_list === $this->_argument_list &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static(
      $keyword as IssetToken,
      $left_paren as LeftParenToken,
      \HH\FIXME\UNSAFE_CAST<NodeList<Node>, NodeList<ListItem<IExpression>>>(
        $argument_list as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $right_paren as RightParenToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(IssetToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_argument_list,
      $this->_right_paren,
    );
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return IssetToken
   */
  public function getKeyword(): IssetToken {
    return TypeAssert\instance_of(IssetToken::class, $this->_keyword);
  }

  /**
   * @return IssetToken
   */
  public function getKeywordx(): IssetToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): ?Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_argument_list,
      $this->_right_paren,
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

  public function getArgumentListUNTYPED(): ?Node {
    return $this->_argument_list;
  }

  public function withArgumentList(
    NodeList<ListItem<IExpression>> $value,
  ): this {
    if ($value === $this->_argument_list) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
    );
  }

  public function hasArgumentList(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ParenthesizedExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<SubscriptExpression>> |
   * NodeList<ListItem<VariableExpression>>
   */
  public function getArgumentList(): NodeList<ListItem<IExpression>> {
    return TypeAssert\instance_of(NodeList::class, $this->_argument_list);
  }

  /**
   * @return NodeList<ListItem<FunctionCallExpression>> |
   * NodeList<ListItem<IExpression>> |
   * NodeList<ListItem<MemberSelectionExpression>> |
   * NodeList<ListItem<ParenthesizedExpression>> |
   * NodeList<ListItem<ScopeResolutionExpression>> |
   * NodeList<ListItem<SubscriptExpression>> |
   * NodeList<ListItem<VariableExpression>>
   */
  public function getArgumentListx(): NodeList<ListItem<IExpression>> {
    return $this->getArgumentList();
  }

  public function getRightParenUNTYPED(): ?Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_argument_list,
      $value,
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
}
