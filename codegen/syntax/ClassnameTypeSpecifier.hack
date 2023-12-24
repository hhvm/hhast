/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<816cb6bbb8e37b3ee2bd9f365d5ae4d9>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ClassnameTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'classname_type_specifier';

  private ClassnameToken $_keyword;
  private ?LessThanToken $_left_angle;
  private ?ITypeSpecifier $_type;
  private ?Node $_trailing_comma;
  private ?GreaterThanToken $_right_angle;

  public function __construct(
    ClassnameToken $keyword,
    ?LessThanToken $left_angle,
    ?ITypeSpecifier $type,
    ?Node $trailing_comma,
    ?GreaterThanToken $right_angle,
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
      ($json['classname_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ClassnameToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $left_angle = Node::fromJSON(
      ($json['classname_left_angle'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'LessThanToken',
    );
    $offset += $left_angle?->getWidth() ?? 0;
    $type = Node::fromJSON(
      ($json['classname_type'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $offset += $type?->getWidth() ?? 0;
    $trailing_comma = Node::fromJSON(
      ($json['classname_trailing_comma'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $trailing_comma?->getWidth() ?? 0;
    $right_angle = Node::fromJSON(
      ($json['classname_right_angle'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'GreaterThanToken',
    );
    $offset += $right_angle?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword as ClassnameToken,
      $left_angle as ?LessThanToken,
      $type as ?ITypeSpecifier,
      $trailing_comma,
      $right_angle as ?GreaterThanToken,
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
    $left_angle = $this->_left_angle === null
      ? null
      : $rewriter($this->_left_angle, $parents);
    $type = $this->_type === null ? null : $rewriter($this->_type, $parents);
    $trailing_comma = $this->_trailing_comma === null
      ? null
      : $rewriter($this->_trailing_comma, $parents);
    $right_angle = $this->_right_angle === null
      ? null
      : $rewriter($this->_right_angle, $parents);
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
      $keyword as ClassnameToken,
      $left_angle as ?LessThanToken,
      $type as ?ITypeSpecifier,
      $trailing_comma as ?Node,
      $right_angle as ?GreaterThanToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(ClassnameToken $value): this {
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
   * @return ClassnameToken
   */
  public function getKeyword(): ClassnameToken {
    return TypeAssert\instance_of(ClassnameToken::class, $this->_keyword);
  }

  /**
   * @return ClassnameToken
   */
  public function getKeywordx(): ClassnameToken {
    return $this->getKeyword();
  }

  public function getLeftAngleUNTYPED(): ?Node {
    return $this->_left_angle;
  }

  public function withLeftAngle(?LessThanToken $value): this {
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
    return $this->_left_angle !== null;
  }

  /**
   * @return null | LessThanToken
   */
  public function getLeftAngle(): ?LessThanToken {
    return $this->_left_angle;
  }

  /**
   * @return LessThanToken
   */
  public function getLeftAnglex(): LessThanToken {
    return TypeAssert\not_null($this->getLeftAngle());
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(?ITypeSpecifier $value): this {
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
    return $this->_type !== null;
  }

  /**
   * @return GenericTypeSpecifier | null | SimpleTypeSpecifier | TypeConstant
   */
  public function getType(): ?ITypeSpecifier {
    return $this->_type;
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier | TypeConstant
   */
  public function getTypex(): ITypeSpecifier {
    return TypeAssert\not_null($this->getType());
  }

  public function getTrailingCommaUNTYPED(): ?Node {
    return $this->_trailing_comma;
  }

  public function withTrailingComma(?Node $value): this {
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
   * @return null
   */
  public function getTrailingComma(): ?Node {
    return $this->_trailing_comma;
  }

  /**
   * @return
   */
  public function getTrailingCommax(): Node {
    return TypeAssert\not_null($this->getTrailingComma());
  }

  public function getRightAngleUNTYPED(): ?Node {
    return $this->_right_angle;
  }

  public function withRightAngle(?GreaterThanToken $value): this {
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
    return $this->_right_angle !== null;
  }

  /**
   * @return null | GreaterThanToken
   */
  public function getRightAngle(): ?GreaterThanToken {
    return $this->_right_angle;
  }

  /**
   * @return GreaterThanToken
   */
  public function getRightAnglex(): GreaterThanToken {
    return TypeAssert\not_null($this->getRightAngle());
  }
}
