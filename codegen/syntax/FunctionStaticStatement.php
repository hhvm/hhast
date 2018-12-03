<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0778d4161d8d42f7246d448261462a00>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
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
    return new static($static_keyword, $declarations, $semicolon);
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
    return new static($static_keyword, $declarations, $semicolon);
  }

  public function getStaticKeywordUNTYPED(): EditableNode {
    return $this->_static_keyword;
  }

  public function withStaticKeyword(EditableNode $value): this {
    if ($value === $this->_static_keyword) {
      return $this;
    }
    return new static($value, $this->_declarations, $this->_semicolon);
  }

  public function hasStaticKeyword(): bool {
    return !$this->_static_keyword->isMissing();
  }

  /**
   * @return StaticToken
   */
  public function getStaticKeyword(): StaticToken {
    return TypeAssert\instance_of(StaticToken::class, $this->_static_keyword);
  }

  /**
   * @return StaticToken
   */
  public function getStaticKeywordx(): StaticToken {
    return $this->getStaticKeyword();
  }

  public function getDeclarationsUNTYPED(): EditableNode {
    return $this->_declarations;
  }

  public function withDeclarations(EditableNode $value): this {
    if ($value === $this->_declarations) {
      return $this;
    }
    return new static($this->_static_keyword, $value, $this->_semicolon);
  }

  public function hasDeclarations(): bool {
    return !$this->_declarations->isMissing();
  }

  /**
   * @return EditableList<StaticDeclarator>
   */
  public function getDeclarations(): EditableList<StaticDeclarator> {
    return TypeAssert\instance_of(EditableList::class, $this->_declarations);
  }

  /**
   * @return EditableList<StaticDeclarator>
   */
  public function getDeclarationsx(): EditableList<StaticDeclarator> {
    return $this->getDeclarations();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_static_keyword, $this->_declarations, $value);
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
