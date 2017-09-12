<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fe8f599f773292b2b1cad158e0e6875c>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class ErrorSyntax extends EditableSyntax {

  private EditableSyntax $_error;

  public function __construct(EditableSyntax $error) {
    parent::__construct('error');
    $this->_error = $error;
  }

  <<__Override>>
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

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'error' => $this->_error;
  }

  <<__Override>>
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

  public function getErrorUNTYPED(): EditableSyntax {
    return $this->_error;
  }

  public function withError(EditableSyntax $value): this {
    if ($value === $this->_error) {
      return $this;
    }
    return new self($value);
  }

  public function hasError(): bool {
    return !$this->_error->is_missing();
  }

  public function getError(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_error);
  }
}
