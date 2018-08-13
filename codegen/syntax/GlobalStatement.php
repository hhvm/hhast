<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<48387d2ff5f84554544861925d4578ae>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class GlobalStatement extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_variables;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $variables,
    EditableNode $semicolon,
  ) {
    parent::__construct('global_statement');
    $this->_keyword = $keyword;
    $this->_variables = $variables;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['global_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $variables = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['global_variables'],
      $file,
      $offset,
      $source,
    );
    $offset += $variables->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['global_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new static($keyword, $variables, $semicolon);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'variables' => $this->_variables,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $variables = $this->_variables->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $variables === $this->_variables &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($keyword, $variables, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_variables, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns GlobalToken
   */
  public function getKeyword(): GlobalToken {
    return TypeAssert\instance_of(GlobalToken::class, $this->_keyword);
  }

  /**
   * @returns GlobalToken
   */
  public function getKeywordx(): GlobalToken {
    return $this->getKeyword();
  }

  public function getVariablesUNTYPED(): EditableNode {
    return $this->_variables;
  }

  public function withVariables(EditableNode $value): this {
    if ($value === $this->_variables) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasVariables(): bool {
    return !$this->_variables->isMissing();
  }

  /**
   * @returns EditableList<PrefixUnaryExpression> | EditableList<VariableToken>
   */
  public function getVariables(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_variables);
  }

  /**
   * @returns EditableList<PrefixUnaryExpression> | EditableList<VariableToken>
   */
  public function getVariablesx(): EditableList<EditableNode> {
    return $this->getVariables();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_variables, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
