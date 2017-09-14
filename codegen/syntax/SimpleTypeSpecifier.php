<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f9c92dafc6ff5dd2b08feca7a2133847>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class SimpleTypeSpecifier extends EditableSyntax {

  private EditableSyntax $_specifier;

  public function __construct(EditableSyntax $specifier) {
    parent::__construct('simple_type_specifier');
    $this->_specifier = $specifier;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $specifier = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['simple_type_specifier'],
      $position,
      $source,
    );
    $position += $specifier->getWidth();
    return new self($specifier);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'specifier' => $this->_specifier;
  }

  <<__Override>>
  public function rewriteDescendants(
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

  public function getSpecifierUNTYPED(): EditableSyntax {
    return $this->_specifier;
  }

  public function withSpecifier(EditableSyntax $value): this {
    if ($value === $this->_specifier) {
      return $this;
    }
    return new self($value);
  }

  public function hasSpecifier(): bool {
    return !$this->_specifier->isMissing();
  }

  /**
   * @returns NameToken | ArrayToken | VoidToken | IntToken | StringToken |
   * QualifiedNameToken | BoolToken | DoubleToken | FloatToken | DictToken |
   * MixedToken | ArraykeyToken | VecToken | KeysetToken | SelfToken |
   * ResourceToken | XHPClassNameToken | ThisToken | ParentToken | NumToken |
   * VarrayToken | DarrayToken | NoreturnToken
   */
  public function getSpecifier(): EditableToken {
    return TypeAssert::isInstanceOf(EditableToken::class, $this->_specifier);
  }
}
