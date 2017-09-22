<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b69caba561330fa2e4e110ced1882baa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class RequireClause extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_kind;
  private EditableNode $_name;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $kind,
    EditableNode $name,
    EditableNode $semicolon,
  ) {
    parent::__construct('require_clause');
    $this->_keyword = $keyword;
    $this->_kind = $kind;
    $this->_name = $name;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['require_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $kind = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['require_kind'],
      $position,
      $source,
    );
    $position += $kind->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['require_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['require_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->getWidth();
    return new self($keyword, $kind, $name, $semicolon);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'kind' => $this->_kind,
      'name' => $this->_name,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $kind = $this->_kind->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $kind === $this->_kind &&
      $name === $this->_name &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $kind, $name, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_kind, $this->_name, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns RequireToken
   */
  public function getKeyword(): RequireToken {
    return TypeAssert\instance_of(RequireToken::class, $this->_keyword);
  }

  public function getKindUNTYPED(): EditableNode {
    return $this->_kind;
  }

  public function withKind(EditableNode $value): this {
    if ($value === $this->_kind) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_name, $this->_semicolon);
  }

  public function hasKind(): bool {
    return !$this->_kind->isMissing();
  }

  /**
   * @returns ExtendsToken | ImplementsToken
   */
  public function getKind(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_kind);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_keyword, $this->_kind, $value, $this->_semicolon);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier | GenericTypeSpecifier
   */
  public function getName(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_keyword, $this->_kind, $this->_name, $value);
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
