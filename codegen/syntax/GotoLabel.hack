/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ddf11979fa158bd15a171b7511f6c70c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class GotoLabel extends Node implements IStatement {

  const string SYNTAX_KIND = 'goto_label';

  private NameToken $_name;
  private ColonToken $_colon;

  public function __construct(
    NameToken $name,
    ColonToken $colon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_name = $name;
    $this->_colon = $colon;
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
      /* HH_FIXME[4110] */ $json['goto_label_name'],
      $file,
      $offset,
      $source,
      'NameToken',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['goto_label_colon'],
      $file,
      $offset,
      $source,
      'ColonToken',
    );
    $colon = $colon as nonnull;
    $offset += $colon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $colon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'name' => $this->_name,
      'colon' => $this->_colon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $rewriter($this->_name, $parents);
    $colon = $rewriter($this->_colon, $parents);
    if ($name === $this->_name && $colon === $this->_colon) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $name,
      /* HH_FIXME[4110] use `as` */ $colon,
    );
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(NameToken $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_colon);
  }

  public function hasName(): bool {
    return $this->_name !== null;
  }

  /**
   * @return NameToken
   */
  public function getName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  /**
   * @return NameToken
   */
  public function getNamex(): NameToken {
    return $this->getName();
  }

  public function getColonUNTYPED(): ?Node {
    return $this->_colon;
  }

  public function withColon(ColonToken $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static($this->_name, $value);
  }

  public function hasColon(): bool {
    return $this->_colon !== null;
  }

  /**
   * @return ColonToken
   */
  public function getColon(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return $this->getColon();
  }
}
