/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<928736883fc6861fc2dcb834e258f805>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class QualifiedName extends EditableNode {

  private EditableNode $_parts;

  public function __construct(EditableNode $parts) {
    parent::__construct('qualified_name');
    $this->_parts = $parts;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $parts = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['qualified_name_parts'],
      $file,
      $offset,
      $source,
    );
    $offset += $parts->getWidth();
    return new static($parts);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'parts' => $this->_parts,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $parts = $this->_parts->rewrite($rewriter, $parents);
    if ($parts === $this->_parts) {
      return $this;
    }
    return new static($parts);
  }

  public function getPartsUNTYPED(): EditableNode {
    return $this->_parts;
  }

  public function withParts(EditableNode $value): this {
    if ($value === $this->_parts) {
      return $this;
    }
    return new static($value);
  }

  public function hasParts(): bool {
    return !$this->_parts->isMissing();
  }

  /**
   * @return EditableList<?NameToken> | EditableList<NameToken>
   */
  public function getParts(): EditableList<?NameToken> {
    return TypeAssert\instance_of(EditableList::class, $this->_parts);
  }

  /**
   * @return EditableList<?NameToken> | EditableList<NameToken>
   */
  public function getPartsx(): EditableList<?NameToken> {
    return $this->getParts();
  }
}
