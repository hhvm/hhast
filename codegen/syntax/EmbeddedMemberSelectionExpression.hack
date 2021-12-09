/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a139d2b4d92ce303a43c3d751f5ed835>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class EmbeddedMemberSelectionExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'embedded_member_selection_expression';

  private ?Node $_object;
  private ?Node $_operator;
  private ?Node $_name;

  public function __construct(
    ?Node $object,
    ?Node $operator,
    ?Node $name,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_object = $object;
    $this->_operator = $operator;
    $this->_name = $name;
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
    $object = Node::fromJSON(
      ($json['embedded_member_object'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $object?->getWidth() ?? 0;
    $operator = Node::fromJSON(
      ($json['embedded_member_operator'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $operator?->getWidth() ?? 0;
    $name = Node::fromJSON(
      ($json['embedded_member_name'] ?? dict['kind' => 'missing'])
        as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $object,
      /* HH_IGNORE_ERROR[4110] */ $operator,
      /* HH_IGNORE_ERROR[4110] */ $name,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'object' => $this->_object,
      'operator' => $this->_operator,
      'name' => $this->_name,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $object =
      $this->_object === null ? null : $rewriter($this->_object, $parents);
    $operator =
      $this->_operator === null ? null : $rewriter($this->_operator, $parents);
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    if (
      $object === $this->_object &&
      $operator === $this->_operator &&
      $name === $this->_name
    ) {
      return $this;
    }
    return new static($object as ?Node, $operator as ?Node, $name as ?Node);
  }

  public function getObjectUNTYPED(): ?Node {
    return $this->_object;
  }

  public function withObject(?Node $value): this {
    if ($value === $this->_object) {
      return $this;
    }
    return new static($value, $this->_operator, $this->_name);
  }

  public function hasObject(): bool {
    return $this->_object !== null;
  }

  /**
   * @return unknown
   */
  public function getObject(): ?Node {
    return $this->_object;
  }

  /**
   * @return unknown
   */
  public function getObjectx(): Node {
    return TypeAssert\not_null($this->getObject());
  }

  public function getOperatorUNTYPED(): ?Node {
    return $this->_operator;
  }

  public function withOperator(?Node $value): this {
    if ($value === $this->_operator) {
      return $this;
    }
    return new static($this->_object, $value, $this->_name);
  }

  public function hasOperator(): bool {
    return $this->_operator !== null;
  }

  /**
   * @return unknown
   */
  public function getOperator(): ?Node {
    return $this->_operator;
  }

  /**
   * @return unknown
   */
  public function getOperatorx(): Node {
    return TypeAssert\not_null($this->getOperator());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_object, $this->_operator, $value);
  }

  public function hasName(): bool {
    return $this->_name !== null;
  }

  /**
   * @return unknown
   */
  public function getName(): ?Node {
    return $this->_name;
  }

  /**
   * @return unknown
   */
  public function getNamex(): Node {
    return TypeAssert\not_null($this->getName());
  }
}
