<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9896f323817e6f2a4018fe1ab83ca9ef>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ContinueStatement extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_level;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $level,
    EditableNode $semicolon,
  ) {
    parent::__construct('continue_statement');
    $this->_keyword = $keyword;
    $this->_level = $level;
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
      /* UNSAFE_EXPR */ $json['continue_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $level = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['continue_level'],
      $file,
      $offset,
      $source,
    );
    $offset += $level->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['continue_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new static($keyword, $level, $semicolon);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'level' => $this->_level,
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
    $level = $this->_level->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $level === $this->_level &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($keyword, $level, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_level, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns ContinueToken
   */
  public function getKeyword(): ContinueToken {
    return TypeAssert\instance_of(ContinueToken::class, $this->_keyword);
  }

  /**
   * @returns ContinueToken
   */
  public function getKeywordx(): ContinueToken {
    return $this->getKeyword();
  }

  public function getLevelUNTYPED(): EditableNode {
    return $this->_level;
  }

  public function withLevel(EditableNode $value): this {
    if ($value === $this->_level) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasLevel(): bool {
    return !$this->_level->isMissing();
  }

  /**
   * @returns LiteralExpression | Missing | VariableExpression
   */
  public function getLevel(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_level);
  }

  /**
   * @returns LiteralExpression | Missing | VariableExpression
   */
  public function getLevelx(): EditableNode {
    return $this->getLevel();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_level, $value);
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
