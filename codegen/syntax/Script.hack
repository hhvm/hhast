/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7da33ffe24a7379d74f8da1110b2e217>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
abstract class ScriptGeneratedBase extends EditableNode {

  const string SYNTAX_KIND = 'script';

  private EditableNode $_declarations;

  public function __construct(
    EditableNode $declarations,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_declarations = $declarations;
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
    $declarations = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['script_declarations'],
      $file,
      $offset,
      $source,
    );
    $offset += $declarations->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($declarations, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'declarations' => $this->_declarations,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $declarations = $rewriter($this->_declarations, $parents);
    if ($declarations === $this->_declarations) {
      return $this;
    }
    return new static($declarations);
  }

  public function getDeclarationsUNTYPED(): EditableNode {
    return $this->_declarations;
  }

  public function withDeclarations(EditableNode $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new static($value);
  }

  public function hasDeclarations(): bool {
    return !$this->_declarations->isMissing();
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getDeclarations(): EditableList<EditableNode> {
    return TypeAssert\instance_of(EditableList::class, $this->_declarations);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getDeclarationsx(): EditableList<EditableNode> {
    return $this->getDeclarations();
  }
}
