<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3b6c98a4df1f78e566a7bb5b2a344947>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class InclusionExpression extends EditableSyntax {

  private EditableSyntax $_require;
  private EditableSyntax $_filename;

  public function __construct(
    EditableSyntax $require,
    EditableSyntax $filename,
  ) {
    parent::__construct('inclusion_expression');
    $this->_require = $require;
    $this->_filename = $filename;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $require = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['inclusion_require'],
      $position,
      $source,
    );
    $position += $require->width();
    $filename = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['inclusion_filename'],
      $position,
      $source,
    );
    $position += $filename->width();
    return new self($require, $filename);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'require' => $this->_require;
    yield 'filename' => $this->_filename;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $require = $this->_require->rewrite($rewriter, $parents);
    $filename = $this->_filename->rewrite($rewriter, $parents);
    if (
      $require === $this->_require &&
      $filename === $this->_filename
    ) {
      return $this;
    }
    return new self($require, $filename);
  }

  public function getRequireUNTYPED(): EditableSyntax {
    return $this->_require;
  }

  public function withRequire(EditableSyntax $value): this {
    if ($value === $this->_require) {
      return $this;
    }
    return new self($value, $this->_filename);
  }

  public function hasRequire(): bool {
    return !$this->_require->is_missing();
  }

  public function getRequire(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_require);
  }

  public function getFilenameUNTYPED(): EditableSyntax {
    return $this->_filename;
  }

  public function withFilename(EditableSyntax $value): this {
    if ($value === $this->_filename) {
      return $this;
    }
    return new self($this->_require, $value);
  }

  public function hasFilename(): bool {
    return !$this->_filename->is_missing();
  }

  public function getFilename(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_filename);
  }
}
