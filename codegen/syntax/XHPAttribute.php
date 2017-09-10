<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<97f7dc3a0915f96ae3079040709eddb6>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPAttribute extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_equal;
  private EditableSyntax $_expression;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $equal,
    EditableSyntax $expression,
  ) {
    parent::__construct('xhp_attribute');
    $this->_name = $name;
    $this->_equal = $equal;
    $this->_expression = $expression;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_equal'],
      $position,
      $source,
    );
    $position += $equal->width();
    $expression = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_attribute_expression'],
      $position,
      $source,
    );
    $position += $expression->width();
    return new self($name, $equal, $expression);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'equal' => $this->_equal;
    yield 'expression' => $this->_expression;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $child_parents);
    $equal = $this->_equal->rewrite($rewriter, $child_parents);
    $expression = $this->_expression->rewrite($rewriter, $child_parents);
    if (
      $name === $this->_name &&
      $equal === $this->_equal &&
      $expression === $this->_expression
    ) {
      $node = $this;
    } else {
      $node = new self($name, $equal, $expression);
    }
    return $rewriter($node, $parents);
  }

  public function name(): XHPElementNameToken {
    return $this->namex();
  }

  public function namex(): XHPElementNameToken {
    return TypeAssert::isInstanceOf(XHPElementNameToken::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    return new self($value, $this->_equal, $this->_expression);
  }

  public function equal(): ?EqualToken {
    return $this->_equal->is_missing()
      ? null
      : TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function equalx(): EqualToken {
    return TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function raw_equal(): EditableSyntax {
    return $this->_equal;
  }

  public function with_equal(EditableSyntax $value): this {
    return new self($this->_name, $value, $this->_expression);
  }

  public function expression(): EditableSyntax {
    return $this->expressionx();
  }

  public function expressionx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_expression);
  }

  public function raw_expression(): EditableSyntax {
    return $this->_expression;
  }

  public function with_expression(EditableSyntax $value): this {
    return new self($this->_name, $this->_equal, $value);
  }
}
