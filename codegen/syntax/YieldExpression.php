<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<50dabedbd908bc2c58b7fc9da620a7e5>>
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

  <<__Override>>
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
    $position += $keyword->getWidth();
    $operand = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['yield_operand'],
      $position,
      $source,
    );
    $position += $operand->getWidth();
    return new self($keyword, $operand);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'operand' => $this->_operand;
  }

  <<__Override>>
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

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_operand);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  public function getKeyword(): YieldToken {
    return TypeAssert::isInstanceOf(YieldToken::class, $this->_keyword);
  }

  public function getOperandUNTYPED(): EditableSyntax {
    return $this->_operand;
  }

  public function withOperand(EditableSyntax $value): this {
    if ($value === $this->_operand) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }

  public function hasOperand(): bool {
    return !$this->_operand->isMissing();
  }

  public function getOperand(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_operand);
  }
}
