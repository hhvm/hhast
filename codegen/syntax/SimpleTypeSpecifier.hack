/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f035572ae4b3a7e84532c7598b9b57cd>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class SimpleTypeSpecifier
  extends Node
  implements ISimpleCreationSpecifier, ITypeSpecifier {

  const string SYNTAX_KIND = 'simple_type_specifier';

  private Node $_specifier;

  public function __construct(
    Node $specifier,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_specifier = $specifier;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $specifier = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['simple_type_specifier'],
      $file,
      $offset,
      $source,
      'Node',
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'specifier' => $this->_specifier,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $specifier = $rewriter($this->_specifier, $parents);
    if ($specifier === $this->_specifier) {
      return $this;
    }
    return new static($specifier);
  }

  public function getSpecifierUNTYPED(): Node {
    return $this->_specifier;
  }

  public function withSpecifier(Node $value): this {
    if ($value === $this->_specifier) {
      return $this;
    }
    return new static($value);
  }

  public function hasSpecifier(): bool {
    return !$this->_specifier->isMissing();
  }

  /**
   * @return QualifiedName | XHPClassNameToken | ArrayToken | ArraykeyToken |
   * BoolToken | BooleanToken | DarrayToken | DictToken | DoubleToken |
   * FloatToken | IntToken | IntegerToken | KeysetToken | MixedToken |
   * NameToken | NoreturnToken | NullLiteralToken | NumToken | ObjectToken |
   * ParentToken | RealToken | ResourceToken | SelfToken | StringToken |
   * ThisToken | VarToken | VarrayToken | VecToken | VoidToken
   */
  public function getSpecifier(): Node {
    return $this->_specifier;
  }

  /**
   * @return QualifiedName | XHPClassNameToken | ArrayToken | ArraykeyToken |
   * BoolToken | BooleanToken | DarrayToken | DictToken | DoubleToken |
   * FloatToken | IntToken | IntegerToken | KeysetToken | MixedToken |
   * NameToken | NoreturnToken | NullLiteralToken | NumToken | ObjectToken |
   * ParentToken | RealToken | ResourceToken | SelfToken | StringToken |
   * ThisToken | VarToken | VarrayToken | VecToken | VoidToken
   */
  public function getSpecifierx(): Node {
    return $this->getSpecifier();
  }
}
