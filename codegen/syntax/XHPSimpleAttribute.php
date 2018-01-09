<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5f37defd63f945ca5ad67a5d687e7053>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class XHPSimpleAttribute extends EditableNode {

  private EditableNode $_name;
  private EditableNode $_equal;
  private EditableNode $_expression;

  public function __construct(
    EditableNode $name,
    EditableNode $equal,
    EditableNode $expression,
  ) {
    parent::__construct('xhp_simple_attribute');
    $this->_name = $name;
    $this->_equal = $equal;
    $this->_expression = $expression;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_simple_attribute_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $equal = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_simple_attribute_equal'],
      $file,
      $offset,
      $source,
    );
    $offset += $equal->getWidth();
    $expression = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_simple_attribute_expression'],
      $file,
      $offset,
      $source,
    );
    $offset += $expression->getWidth();
    return new self($name, $equal, $expression);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'equal' => $this->_equal,
      'expression' => $this->_expression,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $name = $this->_name->rewrite($rewriter, $parents);
    $equal = $this->_equal->rewrite($rewriter, $parents);
    $expression = $this->_expression->rewrite($rewriter, $parents);
    if (
      $name === $this->_name &&
      $equal === $this->_equal &&
      $expression === $this->_expression
    ) {
      return $this;
    }
    return new self($name, $equal, $expression);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($value, $this->_equal, $this->_expression);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns XHPElementNameToken
   */
  public function getName(): XHPElementNameToken {
    return TypeAssert\instance_of(XHPElementNameToken::class, $this->_name);
  }

  public function getEqualUNTYPED(): EditableNode {
    return $this->_equal;
  }

  public function withEqual(EditableNode $value): this {
    if ($value === $this->_equal) {
      return $this;
    }
    return new self($this->_name, $value, $this->_expression);
  }

  public function hasEqual(): bool {
    return !$this->_equal->isMissing();
  }

  /**
   * @returns EqualToken | Missing
   */
  public function getEqual(): ?EqualToken {
    if ($this->_equal->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  /**
   * @returns EqualToken
   */
  public function getEqualx(): EqualToken {
    return TypeAssert\instance_of(EqualToken::class, $this->_equal);
  }

  public function getExpressionUNTYPED(): EditableNode {
    return $this->_expression;
  }

  public function withExpression(EditableNode $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new self($this->_name, $this->_equal, $value);
  }

  public function hasExpression(): bool {
    return !$this->_expression->isMissing();
  }

  /**
   * @returns BracedExpression | XHPStringLiteralToken | Missing
   */
  public function getExpression(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_expression);
  }
}
