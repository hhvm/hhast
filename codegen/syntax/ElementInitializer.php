<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4b8e95e1da257f7fcb5e5fc9bb07b0b4>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ElementInitializer extends EditableSyntax {

  private EditableSyntax $_key;
  private EditableSyntax $_arrow;
  private EditableSyntax $_value;

  public function __construct(
    EditableSyntax $key,
    EditableSyntax $arrow,
    EditableSyntax $value,
  ) {
    parent::__construct('element_initializer');
    $this->_key = $key;
    $this->_arrow = $arrow;
    $this->_value = $value;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $key = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['element_key'],
      $position,
      $source,
    );
    $position += $key->getWidth();
    $arrow = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['element_arrow'],
      $position,
      $source,
    );
    $position += $arrow->getWidth();
    $value = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['element_value'],
      $position,
      $source,
    );
    $position += $value->getWidth();
    return new self($key, $arrow, $value);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'key' => $this->_key;
    yield 'arrow' => $this->_arrow;
    yield 'value' => $this->_value;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $key = $this->_key->rewrite($rewriter, $parents);
    $arrow = $this->_arrow->rewrite($rewriter, $parents);
    $value = $this->_value->rewrite($rewriter, $parents);
    if (
      $key === $this->_key &&
      $arrow === $this->_arrow &&
      $value === $this->_value
    ) {
      return $this;
    }
    return new self($key, $arrow, $value);
  }

  public function getKeyUNTYPED(): EditableSyntax {
    return $this->_key;
  }

  public function withKey(EditableSyntax $value): this {
    if ($value === $this->_key) {
      return $this;
    }
    return new self($value, $this->_arrow, $this->_value);
  }

  public function hasKey(): bool {
    return !$this->_key->isMissing();
  }

  /**
   * @returns LiteralExpression | QualifiedNameExpression |
   * ScopeResolutionExpression | VariableExpression | ArrayIntrinsicExpression
   * | ObjectCreationExpression | VectorIntrinsicExpression |
   * DictionaryIntrinsicExpression | KeysetIntrinsicExpression |
   * CollectionLiteralExpression | PrefixUnaryExpression |
   * FunctionCallExpression | BinaryExpression | ParenthesizedExpression |
   * ArrayCreationExpression | CastExpression | AnonymousFunction
   */
  public function getKey(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_key);
  }

  public function getArrowUNTYPED(): EditableSyntax {
    return $this->_arrow;
  }

  public function withArrow(EditableSyntax $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new self($this->_key, $value, $this->_value);
  }

  public function hasArrow(): bool {
    return !$this->_arrow->isMissing();
  }

  /**
   * @returns EqualGreaterThanToken
   */
  public function getArrow(): EqualGreaterThanToken {
    return TypeAssert::isInstanceOf(EqualGreaterThanToken::class, $this->_arrow);
  }

  public function getValueUNTYPED(): EditableSyntax {
    return $this->_value;
  }

  public function withValue(EditableSyntax $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new self($this->_key, $this->_arrow, $value);
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  /**
   * @returns LiteralExpression | ObjectCreationExpression |
   * PrefixUnaryExpression | CastExpression | QualifiedNameExpression |
   * VariableExpression | ScopeResolutionExpression |
   * DictionaryIntrinsicExpression | ArrayCreationExpression |
   * VectorIntrinsicExpression | KeysetIntrinsicExpression |
   * ConditionalExpression | FunctionCallExpression | BinaryExpression |
   * ArrayIntrinsicExpression | MemberSelectionExpression |
   * ParenthesizedExpression | CollectionLiteralExpression | AnonymousFunction
   * | DarrayIntrinsicExpression | VarrayIntrinsicExpression |
   * SubscriptExpression | IssetExpression | TupleExpression
   */
  public function getValue(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_value);
  }
}
