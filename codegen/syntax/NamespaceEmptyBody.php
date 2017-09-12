<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8160595fb206941483896c9e9ef4a70a>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class NamespaceEmptyBody extends EditableSyntax {

  private EditableSyntax $_semicolon;

  public function __construct(EditableSyntax $semicolon) {
    parent::__construct('namespace_empty_body');
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['namespace_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($semicolon);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($semicolon);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->is_missing();
  }

  public function getSemicolon(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }
}
