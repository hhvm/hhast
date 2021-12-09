/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<32c92319f025e33ecb8b330835f0d03b>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class CatchClause extends Node {

  const string SYNTAX_KIND = 'catch_clause';

  private CatchToken $_keyword;
  private LeftParenToken $_left_paren;
  private SimpleTypeSpecifier $_type;
  private VariableToken $_variable;
  private RightParenToken $_right_paren;
  private CompoundStatement $_body;

  public function __construct(
    CatchToken $keyword,
    LeftParenToken $left_paren,
    SimpleTypeSpecifier $type,
    VariableToken $variable,
    RightParenToken $right_paren,
    CompoundStatement $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_type = $type;
    $this->_variable = $variable;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
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
      ($json['catch_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'CatchToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_paren = Node::fromJSON(
      ($json['catch_left_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LeftParenToken',
    );
    $left_paren = $left_paren as nonnull;
    $offset += $left_paren->getWidth();
    $type = Node::fromJSON(
      ($json['catch_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'SimpleTypeSpecifier',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $variable = Node::fromJSON(
      ($json['catch_variable']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'VariableToken',
    );
    $variable = $variable as nonnull;
    $offset += $variable->getWidth();
    $right_paren = Node::fromJSON(
      ($json['catch_right_paren']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RightParenToken',
    );
    $right_paren = $right_paren as nonnull;
    $offset += $right_paren->getWidth();
    $body = Node::fromJSON(
      ($json['catch_body']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'CompoundStatement',
    );
    $body = $body as nonnull;
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_paren,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $variable,
      /* HH_IGNORE_ERROR[4110] */ $right_paren,
      /* HH_IGNORE_ERROR[4110] */ $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'type' => $this->_type,
      'variable' => $this->_variable,
      'right_paren' => $this->_right_paren,
      'body' => $this->_body,
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
    $type = $rewriter($this->_type, $parents);
    $variable = $rewriter($this->_variable, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $body = $rewriter($this->_body, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $type === $this->_type &&
      $variable === $this->_variable &&
      $right_paren === $this->_right_paren &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static(
      $keyword as CatchToken,
      $left_paren as LeftParenToken,
      $type as SimpleTypeSpecifier,
      $variable as VariableToken,
      $right_paren as RightParenToken,
      $body as CompoundStatement,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(CatchToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_paren,
      $this->_type,
      $this->_variable,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return CatchToken
   */
  public function getKeyword(): CatchToken {
    return TypeAssert\instance_of(CatchToken::class, $this->_keyword);
  }

  /**
   * @return CatchToken
   */
  public function getKeywordx(): CatchToken {
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
      $this->_type,
      $this->_variable,
      $this->_right_paren,
      $this->_body,
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

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(SimpleTypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_variable,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasType(): bool {
    return true;
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getType(): SimpleTypeSpecifier {
    return TypeAssert\instance_of(SimpleTypeSpecifier::class, $this->_type);
  }

  /**
   * @return SimpleTypeSpecifier
   */
  public function getTypex(): SimpleTypeSpecifier {
    return $this->getType();
  }

  public function getVariableUNTYPED(): ?Node {
    return $this->_variable;
  }

  public function withVariable(VariableToken $value): this {
    if ($value === $this->_variable) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_type,
      $value,
      $this->_right_paren,
      $this->_body,
    );
  }

  public function hasVariable(): bool {
    return true;
  }

  /**
   * @return VariableToken
   */
  public function getVariable(): VariableToken {
    return TypeAssert\instance_of(VariableToken::class, $this->_variable);
  }

  /**
   * @return VariableToken
   */
  public function getVariablex(): VariableToken {
    return $this->getVariable();
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
      $this->_type,
      $this->_variable,
      $value,
      $this->_body,
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

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(CompoundStatement $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_paren,
      $this->_type,
      $this->_variable,
      $this->_right_paren,
      $value,
    );
  }

  public function hasBody(): bool {
    return true;
  }

  /**
   * @return CompoundStatement
   */
  public function getBody(): CompoundStatement {
    return TypeAssert\instance_of(CompoundStatement::class, $this->_body);
  }

  /**
   * @return CompoundStatement
   */
  public function getBodyx(): CompoundStatement {
    return $this->getBody();
  }
}
