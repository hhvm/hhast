<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ecb5f8b3bb0ac0306957bf143ac8c175>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class FunctionDeclaration extends EditableSyntax {

  private EditableSyntax $_attribute_spec;
  private EditableSyntax $_declaration_header;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $attribute_spec,
    EditableSyntax $declaration_header,
    EditableSyntax $body,
  ) {
    parent::__construct('function_declaration');
    $this->_attribute_spec = $attribute_spec;
    $this->_declaration_header = $declaration_header;
    $this->_body = $body;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $attribute_spec = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_attribute_spec'],
      $position,
      $source,
    );
    $position += $attribute_spec->width();
    $declaration_header = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_declaration_header'],
      $position,
      $source,
    );
    $position += $declaration_header->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['function_body'],
      $position,
      $source,
    );
    $position += $body->width();
    return new self($attribute_spec, $declaration_header, $body);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'attribute_spec' => $this->_attribute_spec;
    yield 'declaration_header' => $this->_declaration_header;
    yield 'body' => $this->_body;
  }

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $attribute_spec =
      $this->_attribute_spec->rewrite($rewriter, $child_parents);
    $declaration_header =
      $this->_declaration_header->rewrite($rewriter, $child_parents);
    $body = $this->_body->rewrite($rewriter, $child_parents);
    if (
      $attribute_spec === $this->_attribute_spec &&
      $declaration_header === $this->_declaration_header &&
      $body === $this->_body
    ) {
      $node = $this;
    } else {
      $node = new self($attribute_spec, $declaration_header, $body);
    }
    return $rewriter($node, $parents);
  }

  public function attribute_spec(): ?AttributeSpecification {
    return $this->_attribute_spec->is_missing()
      ? null
      : TypeAssert::isInstanceOf(
          AttributeSpecification::class,
          $this->_attribute_spec,
        );
  }

  public function attribute_specx(): AttributeSpecification {
    return TypeAssert::isInstanceOf(
      AttributeSpecification::class,
      $this->_attribute_spec,
    );
  }

  public function raw_attribute_spec(): EditableSyntax {
    return $this->_attribute_spec;
  }

  public function with_attribute_spec(EditableSyntax $value): this {
    return new self($value, $this->_declaration_header, $this->_body);
  }

  public function declaration_header(): FunctionDeclarationHeader {
    return $this->declaration_headerx();
  }

  public function declaration_headerx(): FunctionDeclarationHeader {
    return TypeAssert::isInstanceOf(
      FunctionDeclarationHeader::class,
      $this->_declaration_header,
    );
  }

  public function raw_declaration_header(): EditableSyntax {
    return $this->_declaration_header;
  }

  public function with_declaration_header(EditableSyntax $value): this {
    return new self($this->_attribute_spec, $value, $this->_body);
  }

  public function body(): EditableSyntax {
    return $this->bodyx();
  }

  public function bodyx(): EditableSyntax {
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_body);
  }

  public function raw_body(): EditableSyntax {
    return $this->_body;
  }

  public function with_body(EditableSyntax $value): this {
    return new self($this->_attribute_spec, $this->_declaration_header, $value);
  }
}
