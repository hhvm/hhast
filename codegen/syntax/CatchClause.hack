/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<69f9202d52b4fff9c27b01b5f6a36a62>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class CatchClause extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_left_paren;
  private EditableNode $_type;
  private EditableNode $_variable;
  private EditableNode $_right_paren;
  private EditableNode $_body;

  public function __construct(
    EditableNode $keyword,
    EditableNode $left_paren,
    EditableNode $type,
    EditableNode $variable,
    EditableNode $right_paren,
    EditableNode $body,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_type = $type;
    $this->_variable = $variable;
    $this->_right_paren = $right_paren;
    $this->_body = $body;
    parent::__construct('catch_clause', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['catch_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $left_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['catch_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['catch_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $variable = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['catch_variable'],
      $file,
      $offset,
      $source,
    );
    $offset += $variable->getWidth();
    $right_paren = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['catch_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['catch_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $left_paren,
      $type,
      $variable,
      $right_paren,
      $body,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'left_paren' => $this->_left_paren,
      'type' => $this->_type,
      'variable' => $this->_variable,
      'right_paren' => $this->_right_paren,
      'body' => $this->_body,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $variable = $this->_variable->rewrite($rewriter, $parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
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
      $keyword,
      $left_paren,
      $type,
      $variable,
      $right_paren,
      $body,
    );
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
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
    return !$this->_keyword->isMissing();
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

  public function getLeftParenUNTYPED(): EditableNode {
    return $this->_left_paren;
  }

  public function withLeftParen(EditableNode $value): this {
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

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
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
    return !$this->_type->isMissing();
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

  public function getVariableUNTYPED(): EditableNode {
    return $this->_variable;
  }

  public function withVariable(EditableNode $value): this {
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
    return !$this->_variable->isMissing();
  }

  /**
   * @return NameToken | VariableToken
   */
  public function getVariable(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_variable);
  }

  /**
   * @return NameToken | VariableToken
   */
  public function getVariablex(): EditableToken {
    return $this->getVariable();
  }

  public function getRightParenUNTYPED(): EditableNode {
    return $this->_right_paren;
  }

  public function withRightParen(EditableNode $value): this {
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

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
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
    return !$this->_body->isMissing();
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
