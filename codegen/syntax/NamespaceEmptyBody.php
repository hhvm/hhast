<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ac4183eef7026ed24add1e552e8c7a66>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class NamespaceEmptyBody extends EditableNode {

  private EditableNode $_semicolon;

  public function __construct(EditableNode $semicolon) {
    parent::__construct('namespace_empty_body');
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict['semicolon' => $this->_semicolon];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if ($semicolon === $this->_semicolon) {
      return $this;
    }
    return new self($semicolon);
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
