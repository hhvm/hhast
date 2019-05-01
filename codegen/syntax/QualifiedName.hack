/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<bdaab15d85dd59d6b9d3d7a762c3b7bf>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class QualifiedName extends EditableNode {

  private EditableNode $_parts;

  public function __construct(
    EditableNode $parts,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_parts = $parts;
    parent::__construct('qualified_name', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $parts = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['qualified_name_parts'],
      $file,
      $offset,
      $source,
    );
    $offset += $parts->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($parts, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'parts' => $this->_parts,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $parts = $rewriter($this->_parts, $parents);
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
