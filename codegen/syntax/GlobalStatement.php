<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2ce8ec82263a4ea90cdb75fe7e393b33>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class GlobalStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_variables;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $variables,
    EditableSyntax $semicolon,
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
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['global_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $variables = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['global_variables'],
      $position,
      $source,
    );
    $position += $variables->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['global_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($keyword, $variables, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'variables' => $this->_variables;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
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

  public function getVariablesUNTYPED(): EditableSyntax {
    return $this->_variables;
  }

  public function withVariables(EditableSyntax $value): this {
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

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
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
