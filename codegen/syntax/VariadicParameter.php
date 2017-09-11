<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5cbac083c672e5b09de53a2217398e15>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class VariadicParameter extends EditableSyntax {

  private EditableSyntax $_ellipsis;

  public function __construct(EditableSyntax $ellipsis) {
    parent::__construct('variadic_parameter');
    $this->_ellipsis = $ellipsis;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $ellipsis = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['variadic_parameter_ellipsis'],
      $position,
      $source,
    );
    $position += $ellipsis->width();
    return new self($ellipsis);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'ellipsis' => $this->_ellipsis;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $ellipsis = $this->_ellipsis->rewrite($rewriter, $parents);
    if (
      $ellipsis === $this->_ellipsis
    ) {
      return $this;
    }
    return new self($ellipsis);
  }

  public function ellipsis(): DotDotDotToken {
    return $this->ellipsisx();
  }

  public function ellipsisx(): DotDotDotToken {
    return TypeAssert::isInstanceOf(DotDotDotToken::class, $this->_ellipsis);
  }

  public function raw_ellipsis(): EditableSyntax {
    return $this->_ellipsis;
  }

  public function with_ellipsis(EditableSyntax $value): this {
    if ($value === $this->_ellipsis) {
      return $this;
    }
    return new self($value);
  }
}
