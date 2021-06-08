/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ea571f5342abf84853cdbb04f1e195e5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class EnumClassLabelExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'enum_class_label_expression';

  private ?Node $_qualifier;
  private ?Node $_hash;
  private ?Node $_expression;

  public function __construct(
    ?Node $qualifier,
    ?Node $hash,
    ?Node $expression,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_qualifier = $qualifier;
    $this->_hash = $hash;
    $this->_expression = $expression;
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
    $qualifier = Node::fromJSON(
      ($json['enum_class_label_qualifier'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $qualifier?->getWidth() ?? 0;
    $hash = Node::fromJSON(
      ($json['enum_class_label_hash'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $hash?->getWidth() ?? 0;
    $expression = Node::fromJSON(
      ($json['enum_class_label_expression'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $expression?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $qualifier,
      /* HH_IGNORE_ERROR[4110] */ $hash,
      /* HH_IGNORE_ERROR[4110] */ $expression,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'qualifier' => $this->_qualifier,
      'hash' => $this->_hash,
      'expression' => $this->_expression,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $qualifier = $this->_qualifier === null
      ? null
      : $rewriter($this->_qualifier, $parents);
    $hash = $this->_hash === null ? null : $rewriter($this->_hash, $parents);
    $expression = $this->_expression === null
      ? null
      : $rewriter($this->_expression, $parents);
    if (
      $qualifier === $this->_qualifier &&
      $hash === $this->_hash &&
      $expression === $this->_expression
    ) {
      return $this;
    }
    return new static(
      $qualifier as ?Node,
      $hash as ?Node,
      $expression as ?Node,
    );
  }

  public function getQualifierUNTYPED(): ?Node {
    return $this->_qualifier;
  }

  public function withQualifier(?Node $value): this {
    if ($value === $this->_qualifier) {
      return $this;
    }
    return new static($value, $this->_hash, $this->_expression);
  }

  public function hasQualifier(): bool {
    return $this->_qualifier !== null;
  }

  /**
   * @return unknown
   */
  public function getQualifier(): ?Node {
    return $this->_qualifier;
  }

  /**
   * @return unknown
   */
  public function getQualifierx(): Node {
    return TypeAssert\not_null($this->getQualifier());
  }

  public function getHashUNTYPED(): ?Node {
    return $this->_hash;
  }

  public function withHash(?Node $value): this {
    if ($value === $this->_hash) {
      return $this;
    }
    return new static($this->_qualifier, $value, $this->_expression);
  }

  public function hasHash(): bool {
    return $this->_hash !== null;
  }

  /**
   * @return unknown
   */
  public function getHash(): ?Node {
    return $this->_hash;
  }

  /**
   * @return unknown
   */
  public function getHashx(): Node {
    return TypeAssert\not_null($this->getHash());
  }

  public function getExpressionUNTYPED(): ?Node {
    return $this->_expression;
  }

  public function withExpression(?Node $value): this {
    if ($value === $this->_expression) {
      return $this;
    }
    return new static($this->_qualifier, $this->_hash, $value);
  }

  public function hasExpression(): bool {
    return $this->_expression !== null;
  }

  /**
   * @return unknown
   */
  public function getExpression(): ?Node {
    return $this->_expression;
  }

  /**
   * @return unknown
   */
  public function getExpressionx(): Node {
    return TypeAssert\not_null($this->getExpression());
  }
}
