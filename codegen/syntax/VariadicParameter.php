<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f86c4ddde9688ab40c87ac86d7773155>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class VariadicParameter extends EditableSyntax {

  private EditableSyntax $_ellipsis;

  public function __construct(EditableSyntax $ellipsis) {
    parent::__construct('variadic_parameter');
    $this->_ellipsis = $ellipsis;
  }

  <<__Override>>
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

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'ellipsis' => $this->_ellipsis;
  }

  <<__Override>>
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

  public function getEllipsisUNTYPED(): EditableSyntax {
    return $this->_ellipsis;
  }

  public function withEllipsis(EditableSyntax $value): this {
    if ($value === $this->_ellipsis) {
      return $this;
    }
    return new self($value);
  }

  public function hasEllipsis(): bool {
    return !$this->_ellipsis->is_missing();
  }

  public function getEllipsis(): DotDotDotToken {
    return TypeAssert::isInstanceOf(DotDotDotToken::class, $this->_ellipsis);
  }
}
