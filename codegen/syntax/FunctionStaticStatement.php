<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<32a37b9a5d77f0e940798d39d3cab9da>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class FunctionStaticStatement extends EditableNode {

  private EditableNode $_static_keyword;
  private EditableNode $_declarations;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $static_keyword,
    EditableNode $declarations,
    EditableNode $semicolon,
  ) {
    parent::__construct('function_static_statement');
    $this->_static_keyword = $static_keyword;
    $this->_declarations = $declarations;
    $this->_semicolon = $semicolon;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $static_keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['static_static_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $static_keyword->getWidth();
    $declarations = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['static_declarations'],
      $file,
      $offset,
      $source,
    );
    $offset += $declarations->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['static_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    return new self($static_keyword, $declarations, $semicolon);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'static_keyword' => $this->_static_keyword,
      'declarations' => $this->_declarations,
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
    $static_keyword = $this->_static_keyword->rewrite($rewriter, $parents);
    $declarations = $this->_declarations->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $static_keyword === $this->_static_keyword &&
      $declarations === $this->_declarations &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($static_keyword, $declarations, $semicolon);
  }

  public function getStaticKeywordUNTYPED(): EditableNode {
    return $this->_static_keyword;
  }

  public function withStaticKeyword(EditableNode $value): this {
    if ($value === $this->_static_keyword) {
      return $this;
    }
    return new self($value, $this->_declarations, $this->_semicolon);
  }

  public function hasStaticKeyword(): bool {
    return !$this->_static_keyword->isMissing();
  }

  /**
   * @returns StaticToken
   */
  public function getStaticKeyword(): StaticToken {
    return TypeAssert\instance_of(StaticToken::class, $this->_static_keyword);
  }

  public function getDeclarationsUNTYPED(): EditableNode {
    return $this->_declarations;
  }

  public function withDeclarations(EditableNode $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new self($this->_static_keyword, $value, $this->_semicolon);
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

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new self($this->_static_keyword, $this->_declarations, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @returns SemicolonToken | Missing
   */
  public function getSemicolon(): ?SemicolonToken {
    if ($this->_semicolon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @returns SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }
}
