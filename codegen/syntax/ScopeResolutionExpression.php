<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<bf2a5569626ac9f072e8f1651b0ebb3f>>
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

  <<__Override>>
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

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'qualifier' => $this->_qualifier;
    yield 'operator' => $this->_operator;
    yield 'name' => $this->_name;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $qualifier = $this->_qualifier->rewrite($rewriter, $parents);
    $operator = $this->_operator->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    if (
      $qualifier === $this->_qualifier &&
      $operator === $this->_operator &&
      $name === $this->_name
    ) {
      return $this;
    }
    return new self($qualifier, $operator, $name);
  }

  public function getQualifierUNTYPED(): EditableSyntax {
    return $this->_qualifier;
  }

  public function withQualifier(EditableSyntax $value): this {
    if ($value === $this->_qualifier) {
      return $this;
    }
    return new self($value, $this->_operator, $this->_name);
  }

  public function hasQualifier(): bool {
    return !$this->_qualifier->is_missing();
  }

  public function getQualifier(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_qualifier);
  }

  public function getOperatorUNTYPED(): EditableSyntax {
    return $this->_operator;
  }

  public function withOperator(EditableSyntax $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new self($this->_qualifier, $value, $this->_name);
  }

  public function hasOperator(): bool {
    return !$this->_operator->is_missing();
  }

  public function getOperator(): ColonColonToken {
    return TypeAssert::isInstanceOf(ColonColonToken::class, $this->_operator);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_qualifier, $this->_operator, $value);
  }

  public function hasName(): bool {
    return !$this->_name->is_missing();
  }

  public function getName(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_name);
  }
}
