<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6a29df2d9109127b896b3f4b71cdaaf9>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ErrorSyntax extends EditableSyntax {

  private EditableSyntax $_error;

  public function __construct(EditableSyntax $error) {
    parent::__construct('error');
    $this->_error = $error;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $error = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['error_error'],
      $position,
      $source,
    );
    $position += $error->width();
    return new self($error);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'error' => $this->_error;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $error = $this->_error->rewrite($rewriter, $child_parents);
    if ($error === $this->_error) {
      $node = $this;
    } else {
      $node = new self($error);
    }
    return $rewriter($node, $parents);
  }

  public function error(): EditableSyntax {
    return $this->errorx();
  }

  public function errorx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_error);
  }

  public function raw_error(): EditableSyntax {
    return $this->_error;
  }

  public function with_error(EditableSyntax $value): this {
    return new self($value);
  }
}
