/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<770924548129a85f803fc6dc004d2346>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class TypeConstant extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'type_constant';

  private ITypeSpecifier $_left_type;
  private ColonColonToken $_separator;
  private NameToken $_right_type;

  public function __construct(
    ITypeSpecifier $left_type,
    ColonColonToken $separator,
    NameToken $right_type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_type = $left_type;
    $this->_separator = $separator;
    $this->_right_type = $right_type;
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
    $left_type = Node::fromJSON(
      ($json['type_constant_left_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $left_type = $left_type as nonnull;
    $offset += $left_type->getWidth();
    $separator = Node::fromJSON(
      ($json['type_constant_separator']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ColonColonToken',
    );
    $separator = $separator as nonnull;
    $offset += $separator->getWidth();
    $right_type = Node::fromJSON(
      ($json['type_constant_right_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $right_type = $right_type as nonnull;
    $offset += $right_type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $left_type,
      /* HH_IGNORE_ERROR[4110] */ $separator,
      /* HH_IGNORE_ERROR[4110] */ $right_type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_type' => $this->_left_type,
      'separator' => $this->_separator,
      'right_type' => $this->_right_type,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_type = $rewriter($this->_left_type, $parents);
    $separator = $rewriter($this->_separator, $parents);
    $right_type = $rewriter($this->_right_type, $parents);
    if (
      $left_type === $this->_left_type &&
      $separator === $this->_separator &&
      $right_type === $this->_right_type
    ) {
      return $this;
    }
    return new static(
      $left_type as ITypeSpecifier,
      $separator as ColonColonToken,
      $right_type as NameToken,
    );
  }

  public function getLeftTypeUNTYPED(): ?Node {
    return $this->_left_type;
  }

  public function withLeftType(ITypeSpecifier $value): this {
    if ($value === $this->_left_type) {
      return $this;
    }
    return new static($value, $this->_separator, $this->_right_type);
  }

  public function hasLeftType(): bool {
    return true;
  }

  /**
   * @return NameToken | SelfToken | ThisToken | VariableToken | TypeConstant
   */
  public function getLeftType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_left_type);
  }

  /**
   * @return NameToken | SelfToken | ThisToken | VariableToken | TypeConstant
   */
  public function getLeftTypex(): ITypeSpecifier {
    return $this->getLeftType();
  }

  public function getSeparatorUNTYPED(): ?Node {
    return $this->_separator;
  }

  public function withSeparator(ColonColonToken $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new static($this->_left_type, $value, $this->_right_type);
  }

  public function hasSeparator(): bool {
    return true;
  }

  /**
   * @return ColonColonToken
   */
  public function getSeparator(): ColonColonToken {
    return TypeAssert\instance_of(ColonColonToken::class, $this->_separator);
  }

  /**
   * @return ColonColonToken
   */
  public function getSeparatorx(): ColonColonToken {
    return $this->getSeparator();
  }

  public function getRightTypeUNTYPED(): ?Node {
    return $this->_right_type;
  }

  public function withRightType(NameToken $value): this {
    if ($value === $this->_right_type) {
      return $this;
    }
    return new static($this->_left_type, $this->_separator, $value);
  }

  public function hasRightType(): bool {
    return true;
  }

  /**
   * @return NameToken
   */
  public function getRightType(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_right_type);
  }

  /**
   * @return NameToken
   */
  public function getRightTypex(): NameToken {
    return $this->getRightType();
  }
}
