<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<353402a2371b0d7141e6d0355694e915>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

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

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $name = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enumerator_name'],
      $position,
      $source,
    );
    $position += $name->width();
    $equal = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enumerator_equal'],
      $position,
      $source,
    );
    $position += $equal->width();
    $value = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enumerator_value'],
      $position,
      $source,
    );
    $position += $value->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['enumerator_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($name, $equal, $value, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'name' => $this->_name;
    yield 'equal' => $this->_equal;
    yield 'value' => $this->_value;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite_children(
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

  public function name(): NameToken {
    return $this->namex();
  }

  public function namex(): NameToken {
    return TypeAssert::isInstanceOf(NameToken::class, $this->_name);
  }

  public function raw_name(): EditableSyntax {
    return $this->_name;
  }

  public function with_name(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($value, $this->_equal, $this->_value, $this->_semicolon);
  }

  public function equal(): EqualToken {
    return $this->equalx();
  }

  public function equalx(): EqualToken {
    return TypeAssert::isInstanceOf(EqualToken::class, $this->_equal);
  }

  public function raw_equal(): EditableSyntax {
    return $this->_equal;
  }

  public function with_equal(EditableSyntax $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new self($this->_name, $value, $this->_value, $this->_semicolon);
  }

  public function value(): EditableSyntax {
    return $this->valuex();
  }

  public function valuex(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_value);
  }

  public function raw_value(): EditableSyntax {
    return $this->_value;
  }

  public function with_value(EditableSyntax $value): this {
    if ($value === $this->_value) {
      return $this;
    }
    return new self($this->_name, $this->_equal, $value, $this->_semicolon);
  }

  public function semicolon(): SemicolonToken {
    return $this->semicolonx();
  }

  public function semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_name, $this->_equal, $this->_value, $value);
  }
}
