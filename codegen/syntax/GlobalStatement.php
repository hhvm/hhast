<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<04a3ae0497b30e978b5182556dbe5da4>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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
    int $position,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['global_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $variables = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['global_variables'],
      $position,
      $source,
    );
    $position += $variables->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['global_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($keyword, $variables, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'variables' => $this->_variables,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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
    return new self($keyword, $variables, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_variables, $this->_semicolon);
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

  public function getVariablesUNTYPED(): EditableNode {
    return $this->_variables;
  }

  public function withVariables(EditableNode $value): this {
    if ($value === $this->_variables) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function hasVariables(): bool {
    return !$this->_variables->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getVariables(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_variables);
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_variables, $value);
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
}
