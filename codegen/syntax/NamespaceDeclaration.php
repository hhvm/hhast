<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5f91525ff09a28d215597c03066e9f0f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class NamespaceDeclaration extends EditableNode {

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
    return new self($keyword, $name, $body);
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
    return new self($keyword, $name, $body);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_name, $this->_body);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns NamespaceToken
   */
  public function getKeyword(): NamespaceToken {
    return TypeAssert\instance_of(NamespaceToken::class, $this->_keyword);
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_body);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns NameToken | QualifiedNameToken | Missing | DictToken |
   * KeysetToken | VecToken
   */
  public function getName(): ?EditableToken {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  /**
   * @returns NameToken | QualifiedNameToken | DictToken | KeysetToken |
   * VecToken
   */
  public function getNamex(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new self($this->_keyword, $this->_name, $value);
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @returns NamespaceBody | NamespaceEmptyBody
   */
  public function getBody(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_body);
  }
}
