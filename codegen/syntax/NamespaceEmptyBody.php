<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c957c152dc99488d750c7d85e716ba00>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class NamespaceEmptyBody extends EditableSyntax {

  private EditableSyntax $_semicolon;

  public function __construct(EditableSyntax $semicolon) {
    parent::__construct('namespace_empty_body');
    $this->_semicolon = $semicolon;
  }

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

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'semicolon' => $this->_semicolon;
  }

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

  public function semicolon(): SemicolonToken {
    return $this->semicolonx();
  }

  public function semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($value);
  }
}
