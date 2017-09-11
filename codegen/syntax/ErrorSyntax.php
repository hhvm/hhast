<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c15e11309e12991eaef744bf4eedcdfc>>
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

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $error = $this->_error->rewrite($rewriter, $parents);
    if (
      $error === $this->_error
    ) {
      return $this;
    }
    return new self($error);
  }

  public function raw_error(): EditableSyntax {
    return $this->_error;
  }

  public function with_error(EditableSyntax $value): this {
    if ($value === $this->_error) {
      return $this;
    }
    return new self($value);
  }

  public function error(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_error);
  }
}
