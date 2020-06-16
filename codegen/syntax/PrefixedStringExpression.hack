/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<97317dfbb961c3536688711f334704aa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class PrefixedStringExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'prefixed_string_expression';

  private ?Node $_name;
  private ?Node $_str;

  public function __construct(
    ?Node $name,
    ?Node $str,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_str = $str;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['prefixed_string_name'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $name?->getWidth() ?? 0;
    $str = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['prefixed_string_str'] ?? dict['kind' => 'missing'],
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $str?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $str,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'str' => $this->_str,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $this->_name === null ? null : $rewriter($this->_name, $parents);
    $str = $this->_str === null ? null : $rewriter($this->_str, $parents);
    if ($name === $this->_name && $str === $this->_str) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $str,
    );
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(?Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_str);
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

  public function getStrUNTYPED(): ?Node {
    return $this->_str;
  }

  public function withStr(?Node $value): this {
    if ($value === $this->_str) {
      return $this;
    }
    return new static($this->_name, $value);
  }

  public function hasStr(): bool {
    return $this->_str !== null;
  }

  /**
   * @return unknown
   */
  public function getStr(): ?Node {
    return $this->_str;
  }

  /**
   * @return unknown
   */
  public function getStrx(): Node {
    return TypeAssert\not_null($this->getStr());
  }
}
