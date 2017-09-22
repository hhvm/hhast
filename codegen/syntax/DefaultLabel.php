<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<7a516d9ef297fc511811b0f97c8c4803>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class DefaultLabel extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_colon;

  public function __construct(EditableNode $keyword, EditableNode $colon) {
    parent::__construct('default_label');
    $this->_keyword = $keyword;
    $this->_colon = $colon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['default_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['default_colon'],
      $position,
      $source,
    );
    $position += $colon->getWidth();
    return new self($keyword, $colon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict['keyword' => $this->_keyword, 'colon' => $this->_colon];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    if ($keyword === $this->_keyword && $colon === $this->_colon) {
      return $this;
    }
    return new self($keyword, $colon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_colon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns DefaultToken
   */
  public function getKeyword(): DefaultToken {
    return TypeAssert\instance_of(DefaultToken::class, $this->_keyword);
  }

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new self($this->_keyword, $value);
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @returns ColonToken | SemicolonToken
   */
  public function getColon(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_colon);
  }
}
