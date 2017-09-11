<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c113bc2d4b42c474f1bed38bb6288941>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class YieldExpression extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_operand;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $operand,
  ) {
    parent::__construct('yield_expression');
    $this->_keyword = $keyword;
    $this->_operand = $operand;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['yield_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['yield_operand'],
      $position,
      $source,
    );
    $position += $operand->width();
    return new self($keyword, $operand);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'operand' => $this->_operand;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $operand = $this->_operand->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $operand === $this->_operand
    ) {
      return $this;
    }
    return new self($keyword, $operand);
  }

  public function keyword(): YieldToken {
    return $this->keywordx();
  }

  public function keywordx(): YieldToken {
    return TypeAssert::isInstanceOf(YieldToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_operand);
  }

  public function operand(): EditableSyntax {
    return $this->operandx();
  }

  public function operandx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_operand);
  }

  public function raw_operand(): EditableSyntax {
    return $this->_operand;
  }

  public function with_operand(EditableSyntax $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }
}
