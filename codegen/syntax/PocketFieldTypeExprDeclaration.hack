/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<cd5d903ba56183adcccb4a9139eb6be8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class PocketFieldTypeExprDeclaration extends EditableNode {

  private EditableNode $_case;
  private EditableNode $_type;
  private EditableNode $_name;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $case,
    EditableNode $type,
    EditableNode $name,
    EditableNode $semicolon,
  ) {
    parent::__construct('pocket_field_type_expr_declaration');
    $this->_case = $case;
    $this->_type = $type;
    $this->_name = $name;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $case = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_field_type_expr_case'],
      $file,
      $offset,
      $source,
    );
    $offset += $case->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_field_type_expr_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_field_type_expr_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['pocket_field_type_expr_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new static($case, $type, $name, $semicolon);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'case' => $this->_case,
      'type' => $this->_type,
      'name' => $this->_name,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $case = $this->_case->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $case === $this->_case &&
      $type === $this->_type &&
      $name === $this->_name &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($case, $type, $name, $semicolon);
  }

  public function getCaseUNTYPED(): EditableNode {
    return $this->_case;
  }

  public function withCase(EditableNode $value): this {
    if ($value === $this->_case) {
      return $this;
    }
    return new static($value, $this->_type, $this->_name, $this->_semicolon);
  }

  public function hasCase(): bool {
    return !$this->_case->isMissing();
  }

  /**
   * @return unknown
   */
  public function getCase(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_case);
  }

  /**
   * @return unknown
   */
  public function getCasex(): EditableNode {
    return $this->getCase();
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_case, $value, $this->_name, $this->_semicolon);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return unknown
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return unknown
   */
  public function getTypex(): EditableNode {
    return $this->getType();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_case, $this->_type, $value, $this->_semicolon);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return unknown
   */
  public function getName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  /**
   * @return unknown
   */
  public function getNamex(): EditableNode {
    return $this->getName();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_case, $this->_type, $this->_name, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @return unknown
   */
  public function getSemicolon(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_semicolon);
  }

  /**
   * @return unknown
   */
  public function getSemicolonx(): EditableNode {
    return $this->getSemicolon();
  }
}
