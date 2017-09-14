<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<fc1c432dfd00ad3f34da3ef55fb2aa25>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPRequired extends EditableSyntax {

  private EditableSyntax $_at;
  private EditableSyntax $_keyword;

  public function __construct(EditableSyntax $at, EditableSyntax $keyword) {
    parent::__construct('xhp_required');
    $this->_at = $at;
    $this->_keyword = $keyword;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $at = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_required_at'],
      $position,
      $source,
    );
    $position += $at->getWidth();
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_required_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    return new self($at, $keyword);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'at' => $this->_at;
    yield 'keyword' => $this->_keyword;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $at = $this->_at->rewrite($rewriter, $parents);
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    if (
      $at === $this->_at &&
      $keyword === $this->_keyword
    ) {
      return $this;
    }
    return new self($at, $keyword);
  }

  public function getAtUNTYPED(): EditableSyntax {
    return $this->_at;
  }

  public function withAt(EditableSyntax $value): this {
    if ($value === $this->_at) {
      return $this;
    }
    return new self($value, $this->_keyword);
  }

  public function hasAt(): bool {
    return !$this->_at->isMissing();
  }

  /**
   * @returns AtToken
   */
  public function getAt(): AtToken {
    return TypeAssert::isInstanceOf(AtToken::class, $this->_at);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($this->_at, $value);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns RequiredToken
   */
  public function getKeyword(): RequiredToken {
    return TypeAssert::isInstanceOf(RequiredToken::class, $this->_keyword);
  }
}
