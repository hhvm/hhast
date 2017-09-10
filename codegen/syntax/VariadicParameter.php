<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<36e2b3fad32fd7d62bbd5c560774f3c2>>
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

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $ellipsis = $this->_ellipsis->rewrite($rewriter, $child_parents);
    if ($ellipsis === $this->_ellipsis) {
      $node = $this;
    } else {
      $node = new self($ellipsis);
    }
    return $rewriter($node, $parents);
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
    return new self($value);
  }
}
