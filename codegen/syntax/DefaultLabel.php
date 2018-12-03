<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<26b10d3d5da8efae924119e0164209f7>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
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
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['default_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['default_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    return new static($keyword, $colon);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
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
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    if ($keyword === $this->_keyword && $colon === $this->_colon) {
      return $this;
    }
    return new static($keyword, $colon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_colon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return DefaultToken
   */
  public function getKeyword(): DefaultToken {
    return TypeAssert\instance_of(DefaultToken::class, $this->_keyword);
  }

  /**
   * @return DefaultToken
   */
  public function getKeywordx(): DefaultToken {
    return $this->getKeyword();
  }

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @return ColonToken | SemicolonToken
   */
  public function getColon(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_colon);
  }

  /**
   * @return ColonToken | SemicolonToken
   */
  public function getColonx(): EditableToken {
    return $this->getColon();
  }
}
