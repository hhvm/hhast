<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<1893f4509dda6f2d9ce1e5982368e790>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class Script extends EditableNode {

  private EditableNode $_declarations;

  public function __construct(EditableNode $declarations) {
    parent::__construct('script');
    $this->_declarations = $declarations;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $declarations = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['script_declarations'],
      $file,
      $offset,
      $source,
    );
    $offset += $declarations->getWidth();
    return new self($declarations);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'declarations' => $this->_declarations,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $declarations = $this->_declarations->rewrite($rewriter, $parents);
    if ($declarations === $this->_declarations) {
      return $this;
    }
    return new self($declarations);
  }

  public function getDeclarationsUNTYPED(): EditableNode {
    return $this->_declarations;
  }

  public function withDeclarations(EditableNode $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new self($value);
  }

  public function hasDeclarations(): bool {
    return !$this->_declarations->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getDeclarations(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_declarations);
  }
}
