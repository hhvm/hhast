<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c7b0e49ff4920b47c97676cac525aa2e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class VariadicParameter extends EditableSyntax {

  private EditableSyntax $_ellipsis;

  public function __construct(EditableSyntax $ellipsis) {
    parent::__construct('variadic_parameter');
    $this->_ellipsis = $ellipsis;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $ellipsis = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['variadic_parameter_ellipsis'],
      $position,
      $source,
    );
    $position += $ellipsis->getWidth();
    return new self($ellipsis);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'ellipsis' => $this->_ellipsis;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $ellipsis = $this->_ellipsis->rewrite($rewriter, $parents);
    if ($ellipsis === $this->_ellipsis) {
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
    return !$this->_ellipsis->isMissing();
  }

  /**
   * @returns DotDotDotToken
   */
  public function getEllipsis(): DotDotDotToken {
    return TypeAssert\instance_of(DotDotDotToken::class, $this->_ellipsis);
  }
}
