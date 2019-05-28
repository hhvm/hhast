/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2667e332646e0c86fc2d4e6090019537>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class GotoLabel extends EditableNode implements IStatement {

  const string SYNTAX_KIND = 'goto_label';

  private EditableNode $_name;
  private EditableNode $_colon;

  public function __construct(
    EditableNode $name,
    EditableNode $colon,
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
  ): this {
    $offset = $initial_offset;
    $name = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['goto_label_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $colon = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['goto_label_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($name, $colon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'colon' => $this->_colon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $name = $rewriter($this->_name, $parents);
    $colon = $rewriter($this->_colon, $parents);
    if ($name === $this->_name && $colon === $this->_colon) {
      return $this;
    }
    return new static($name, $colon);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($value, $this->_colon);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
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

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static($this->_name, $value);
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
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
