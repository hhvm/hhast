<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<9cea682dce0f73392038a047c60e5859>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ElseifClause extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_left_paren;
  private EditableSyntax $_condition;
  private EditableSyntax $_right_paren;
  private EditableSyntax $_statement;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $left_paren,
    EditableSyntax $condition,
    EditableSyntax $right_paren,
    EditableSyntax $statement,
  ) {
    parent::__construct('elseif_clause');
    $this->_keyword = $keyword;
    $this->_left_paren = $left_paren;
    $this->_condition = $condition;
    $this->_right_paren = $right_paren;
    $this->_statement = $statement;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['elseif_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $left_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['elseif_left_paren'],
      $position,
      $source,
    );
    $position += $left_paren->width();
    $condition = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['elseif_condition'],
      $position,
      $source,
    );
    $position += $condition->width();
    $right_paren = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['elseif_right_paren'],
      $position,
      $source,
    );
    $position += $right_paren->width();
    $statement = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['elseif_statement'],
      $position,
      $source,
    );
    $position += $statement->width();
    return
      new self($keyword, $left_paren, $condition, $right_paren, $statement);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'left_paren' => $this->_left_paren;
    yield 'condition' => $this->_condition;
    yield 'right_paren' => $this->_right_paren;
    yield 'statement' => $this->_statement;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $child_parents);
    $left_paren = $this->_left_paren->rewrite($rewriter, $child_parents);
    $condition = $this->_condition->rewrite($rewriter, $child_parents);
    $right_paren = $this->_right_paren->rewrite($rewriter, $child_parents);
    $statement = $this->_statement->rewrite($rewriter, $child_parents);
    if (
      $keyword === $this->_keyword &&
      $left_paren === $this->_left_paren &&
      $condition === $this->_condition &&
      $right_paren === $this->_right_paren &&
      $statement === $this->_statement
    ) {
      $node = $this;
    } else {
      $node =
        new self($keyword, $left_paren, $condition, $right_paren, $statement);
    }
    return $rewriter($node, $parents);
  }

  public function keyword(): ElseifToken {
    return $this->keywordx();
  }

  public function keywordx(): ElseifToken {
    return TypeAssert::isInstanceOf(ElseifToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self(
      $value,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
    );
  }

  public function left_paren(): LeftParenToken {
    return $this->left_parenx();
  }

  public function left_parenx(): LeftParenToken {
    return TypeAssert::isInstanceOf(LeftParenToken::class, $this->_left_paren);
  }

  public function raw_left_paren(): EditableSyntax {
    return $this->_left_paren;
  }

  public function with_left_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $value,
      $this->_condition,
      $this->_right_paren,
      $this->_statement,
    );
  }

  public function condition(): EditableSyntax {
    return $this->conditionx();
  }

  public function conditionx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_condition);
  }

  public function raw_condition(): EditableSyntax {
    return $this->_condition;
  }

  public function with_condition(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_statement,
    );
  }

  public function right_paren(): RightParenToken {
    return $this->right_parenx();
  }

  public function right_parenx(): RightParenToken {
    return
      TypeAssert::isInstanceOf(RightParenToken::class, $this->_right_paren);
  }

  public function raw_right_paren(): EditableSyntax {
    return $this->_right_paren;
  }

  public function with_right_paren(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $value,
      $this->_statement,
    );
  }

  public function statement(): EditableSyntax {
    return $this->statementx();
  }

  public function statementx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_statement);
  }

  public function raw_statement(): EditableSyntax {
    return $this->_statement;
  }

  public function with_statement(EditableSyntax $value): this {
    return new self(
      $this->_keyword,
      $this->_left_paren,
      $this->_condition,
      $this->_right_paren,
      $value,
    );
  }
}
