<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a31437ad27d05fd2c1d62a53c76c9ea0>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class SwitchFallthrough extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_semicolon;

  public function __construct(EditableNode $keyword, EditableNode $semicolon) {
    parent::__construct('switch_fallthrough');
    $this->_keyword = $keyword;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['fallthrough_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['fallthrough_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new static($keyword, $semicolon);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if ($keyword === $this->_keyword && $semicolon === $this->_semicolon) {
      return $this;
    }
    return new static($keyword, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns Missing
   */
  public function getKeyword(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_keyword);
  }

  /**
   * @returns Missing
   */
  public function getKeywordx(): EditableNode {
    return $this->getKeyword();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns Missing
   */
  public function getSemicolon(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_semicolon);
  }

  /**
   * @returns Missing
   */
  public function getSemicolonx(): EditableNode {
    return $this->getSemicolon();
  }
}
