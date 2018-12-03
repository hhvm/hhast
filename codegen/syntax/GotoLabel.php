<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e95b5d63c2ac17dbedbee736c5c8b2d5>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class GotoLabel extends EditableNode {

  private EditableNode $_name;
  private EditableNode $_colon;

  public function __construct(EditableNode $name, EditableNode $colon) {
    parent::__construct('goto_label');
    $this->_name = $name;
    $this->_colon = $colon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['goto_label_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['goto_label_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    return new static($name, $colon);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'name' => $this->_name,
      'colon' => $this->_colon,
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
    $colon = $this->_colon->rewrite($rewriter, $parents);
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
