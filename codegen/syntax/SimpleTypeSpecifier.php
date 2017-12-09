<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0dee6afa771831e99d3f30645be5a04c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class SimpleTypeSpecifier extends EditableNode {

  private EditableNode $_specifier;

  public function __construct(EditableNode $specifier) {
    parent::__construct('simple_type_specifier');
    $this->_specifier = $specifier;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $specifier = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['simple_type_specifier'],
      $file,
      $offset,
      $source,
    );
    $offset += $specifier->getWidth();
    return new self($specifier);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'specifier' => $this->_specifier,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $specifier = $this->_specifier->rewrite($rewriter, $parents);
    if ($specifier === $this->_specifier) {
      return $this;
    }
    return new self($specifier);
  }

  public function getSpecifierUNTYPED(): EditableNode {
    return $this->_specifier;
  }

  public function withSpecifier(EditableNode $value): this {
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
    return TypeAssert\instance_of(EditableToken::class, $this->_specifier);
  }
}
