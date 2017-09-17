<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<24b5f1975eb024cc454c87a3dda90b95>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class CaseLabel extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_expression;
  private EditableSyntax $_colon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $expression,
    EditableSyntax $colon,
  ) {
    parent::__construct('case_label');
    $this->_keyword = $keyword;
    $this->_expression = $expression;
    $this->_colon = $colon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['case_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $expression = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['case_expression'],
      $position,
      $source,
    );
    $position += $expression->getWidth();
    $colon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['case_colon'],
      $position,
      $source,
    );
    $position += $colon->getWidth();
    return new self($keyword, $expression, $colon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'expression' => $this->_expression;
    yield 'colon' => $this->_colon;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $expression === $this->_expression &&
      $colon === $this->_colon
    ) {
      return $this;
    }
    return new self($keyword, $expression, $colon);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_expression, $this->_colon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns CaseToken
   */
  public function getKeyword(): CaseToken {
    return TypeAssert\instance_of(CaseToken::class, $this->_keyword);
  }

  public function getExpressionUNTYPED(): EditableSyntax {
    return $this->_expression;
  }

  public function withExpression(EditableSyntax $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_colon);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @returns LiteralExpression | ScopeResolutionExpression |
   * VariableExpression | PrefixUnaryExpression | QualifiedNameExpression |
   * FunctionCallExpression | ArrayIntrinsicExpression | InstanceofExpression
   */
  public function getExpression(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_expression);
  }

  public function getColonUNTYPED(): EditableSyntax {
    return $this->_colon;
  }

  public function withColon(EditableSyntax $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new self($this->_keyword, $this->_expression, $value);
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @returns ColonToken | SemicolonToken
   */
  public function getColon(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_colon);
  }
}
