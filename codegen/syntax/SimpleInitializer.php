<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ef9299ce3e7d77e0ed25d1cff4a6f85f>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class SimpleInitializer extends EditableSyntax {

  private EditableSyntax $_equal;
  private EditableSyntax $_value;

  public function __construct(EditableSyntax $equal, EditableSyntax $value) {
    parent::__construct('simple_initializer');
    $this->_equal = $equal;
    $this->_value = $value;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['simple_initializer_equal'],
      $position,
      $source,
    );
    $position += $equal->width();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['simple_initializer_value'],
      $position,
      $source,
    );
    $position += $value->width();
    return new self($equal, $value);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'equal' => $this->_equal;
    yield 'value' => $this->_value;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $equal = $this->_equal->rewrite($rewriter, $child_parents);
    $value = $this->_value->rewrite($rewriter, $child_parents);
    if ($equal === $this->_equal && $value === $this->_value) {
      $node = $this;
    } else {
      $node = new self($equal, $value);
    }
    return $rewriter($node, $parents);
  }

  public function equal(): EqualToken {
    return $this->equalx();
  }

  public function equalx(): EqualToken {
    return TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function raw_equal(): EditableSyntax {
    return $this->_equal;
  }

  public function with_equal(EditableSyntax $value): this {
    return new self($value, $this->_value);
  }

  public function value(): EditableSyntax {
    return $this->valuex();
  }

  public function valuex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_value);
  }

  public function raw_value(): EditableSyntax {
    return $this->_value;
  }

  public function with_value(EditableSyntax $value): this {
    return new self($this->_equal, $value);
  }
}
