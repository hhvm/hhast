<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4e836d1b0168667f9c362df0f136ba54>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ScopeResolutionExpression extends EditableSyntax {

  private EditableSyntax $_qualifier;
  private EditableSyntax $_operator;
  private EditableSyntax $_name;

  public function __construct(
    EditableSyntax $qualifier,
    EditableSyntax $operator,
    EditableSyntax $name,
  ) {
    parent::__construct('scope_resolution_expression');
    $this->_qualifier = $qualifier;
    $this->_operator = $operator;
    $this->_name = $name;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $qualifier = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['scope_resolution_qualifier'],
      $position,
      $source,
    );
    $position += $qualifier->width();
    $operator = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['scope_resolution_operator'],
      $position,
      $source,
    );
    $position += $operator->width();
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['scope_resolution_name'],
      $position,
      $source,
    );
    $position += $name->width();
    return new self($qualifier, $operator, $name);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'qualifier' => $this->_qualifier;
    yield 'operator' => $this->_operator;
    yield 'name' => $this->_name;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $qualifier = $this->_qualifier->rewrite($rewriter, $child_parents);
    $operator = $this->_operator->rewrite($rewriter, $child_parents);
    $name = $this->_name->rewrite($rewriter, $child_parents);
    if (
      $qualifier === $this->_qualifier &&
      $operator === $this->_operator &&
      $name === $this->_name
    ) {
      $node = $this;
    } else {
      $node = new self($qualifier, $operator, $name);
    }
    return $rewriter($node, $parents);
  }

  public function qualifier(): EditableSyntax {
    return $this->qualifierx();
  }

  public function qualifierx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_qualifier);
  }

  public function raw_qualifier(): EditableSyntax {
    return $this->_qualifier;
  }

  public function with_qualifier(EditableSyntax $value): this {
    return new self($value, $this->_operator, $this->_name);
  }

  public function operator(): ColonColonToken {
    return $this->operatorx();
  }

  public function operatorx(): ColonColonToken {
    return TypeAssert::isInstanceOf(ColonColonToken::class, $this->_operator);
  }

  public function raw_operator(): EditableSyntax {
    return $this->_operator;
  }

  public function with_operator(EditableSyntax $value): this {
    return new self($this->_qualifier, $value, $this->_name);
  }

  public function name(): EditableSyntax {
    return $this->namex();
  }

  public function namex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($this->_qualifier, $this->_operator, $value);
  }
}
