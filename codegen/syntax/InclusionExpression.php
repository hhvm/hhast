<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3a555863d09f7f524d4bc57f91319d4d>>
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
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $require = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['inclusion_require'],
      $position,
      $source,
    );
    $position += $require->getWidth();
    $filename = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['inclusion_filename'],
      $position,
      $source,
    );
    $position += $filename->getWidth();
    return new self($require, $filename);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'require' => $this->_require;
    yield 'filename' => $this->_filename;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $require = $this->_require->rewrite($rewriter, $parents);
    $filename = $this->_filename->rewrite($rewriter, $parents);
    if ($require === $this->_require && $filename === $this->_filename) {
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
    return !$this->_require->isMissing();
  }

  /**
   * @returns RequireToken | IncludeToken | Include_onceToken |
   * Require_onceToken
   */
  public function getRequire(): EditableToken {
    return TypeAssert::isInstanceOf(EditableToken::class, $this->_require);
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
    return !$this->_filename->isMissing();
  }

  /**
   * @returns LiteralExpression | QualifiedNameExpression | BinaryExpression |
   * VariableExpression | SubscriptExpression | ParenthesizedExpression
   */
  public function getFilename(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_filename);
  }
}
