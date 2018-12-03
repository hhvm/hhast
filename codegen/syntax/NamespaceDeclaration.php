<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8a1fb20674d6644f8671275e37181d54>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
abstract class NamespaceDeclarationGeneratedBase extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_name;
  private EditableNode $_body;

  public function __construct(
    EditableNode $keyword,
    EditableNode $name,
    EditableNode $body,
  ) {
    parent::__construct('namespace_declaration');
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_body = $body;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
    return new static($keyword, $name, $body);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'body' => $this->_body,
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
    $name = $this->_name->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new static($keyword, $name, $body);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_name, $this->_body);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return NamespaceToken
   */
  public function getKeyword(): NamespaceToken {
    return TypeAssert\instance_of(NamespaceToken::class, $this->_keyword);
  }

  /**
   * @return NamespaceToken
   */
  public function getKeywordx(): NamespaceToken {
    return $this->getKeyword();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_body);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return null | QualifiedName | NameToken
   */
  public function getName(): ?EditableNode {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  /**
   * @return QualifiedName | NameToken
   */
  public function getNamex(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_name);
  }

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static($this->_keyword, $this->_name, $value);
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @return NamespaceBody | NamespaceEmptyBody
   */
  public function getBody(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_body);
  }

  /**
   * @return NamespaceBody | NamespaceEmptyBody
   */
  public function getBodyx(): EditableNode {
    return $this->getBody();
  }
}
