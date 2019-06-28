/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5010a865dd1696c78d0171bd56a842ba>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class EvalExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'eval_expression';

  private Node $_keyword;
  private Node $_left_paren;
  private Node $_argument;
  private Node $_right_paren;

  public function __construct(
    Node $keyword,
    Node $left_paren,
    Node $argument,
    Node $right_paren,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_argument = $argument;
    $this->_right_paren = $right_paren;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['eval_keyword'],
      $file,
      $offset,
      $source,
      'EvalToken',
    );
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['eval_left_paren'],
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $offset += $left_paren->getWidth();
    $argument = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['eval_argument'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $argument->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['eval_right_paren'],
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $offset += $right_paren->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $left_paren,
      $argument,
      $right_paren,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'argument' => $this->_argument,
      'right_paren' => $this->_right_paren,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $left_paren = $rewriter($this->_left_paren, $parents);
    $argument = $rewriter($this->_argument, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $argument === $this->_argument &&
      $right_paren === $this->_right_paren
    ) {
      return $this;
    }
    return new static($keyword, $left_paren, $argument, $right_paren);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(EvalToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value ?? Missing(),
      $this->_left_paren,
      $this->_argument,
      $this->_right_paren,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return EvalToken
   */
  public function getKeyword(): EvalToken {
    return TypeAssert\instance_of(EvalToken::class, $this->_keyword);
  }

  /**
   * @return EvalToken
   */
  public function getKeywordx(): EvalToken {
    return $this->getKeyword();
  }

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(LeftParenToken $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value ?? Missing(),
      $this->_argument,
      $this->_right_paren,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
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

  public function getArgumentUNTYPED(): Node {
    return $this->_argument;
  }

  public function withArgument(IExpression $value): this {
    if ($value === $this->_argument) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value ?? Missing(),
      $this->_right_paren,
    );
  }

  public function hasArgument(): bool {
    return !$this->_argument->isMissing();
  }

  /**
   * @return BinaryExpression | FunctionCallExpression | LiteralExpression |
   * VariableExpression
   */
  public function getArgument(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_argument);
  }

  /**
   * @return BinaryExpression | FunctionCallExpression | LiteralExpression |
   * VariableExpression
   */
  public function getArgumentx(): IExpression {
    return $this->getArgument();
  }

  public function getRightParenUNTYPED(): Node {
    return $this->_right_paren;
  }

  public function withRightParen(RightParenToken $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_argument,
      $value ?? Missing(),
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
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
