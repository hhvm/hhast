/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8843c658e8f8664b762105b5f6249bd1>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class VarrayTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'varray_type_specifier';

  private VarrayToken $_keyword;
  private LessThanToken $_left_angle;
  private ITypeSpecifier $_type;
  private ?CommaToken $_trailing_comma;
  private GreaterThanToken $_right_angle;

  public function __construct(
    VarrayToken $keyword,
    LessThanToken $left_angle,
    ITypeSpecifier $type,
    ?CommaToken $trailing_comma,
    GreaterThanToken $right_angle,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_left_angle = $left_angle;
    $this->_type = $type;
    $this->_trailing_comma = $trailing_comma;
    $this->_right_angle = $right_angle;
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
    $keyword = Node::fromJSON(
      ($json['varray_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'VarrayToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_angle = Node::fromJSON(
      ($json['varray_left_angle']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'LessThanToken',
    );
    $left_angle = $left_angle as nonnull;
    $offset += $left_angle->getWidth();
    $type = Node::fromJSON(
      ($json['varray_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $trailing_comma = Node::fromJSON(
      ($json['varray_trailing_comma'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'CommaToken',
    );
    $offset += $trailing_comma?->getWidth() ?? 0;
    $right_angle = Node::fromJSON(
      ($json['varray_right_angle']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'GreaterThanToken',
    );
    $right_angle = $right_angle as nonnull;
    $offset += $right_angle->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $left_angle,
      /* HH_IGNORE_ERROR[4110] */ $type,
      /* HH_IGNORE_ERROR[4110] */ $trailing_comma,
      /* HH_IGNORE_ERROR[4110] */ $right_angle,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'left_angle' => $this->_left_angle,
      'type' => $this->_type,
      'trailing_comma' => $this->_trailing_comma,
      'right_angle' => $this->_right_angle,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $left_angle = $rewriter($this->_left_angle, $parents);
    $type = $rewriter($this->_type, $parents);
    $trailing_comma = $this->_trailing_comma === null
      ? null
      : $rewriter($this->_trailing_comma, $parents);
    $right_angle = $rewriter($this->_right_angle, $parents);
    if (
      $keyword === $this->_keyword &&
      $left_angle === $this->_left_angle &&
      $type === $this->_type &&
      $trailing_comma === $this->_trailing_comma &&
      $right_angle === $this->_right_angle
    ) {
      return $this;
    }
    return new static(
      $keyword as VarrayToken,
      $left_angle as LessThanToken,
      $type as ITypeSpecifier,
      $trailing_comma as ?CommaToken,
      $right_angle as GreaterThanToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(VarrayToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_left_angle,
      $this->_type,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return VarrayToken
   */
  public function getKeyword(): VarrayToken {
    return TypeAssert\instance_of(VarrayToken::class, $this->_keyword);
  }

  /**
   * @return VarrayToken
   */
  public function getKeywordx(): VarrayToken {
    return $this->getKeyword();
  }

  public function getLeftAngleUNTYPED(): ?Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(LessThanToken $value): this {
    if ($value === $this->_left_angle) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_type,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function hasLeftAngle(): bool {
    return true;
  }

  /**
   * @return LessThanToken
   */
  public function getLeftAngle(): LessThanToken {
    return TypeAssert\instance_of(LessThanToken::class, $this->_left_angle);
  }

  /**
   * @return LessThanToken
   */
  public function getLeftAnglex(): LessThanToken {
    return $this->getLeftAngle();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $value,
      $this->_trailing_comma,
      $this->_right_angle,
    );
  }

  public function hasType(): bool {
    return true;
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier | GenericTypeSpecifier
   * | NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | VarrayTypeSpecifier
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | DarrayTypeSpecifier | GenericTypeSpecifier
   * | NullableTypeSpecifier | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * TupleTypeSpecifier | VarrayTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }

  public function getTrailingCommaUNTYPED(): ?Node {
    return $this->_trailing_comma;
  }

  public function withTrailingComma(?CommaToken $value): this {
    if ($value === $this->_trailing_comma) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $this->_type,
      $value,
      $this->_right_angle,
    );
  }

  public function hasTrailingComma(): bool {
    return $this->_trailing_comma !== null;
  }

  /**
   * @return null | CommaToken
   */
  public function getTrailingComma(): ?CommaToken {
    return $this->_trailing_comma;
  }

  /**
   * @return CommaToken
   */
  public function getTrailingCommax(): CommaToken {
    return TypeAssert\not_null($this->getTrailingComma());
  }

  public function getRightAngleUNTYPED(): ?Node {
    return $this->_right_angle;
  }

  public function withRightAngle(GreaterThanToken $value): this {
    if ($value === $this->_right_angle) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_left_angle,
      $this->_type,
      $this->_trailing_comma,
      $value,
    );
  }

  public function hasRightAngle(): bool {
    return true;
  }

  /**
   * @return GreaterThanToken
   */
  public function getRightAngle(): GreaterThanToken {
    return TypeAssert\instance_of(GreaterThanToken::class, $this->_right_angle);
  }

  /**
   * @return GreaterThanToken
   */
  public function getRightAnglex(): GreaterThanToken {
    return $this->getRightAngle();
  }
}
