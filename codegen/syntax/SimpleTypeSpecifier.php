<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6b6f44809b69c062d4ab25e65ddcf6d5>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class SimpleTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_specifier;

  public function __construct(EditableSyntax $specifier) {
    parent::__construct('simple_type_specifier');
    $this->_specifier = $specifier;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $specifier = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['simple_type_specifier'],
      $position,
      $source,
    );
    $position += $specifier->width();
    return new self($specifier);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'specifier' => $this->_specifier;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $specifier = $this->_specifier->rewrite($rewriter, $parents);
    if (
      $specifier === $this->_specifier
    ) {
      return $this;
    }
    return new self($specifier);
  }

  public function raw_specifier(): EditableSyntax {
    return $this->_specifier;
  }

  public function with_specifier(EditableSyntax $value): this {
    if ($value === $this->_specifier) {
      return $this;
    }
    return new self($value);
  }

  public function specifier(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_specifier);
  }
}
