/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<60a4ee6f54ded383443ba253f640418f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class DefaultLabel extends EditableNode implements ISwitchLabel {

  private EditableNode $_keyword;
  private EditableNode $_colon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $colon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_colon = $colon;
    parent::__construct('default_label', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
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
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($keyword, $colon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'colon' => $this->_colon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $colon = $rewriter($this->_colon, $parents);
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
