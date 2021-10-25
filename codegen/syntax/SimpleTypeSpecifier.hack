/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8ec6d94424908a58af1be4a985edfddc>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $specifier = Node::fromJSON(
      ($json['simple_type_specifier']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $specifier = $specifier as nonnull;
    $offset += $specifier->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(/* HH_IGNORE_ERROR[4110] */ $specifier, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'specifier' => $this->_specifier,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $specifier = $rewriter($this->_specifier, $parents);
    if ($specifier === $this->_specifier) {
      return $this;
    }
    return new static($specifier as Node);
  }

  public function getSpecifierUNTYPED(): ?Node {
    return $this->_specifier;
  }

  public function withSpecifier(Node $value): this {
    if ($value === $this->_specifier) {
      return $this;
    }
    return new static($value);
  }

  public function hasSpecifier(): bool {
    return $this->_specifier !== null;
  }

  /**
   * @return QualifiedName | XHPClassNameToken | ArraykeyToken | BoolToken |
   * DarrayToken | DictToken | FloatToken | IntToken | KeysetToken | MixedToken
   * | NameToken | NoreturnToken | NullLiteralToken | NumToken | ObjectToken |
   * ResourceToken | StringToken | ThisToken | VarToken | VarrayToken |
   * VecToken | VoidToken | XHPToken
   */
  public function getSpecifier(): Node {
    return $this->_specifier;
  }

  /**
   * @return QualifiedName | XHPClassNameToken | ArraykeyToken | BoolToken |
   * DarrayToken | DictToken | FloatToken | IntToken | KeysetToken | MixedToken
   * | NameToken | NoreturnToken | NullLiteralToken | NumToken | ObjectToken |
   * ResourceToken | StringToken | ThisToken | VarToken | VarrayToken |
   * VecToken | VoidToken | XHPToken
   */
  public function getSpecifierx(): Node {
    return $this->getSpecifier();
  }
}
