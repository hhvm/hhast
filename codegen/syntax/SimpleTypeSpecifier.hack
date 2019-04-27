/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<138972fc7a00002536782e683c3c6bf9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class SimpleTypeSpecifier extends EditableNode {

  private EditableNode $_specifier;

  public function __construct(
    EditableNode $specifier,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_specifier = $specifier;
    parent::__construct('simple_type_specifier', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $specifier = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['simple_type_specifier'],
      $file,
      $offset,
      $source,
    );
    $offset += $specifier->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($specifier, $source_ref);
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
    return new static($specifier);
  }

  public function getSpecifierUNTYPED(): EditableNode {
    return $this->_specifier;
  }

  public function withSpecifier(EditableNode $value): this {
    if ($value === $this->_specifier) {
      return $this;
    }
    return new static($value);
  }

  public function hasSpecifier(): bool {
    return !$this->_specifier->isMissing();
  }

  /**
   * @return QualifiedName | XHPClassNameToken | ConstructToken | ArrayToken |
   * ArraykeyToken | BoolToken | BooleanToken | DarrayToken | DictToken |
   * DoubleToken | FloatToken | IntToken | IntegerToken | KeysetToken |
   * MixedToken | NameToken | NoreturnToken | NullLiteralToken | NumToken |
   * ObjectToken | ParentToken | RealToken | ResourceToken | SelfToken |
   * StringToken | ThisToken | VarToken | VarrayToken | VecToken | VoidToken
   */
  public function getSpecifier(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_specifier);
  }

  /**
   * @return QualifiedName | XHPClassNameToken | ConstructToken | ArrayToken |
   * ArraykeyToken | BoolToken | BooleanToken | DarrayToken | DictToken |
   * DoubleToken | FloatToken | IntToken | IntegerToken | KeysetToken |
   * MixedToken | NameToken | NoreturnToken | NullLiteralToken | NumToken |
   * ObjectToken | ParentToken | RealToken | ResourceToken | SelfToken |
   * StringToken | ThisToken | VarToken | VarrayToken | VecToken | VoidToken
   */
  public function getSpecifierx(): EditableNode {
    return $this->getSpecifier();
  }
}
