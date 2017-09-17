<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2d76f1343b9a28ebf5d70aa512a00946>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class Enumerator extends EditableSyntax {

  private EditableSyntax $_name;
  private EditableSyntax $_equal;
  private EditableSyntax $_value;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $name,
    EditableSyntax $equal,
    EditableSyntax $value,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('enumerator');
    $this->_name = $name;
    $this->_equal = $equal;
    $this->_value = $value;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['enumerator_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $equal = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['enumerator_equal'],
      $position,
      $source,
    );
    $position += $equal->getWidth();
    $value = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['enumerator_value'],
      $position,
      $source,
    );
    $position += $value->getWidth();
    $semicolon = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['enumerator_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($name, $equal, $value, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'equal' => $this->_equal;
    yield 'value' => $this->_value;
    yield 'semicolon' => $this->_semicolon;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $equal = $this->_equal->rewrite($rewriter, $parents);
    $value = $this->_value->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $equal === $this->_equal &&
      $value === $this->_value &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($name, $equal, $value, $semicolon);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($value, $this->_equal, $this->_value, $this->_semicolon);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns NameToken
   */
  public function getName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  public function getEqualUNTYPED(): EditableSyntax {
    return $this->_equal;
  }

  public function withEqual(EditableSyntax $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new self($this->_name, $value, $this->_value, $this->_semicolon);
  }

  public function hasEqual(): bool {
    return !$this->_equal->isMissing();
  }

  /**
   * @returns EqualToken
   */
  public function getEqual(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  public function getValueUNTYPED(): EditableSyntax {
    return $this->_value;
  }

  public function withValue(EditableSyntax $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new self($this->_name, $this->_equal, $value, $this->_semicolon);
  }

  public function hasValue(): bool {
    return !$this->_value->isMissing();
  }

  /**
   * @returns LiteralExpression | ScopeResolutionExpression | BinaryExpression
   */
  public function getValue(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_value);
  }

  public function getSemicolonUNTYPED(): EditableSyntax {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_name, $this->_equal, $this->_value, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
